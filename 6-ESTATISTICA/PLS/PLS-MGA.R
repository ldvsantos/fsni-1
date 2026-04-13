# modelagem PLS-SEM multigrupo aplicada ao estudo ("Avaliar as concentrações e estoques de nitrogênio e fósforo no solo, frações húmicas e frações lábeis em diferentes usos da terra no Cerrado")

library(seminr)
library(DiagrammeR)
library(readxl)
library(dplyr)

# 1. Carregar dados
dados <- read_excel("../banco_dados.xlsx", sheet = "DADOS")

# Preparar dados
dados <- dados %>%
  select(Amb, NLabil, NMOL, NTAF, NTAH, NTHum, NT, EstNT,
         PLabil, PMOL, PTAF, PTAH, PTHum, PT, EstPT) %>%
  filter(!is.na(Amb)) %>%
  mutate(Amb = factor(Amb, levels = 1:5,
       labels = c("Cerrado", "Agriculture", "African mahogany", "Eucalyptus", "Teak")))

# 2. Modelo de mensuração reduzido
modelo_medicao <- constructs(
  composite("N_humico", multi_items("", c("NTAF", "NTAH", "NTHum"))),
  composite("N_labil", multi_items("", c("NLabil", "NMOL"))),
  composite("N_total", multi_items("", c("NT", "EstNT"))),
  
  composite("P_humico", multi_items("", c("PTAF", "PTAH", "PTHum"))),
  composite("P_labil", multi_items("", c("PLabil", "PMOL"))),
  composite("P_total", multi_items("", c("PT", "EstPT")))
)

# 3. Modelo estrutural
modelo_estrutural <- relationships(
  paths(from = c("N_humico", "N_labil"), to = "N_total"),
  paths(from = c("P_humico", "P_labil"), to = "P_total")
)

# 4. Estimar modelo para cada uso da terra
resultados_mg <- list()
for (grupo in levels(dados$Amb)) {
  dados_grupo <- dados %>% filter(Amb == grupo)
  
  resultados_mg[[grupo]] <- estimate_pls(
    data = dados_grupo,
    measurement_model = modelo_medicao,
    structural_model = modelo_estrutural
  )
}

# 5. Resultados por grupo
tabela_coeficientes <- data.frame()
tabela_r2 <- data.frame()

for (grupo in names(resultados_mg)) {
  cat("\n==== Resultados para:", grupo, "====\n")
  print(summary(resultados_mg[[grupo]]))
  
  cat("\n--- Coeficientes de Caminho (Path Coefficients) ---\n")
  coef_path <- resultados_mg[[grupo]]$path_coefficients
  print(coef_path)
  
  # Organizar tabela de coeficientes por grupo
  if (!is.null(coef_path)) {
    coef_df <- as.data.frame(coef_path)
    coef_df$Grupo <- grupo
    tabela_coeficientes <- rbind(tabela_coeficientes, coef_df)
  }
  
  cat("\n--- R² das variáveis endógenas ---\n")
  r2 <- resultados_mg[[grupo]]$r_squared
  print(r2)
  
  if (!is.null(r2)) {
    r2_df <- as.data.frame(r2)
    r2_df$Variavel <- rownames(r2_df)
    r2_df$Grupo <- grupo
    tabela_r2 <- rbind(tabela_r2, r2_df)
  }
}

# Exportar tabelas
write.csv(tabela_coeficientes, "../../5-GRAFICOS/tabela_coeficientes_caminho.csv", row.names = FALSE)
write.csv(tabela_r2, "../../5-GRAFICOS/tabela_r2_pls_sem.csv", row.names = FALSE)



# Supondo que o modelo do grupo "Cerrado" está em resultados_mg[["Cerrado"]]
modelo_cerrado <- resultados_mg[["Cerrado"]]
tryCatch({
  plot(modelo_cerrado)
}, error = function(e) {
  cat("Aviso: Não foi possível gerar plot do modelo.\n")
})

cat("\n✓ Tabelas exportadas com sucesso!\n")
cat("✓ Coeficientes de caminho: 5-GRAFICOS/tabela_coeficientes_caminho.csv\n")
cat("✓ R² do modelo: 5-GRAFICOS/tabela_r2_pls_sem.csv\n")

#Exibir
library(htmltools)

# Gerar os plots
plots <- lapply(names(resultados_mg), function(grupo) {
  tagList(
    tags$h3(paste("Modelo -", grupo)),
    plot(resultados_mg[[grupo]])
  )
})

# Exibir todos no Viewer
browsable(do.call(tagList, plots))








#================================================================================#
# FIGURE 5 – Simplified HCM structural diagram (coefficient ranges)
# Per-group coefficients are reported in Table 2.
# Previous version had 20 overlapping edges (5 groups × 4 paths), making
# the figure unreadable. Reviewer 4 requested simplification and larger fonts.
#================================================================================#

library(DiagrammeR)

diagrama_pls_sem <- grViz("
digraph G {
  graph [layout = dot, rankdir = LR, nodesep = 1.0, ranksep = 1.5, dpi = 300]
  node [style = filled, fontname = 'Helvetica', fontsize = 16, fixedsize = false,
        width = 1.8, height = 0.7]
  edge [fontname = 'Helvetica', fontsize = 14, penwidth = 2]

  // First-order constructs — Nitrogen
  NH [label = 'Humic N\\n(FA-N, HA-N, Humin-N)', shape = box, fillcolor = '#fdfcd9']
  NL [label = 'Labile N\\n(Labile N, LOM-N)', shape = box, fillcolor = '#fdfcd9']

  // First-order constructs — Phosphorus
  PH [label = 'Humic P\\n(FA-P, HA-P, Humin-P)', shape = box, fillcolor = '#e0f7fa']
  PL [label = 'Labile P\\n(Labile P, LOM-P)', shape = box, fillcolor = '#e0f7fa']

  // Second-order endogenous constructs
  NT [label = 'Total N\\n(R\\u00b2 = 0.959)', shape = ellipse, fillcolor = '#bbdefb']
  PT [label = 'Total P\\n(R\\u00b2 = 0.959)', shape = ellipse, fillcolor = '#bbdefb']

  // Structural paths — coefficients shown as range across land uses (Table 2)
  NH -> NT [label = '  \\u03b2 = 1.180 \\u2013 1.372  ', color = '#333333']
  NL -> NT [label = '  \\u03b2 = \\u22120.237 \\u2013 \\u22120.445  ', color = '#333333', style = dashed]
  PH -> PT [label = '  \\u03b2 = 1.180 \\u2013 1.372  ', color = '#333333']
  PL -> PT [label = '  \\u03b2 = \\u22120.237 \\u2013 \\u22120.445  ', color = '#333333', style = dashed]

  // Rank alignment
  { rank = same; NH; NL; PH; PL }
  { rank = same; NT; PT }

  // Note
  NOTE [label = 'Solid = positive path\\nDashed = negative path\\nCoefficient ranges across five land uses (Table 2)',
        shape = note, fillcolor = '#f5f5f5', fontsize = 12]
  }
")

print(diagrama_pls_sem)

# Export to PNG
tryCatch({
  svg_text <- export_svg(diagrama_pls_sem)
  rsvg_png(charToRaw(svg_text), "../../2-FIGURAS/analise_caminhos_pls.png",
           width = 1800, height = 900)
  cat("Figure 5 saved to ../../2-FIGURAS/analise_caminhos_pls.png\n")
}, error = function(e) {
  cat("Auto-export failed. Save manually from RStudio Viewer.\n", e$message, "\n")
})











