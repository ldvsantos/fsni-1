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



library(DiagrammeR)

diagrama_pls_sem <- grViz("
digraph G {
  graph [layout = dot, rankdir = LR]
  node [shape = box, style = filled, fontname = Helvetica, fixedsize = false]
  edge [fontname = Helvetica, fontsize=10]

  // Nós de primeira ordem
  NL [label = 'N_labile', fillcolor = '#fdfcd9']
  NH [label = 'N_humic', fillcolor = '#fdfcd9']
  PL [label = 'P_labile', fillcolor = '#e0f7fa']
  PH [label = 'P_humic', fillcolor = '#e0f7fa']

  // Nós de segunda ordem
  NT [label = 'N_total', shape=ellipse, fillcolor = '#bbdefb']
  PT [label = 'P_total', shape=ellipse, fillcolor = '#bbdefb']

  // GRUPO: Cerrado
  NH -> NT [label='1.286', color='firebrick', penwidth=2]
  NL -> NT [label='-0.313', color='firebrick', penwidth=2, style='dashed']
  PH -> PT [label='1.286', color='firebrick', penwidth=2]
  PL -> PT [label='-0.313', color='firebrick', penwidth=2, style='dashed']

  // GROUP: Agriculture
  NH -> NT [label='1.180', color='black', penwidth=1]
  NL -> NT [label='-0.237', color='black', penwidth=1, style='dashed']
  PH -> PT [label='1.180', color='black', penwidth=1]
  PL -> PT [label='-0.237', color='black', penwidth=1, style='dashed']

  // GROUP: African mahogany
  NH -> NT [label='1.271', color='darkgreen', penwidth=2]
  NL -> NT [label='-0.277', color='darkgreen', penwidth=2, style='dashed']
  PH -> PT [label='1.271', color='darkgreen', penwidth=2]
  PL -> PT [label='-0.277', color='darkgreen', penwidth=2, style='dashed']

  // GROUP: Eucalyptus
  NH -> NT [label='1.275', color='blue', penwidth=2]
  NL -> NT [label='-0.283', color='blue', penwidth=2, style='dashed']
  PH -> PT [label='1.275', color='blue', penwidth=2]
  PL -> PT [label='-0.283', color='blue', penwidth=2, style='dashed']

  // GROUP: Teak
  NH -> NT [label='1.372', color='orange3', penwidth=2]
  NL -> NT [label='-0.445', color='orange3', penwidth=2, style='dashed']
  PH -> PT [label='1.372', color='orange3', penwidth=2]
  PL -> PT [label='-0.445', color='orange3', penwidth=2, style='dashed']
  
  // Legendas (inseridas como caixas não conectadas)
  LEG1 [label='Cerrado', shape=rect, fillcolor='firebrick', fontcolor='white', style=filled]
  LEG2 [label='Agriculture', shape=rect, fillcolor='black', fontcolor='white', style=filled]
  LEG3 [label='African mahogany', shape=rect, fillcolor='darkgreen', fontcolor='white', style=filled]
  LEG4 [label='Eucalyptus', shape=rect, fillcolor='blue', fontcolor='white', style=filled]
  LEG5 [label='Teak', shape=rect, fillcolor='orange3', fontcolor='white', style=filled]

  }
")

print(diagrama_pls_sem)

# Exportar diagrama como PNG
export_diagram <- function(diagram, filename) {
  # Usar DiagrammeRsvg para converter SVG para PNG
  svg_text <- capture.output(print(diagram))
  svg_file <- tempfile(fileext = ".svg")
  png_file <- filename
  
  # Salvar SVG temporário
  cat(svg_text, file = svg_file)
  
  # Converter para PNG usando DiagrammeRsvg
  rsvg::rsvg_png(svg = svg_file, file = png_file, width = 1200, height = 800)
}

# Tentar exportar (pode requer bibliotecas adicionais)
tryCatch({
  export_diagram(diagrama_pls_sem, "../../2-FIGURAS/diagrama_pls_sem.png")
}, error = function(e) {
  cat("Aviso: Não foi possível exportar PNG. Salve manualmente o diagrama do Viewer.\n")
})











