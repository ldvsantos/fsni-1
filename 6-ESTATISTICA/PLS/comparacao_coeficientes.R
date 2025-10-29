# Script para gerar gráficos de comparação de coeficientes entre usos da terra
# Baseado nos resultados do PLS-MGA

library(ggplot2)
library(dplyr)
library(readxl)
library(seminr)

# Carregar dados
dados <- read_excel("../banco_dados.xlsx", sheet = "DADOS")

# Preparar dados
dados <- dados %>%
  select(Amb, NLabil, NMOL, NTAF, NTAH, NTHum, NT, EstNT,
         PLabil, PMOL, PTAF, PTAH, PTHum, PT, EstPT) %>%
  filter(!is.na(Amb)) %>%
  mutate(Amb = factor(Amb, levels = 1:5,
                      labels = c("Cerrado", "Agricultura", "Mogno", "Eucalipto", "Teca")))

# Modelo de mensuração
modelo_medicao <- constructs(
  composite("N_humico", multi_items("", c("NTAF", "NTAH", "NTHum"))),
  composite("N_labil", multi_items("", c("NLabil", "NMOL"))),
  composite("N_total", multi_items("", c("NT", "EstNT"))),
  
  composite("P_humico", multi_items("", c("PTAF", "PTAH", "PTHum"))),
  composite("P_labil", multi_items("", c("PLabil", "PMOL"))),
  composite("P_total", multi_items("", c("PT", "EstPT")))
)

# Modelo estrutural
modelo_estrutural <- relationships(
  paths(from = c("N_humico", "N_labil"), to = "N_total"),
  paths(from = c("P_humico", "P_labil"), to = "P_total")
)

# Estimar modelos por grupo
resultados_mg <- list()
coef_matriz <- data.frame()

for (grupo in levels(dados$Amb)) {
  dados_grupo <- dados %>% filter(Amb == grupo)
  
  resultados_mg[[grupo]] <- estimate_pls(
    data = dados_grupo,
    measurement_model = modelo_medicao,
    structural_model = modelo_estrutural
  )
  
  # Extrair coeficientes de caminho
  coef_path <- as.data.frame(resultados_mg[[grupo]]$path_coefficients)
  coef_path$Relacionamento <- rownames(coef_path)
  coef_path$Grupo <- grupo
  coef_path$Coeficiente <- coef_path[, 1]
  
  coef_matriz <- rbind(coef_matriz, coef_path[, c("Relacionamento", "Grupo", "Coeficiente")])
}

# Gráfico de comparação dos coeficientes de caminho
grafico_comparacao <- ggplot(coef_matriz, aes(x = Relacionamento, y = Coeficiente, fill = Grupo)) +
  geom_bar(stat = "identity", position = "dodge", color = "black", size = 0.3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Comparação dos Coeficientes de Caminho entre Usos da Terra",
    x = "Relacionamento",
    y = "Coeficiente",
    fill = "Uso da Terra"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "right"
  )

print(grafico_comparacao)

# Exportar gráfico
ggsave("../../2-FIGURAS/comparacao_coeficientes.png", plot = grafico_comparacao, width = 12, height = 8, dpi = 300)

# Exportar tabela de coeficientes
write.csv(coef_matriz, "../../5-GRAFICOS/tabela_coeficientes_estratificados.csv", row.names = FALSE)

cat("\n✓ Gráfico de comparação exportado para: 2-FIGURAS/comparacao_coeficientes.png\n")
cat("✓ Tabela de coeficientes exportada para: 5-GRAFICOS/tabela_coeficientes_estratificados.csv\n")
