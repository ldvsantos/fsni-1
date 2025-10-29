# modelagem PLS-SEM multigrupo aplicada ao estudo ("Avaliar as concentrações e estoques de nitrogênio e fósforo no solo, frações húmicas e frações lábeis em diferentes usos da terra no Cerrado")


# Instalar pacotes se necessário
install.packages("seminr")
install.packages("readxl")
install.packages("dplyr")
install.packages("DiagrammeR")
install.packages("DiagrammeRsvg")
install.packages("rsvg")

library(seminr)
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(seminr)
library(readxl)
library(dplyr)

# 1. Carregar dados
dados <- read_excel("banco_dados.xlsx", sheet = "dados")

# Preparar dados
dados <- dados %>%
  select(Amb, NLabil, NMOL, NTAF, NTAH, NTHum, NT, EstNT,
         PLabil, PMOL, PTAF, PTAH, PTHum, PT, EstPT) %>%
  filter(!is.na(Amb)) %>%
  mutate(Amb = factor(Amb, levels = 1:5,
                      labels = c("Cerrado", "Agricultura", "Mogno", "Eucalipto", "Teca")))

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
for (grupo in names(resultados_mg)) {
  cat("\n==== Resultados para:", grupo, "====\n")
  print(summary(resultados_mg[[grupo]]))
  
  cat("\n--- Coeficientes de Caminho (Path Coefficients) ---\n")
  print(resultados_mg[[grupo]]$path_coefficients)
  
  cat("\n--- R² das variáveis endógenas ---\n")
  print(resultados_mg[[grupo]]$r_squared)
}



# Supondo que o modelo do grupo "Cerrado" está em resultados_mg[["Cerrado"]]
modelo_cerrado <- resultados_mg[["Cerrado"]]
plot(modelo_cerrado)

modelo_agricultura <- resultados_mg[["Agricultura"]]
plot(modelo_agricultura)




# Gerar visualização com o seminr
modelo_plot <- plot(modelo_cerrado)

# Converter para SVG e salvar como PNG
graph_svg <- export_svg(modelo_plot)  # Exporta em SVG
graph_png <- charToRaw(graph_svg) %>% rsvg_png("modelo_cerrado.png", width = 1500, height = 1000)





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

grViz("
digraph G {
  graph [layout = dot, rankdir = LR]
  node [shape = box, style = filled, fontname = Helvetica, fixedsize = false]
  edge [fontname = Helvetica, fontsize=10]

  // Nós de primeira ordem
  NL [label = 'N_labil', fillcolor = '#fdfcd9']
  NH [label = 'N_humico', fillcolor = '#fdfcd9']
  PL [label = 'P_labil', fillcolor = '#e0f7fa']
  PH [label = 'P_humico', fillcolor = '#e0f7fa']

  // Nós de segunda ordem
  NT [label = 'N_total', shape=ellipse, fillcolor = '#bbdefb']
  PT [label = 'P_total', shape=ellipse, fillcolor = '#bbdefb']

  // GRUPO: Cerrado
  NH -> NT [label='1.286', color='firebrick', penwidth=2]
  NL -> NT [label='-0.313', color='firebrick', penwidth=2, style='dashed']
  PH -> PT [label='1.286', color='firebrick', penwidth=2]
  PL -> PT [label='-0.313', color='firebrick', penwidth=2, style='dashed']

  // GRUPO: Agricultura
  NH -> NT [label='1.180', color='black', penwidth=1]
  NL -> NT [label='-0.237', color='black', penwidth=1, style='dashed']
  PH -> PT [label='1.180', color='black', penwidth=1]
  PL -> PT [label='-0.237', color='black', penwidth=1, style='dashed']

  // GRUPO: Mogno
  NH -> NT [label='1.271', color='darkgreen', penwidth=2]
  NL -> NT [label='-0.277', color='darkgreen', penwidth=2, style='dashed']
  PH -> PT [label='1.271', color='darkgreen', penwidth=2]
  PL -> PT [label='-0.277', color='darkgreen', penwidth=2, style='dashed']

  // GRUPO: Eucalipto
  NH -> NT [label='1.275', color='blue', penwidth=2]
  NL -> NT [label='-0.283', color='blue', penwidth=2, style='dashed']
  PH -> PT [label='1.275', color='blue', penwidth=2]
  PL -> PT [label='-0.283', color='blue', penwidth=2, style='dashed']

  // GRUPO: Teca
  NH -> NT [label='1.372', color='orange3', penwidth=2]
  NL -> NT [label='-0.445', color='orange3', penwidth=2, style='dashed']
  PH -> PT [label='1.372', color='orange3', penwidth=2]
  PL -> PT [label='-0.445', color='orange3', penwidth=2, style='dashed']
  
  // Legendas (inseridas como caixas não conectadas)
  LEG1 [label='Cerrado', shape=rect, fillcolor='firebrick', fontcolor='white', style=filled]
  LEG2 [label='Agricultura', shape=rect, fillcolor='black', fontcolor='white', style=filled]
  LEG3 [label='Mogno', shape=rect, fillcolor='darkgreen', fontcolor='white', style=filled]
  LEG4 [label='Eucalipto', shape=rect, fillcolor='blue', fontcolor='white', style=filled]
  LEG5 [label='Teca', shape=rect, fillcolor='orange3', fontcolor='white', style=filled]

  }
")











