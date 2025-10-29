# Script para gerar gráfico de comparação de coeficientes baseado em dados conhecidos

library(ggplot2)
library(dplyr)

# Dados dos coeficientes obtidos do PLS-MGA
coef_matriz <- data.frame(
  Grupo = c("Cerrado", "Cerrado", "Agricultura", "Agricultura", 
            "Mogno", "Mogno", "Eucalipto", "Eucalipto", "Teca", "Teca"),
  Relacionamento = c("N_humico -> N_total", "N_labil -> N_total",
                     "N_humico -> N_total", "N_labil -> N_total",
                     "N_humico -> N_total", "N_labil -> N_total",
                     "N_humico -> N_total", "N_labil -> N_total",
                     "N_humico -> N_total", "N_labil -> N_total"),
  Coeficiente = c(1.286, -0.313,
                  1.180, -0.237,
                  1.271, -0.277,
                  1.275, -0.283,
                  1.372, -0.445)
)

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
