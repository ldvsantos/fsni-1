# ==============================================================================
# SCRIPT PARA GERAR FIGURAS DO SISTEMA FUZZY
# Salva automaticamente na pasta 5-GRAFICOS
# ==============================================================================

# --------------------------------------------------------------------------
# 0. INSTALAÇÃO E CARREGAMENTO DE PACOTES
# --------------------------------------------------------------------------
library(readxl)
library(dplyr)
library(ggplot2)
library(janitor)
library(seminr)
library(FuzzyR)
library(tidyr)

# --------------------------------------------------------------------------
# 1. PREPARAÇÃO DO AMBIENTE
# --------------------------------------------------------------------------
rm(list = ls())
graphics.off()
cat("\014")

# Definir pasta de saída para figuras
pasta_figuras <- "../5-GRAFICOS"
if (!dir.exists(pasta_figuras)) {
  dir.create(pasta_figuras, recursive = TRUE)
}

# --------------------------------------------------------------------------
# 2. CARREGAR E PREPARAR OS DADOS
# --------------------------------------------------------------------------
dados <- read_excel("data_base_22072025.xlsx", sheet = "DADOS") %>% clean_names()

colunas_necessarias <- c(
  "amb", "prof","rep", "nlabil", "nmol", "ntaf", "ntah", "nthum", "nt",
  "estnt", "estnaf", "estnah", "estnthum", "estnlabil", "estnmol",
  "plabil", "pmol", "ptaf", "ptah", "pthum", "pt",
  "estpt", "estpaf", "estpah", "estpthum", "estplabil", "estpmol",
  "ds", "areia", "silte", "argila"
)

dados <- dados[complete.cases(dados[, colunas_necessarias]), ]

# --------------------------------------------------------------------------
# 3. CONSTRUIR E NORMALIZAR CONSTRUTOS
# --------------------------------------------------------------------------
normalizar <- function(x) {
  if (max(x, na.rm = TRUE) == min(x, na.rm = TRUE)) return(rep(0.5, length(x)))
  return((x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE)))
}

normalizar_invertido <- function(x) {
  x <- -1 * x
  normalizar(x)
}

dados_norm <- dados %>%
  mutate(
    n_labil  = rowMeans(across(c(nlabil, nmol)), na.rm = TRUE),
    n_humico = rowMeans(across(c(ntaf, ntah, nthum)), na.rm = TRUE),
    p_labil  = rowMeans(across(c(plabil, pmol)), na.rm = TRUE),
    p_humico = rowMeans(across(c(ptaf, ptah, pthum)), na.rm = TRUE),
    n_total  = rowMeans(across(c(nt, estnt)), na.rm = TRUE),
    p_total  = rowMeans(across(c(pt, estpt)), na.rm = TRUE)
  ) %>%
  mutate(across(c(n_labil, n_humico, p_labil, p_humico, n_total, p_total, ds, areia, silte, argila), normalizar))

# --------------------------------------------------------------------------
# 4. CRIAR SISTEMA FUZZY
# --------------------------------------------------------------------------
fis <- newfis("IF_fuzzy", defuzzMethod = "centroid")

fis <- addvar(fis, "input", "N_total", c(0, 1))
fis <- addvar(fis, "input", "P_total", c(0, 1))
fis <- addvar(fis, "input", "Ds",      c(0, 1))
fis <- addvar(fis, "output", "Qualidade", c(0, 10))

params_in_baixa <- c(0, 0, 0.4)
params_in_media <- c(0.3, 0.5, 0.7)
params_in_alta  <- c(0.5, 0.8, 1.0)

for (i in 1:3) {
  fis <- addmf(fis, "input", i, "baixa", "trimf", params_in_baixa)
  fis <- addmf(fis, "input", i, "media", "trimf", params_in_media)
  fis <- addmf(fis, "input", i, "alta",  "trimf", params_in_alta)
}

params_out_baixa <- c(0, 0, 4)
params_out_media <- c(3, 5, 7)
params_out_alta <- c(6, 10, 10)

fis <- addmf(fis, "output", 1, "baixa", "trimf", params_out_baixa)
fis <- addmf(fis, "output", 1, "media", "trimf", params_out_media)
fis <- addmf(fis, "output", 1, "alta",  "trimf", params_out_alta)

regras_fuzzy <- matrix(c(
  3, 3, 1, 3, 1.0, 1,
  3, 3, 2, 3, 1.0, 1,
  2, 2, 1, 2, 1.0, 1,
  2, 2, 2, 2, 1.0, 1,
  3, 2, 1, 2, 1.0, 1,
  2, 3, 1, 2, 1.0, 1,
  1, 1, 1, 1, 1.0, 1,
  1, 1, 2, 1, 1.0, 1,
  1, 1, 3, 1, 1.0, 1,
  3, 3, 3, 1, 1.5, 1,
  2, 2, 3, 1, 1.5, 1,
  3, 2, 3, 1, 1.5, 1,
  2, 3, 3, 1, 1.5, 1,
  2, 2, 1, 3, 1.0, 1,
  2, 3, 1, 3, 1.0, 1,
  3, 2, 1, 3, 1.0, 1
), ncol = 6, byrow = TRUE)

fis <- addrule(fis, regras_fuzzy)

entrada_fuzzy <- dados_norm %>%
  select(n_total, p_total, ds) %>%
  as.matrix()

dados_norm$if_valor_fuzzy <- apply(entrada_fuzzy, 1, function(l) {
  evalfis(matrix(l, nrow = 1), fis)
})

dados_norm$classificacao_linguistica <- cut(dados_norm$if_valor_fuzzy,
                                            breaks = c(0, 3.33, 6.66, 10),
                                            labels = c("baixa", "media", "alta"),
                                            include.lowest = TRUE)

# --------------------------------------------------------------------------
# 5. GERAR FIGURA 1: FUNÇÕES DE PERTINÊNCIA DAS VARIÁVEIS DE ENTRADA
# --------------------------------------------------------------------------
cat("\nGerando Figura 1: Funções de Pertinência - Variáveis de Entrada...\n")

# Criar dataframe para as funções de pertinência
x_seq <- seq(0, 1, length.out = 200)

df_pertinencia <- data.frame(
  x = rep(x_seq, 9),
  Variável = rep(c("N total", "P total", "Densidade do solo"), each = length(x_seq) * 3),
  Termo = rep(rep(c("Baixa", "Média", "Alta"), each = length(x_seq)), 3)
)

# Calcular valores de pertinência
calcular_trimf <- function(x, params) {
  a <- params[1]
  b <- params[2]
  c <- params[3]
  pmax(0, pmin((x - a) / (b - a), (c - x) / (c - b)))
}

df_pertinencia$y <- NA
for (i in 1:nrow(df_pertinencia)) {
  x_val <- df_pertinencia$x[i]
  termo <- df_pertinencia$Termo[i]
  
  if (termo == "Baixa") {
    df_pertinencia$y[i] <- calcular_trimf(x_val, params_in_baixa)
  } else if (termo == "Média") {
    df_pertinencia$y[i] <- calcular_trimf(x_val, params_in_media)
  } else {
    df_pertinencia$y[i] <- calcular_trimf(x_val, params_in_alta)
  }
}

fig1 <- ggplot(df_pertinencia, aes(x = x, y = y, color = Termo, linetype = Termo)) +
  geom_line(linewidth = 1) +
  facet_wrap(~ Variável, ncol = 1, scales = "free_y") +
  scale_color_manual(values = c("Baixa" = "#E41A1C", "Média" = "#377EB8", "Alta" = "#4DAF4A")) +
  scale_linetype_manual(values = c("Baixa" = "solid", "Média" = "dashed", "Alta" = "dotted")) +
  labs(
    x = "Valor normalizado (0-1)",
    y = "Grau de pertinência",
    color = "Termo linguístico",
    linetype = "Termo linguístico"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "bottom",
    strip.text = element_text(face = "bold")
  )

ggsave(
  filename = file.path(pasta_figuras, "fuzzy_fig1_funcoes_pertinencia_entrada.png"),
  plot = fig1,
  width = 8,
  height = 10,
  dpi = 300
)

cat("✓ Figura 1 salva: fuzzy_fig1_funcoes_pertinencia_entrada.png\n")

# --------------------------------------------------------------------------
# 6. GERAR FIGURA 2: FUNÇÕES DE PERTINÊNCIA DA VARIÁVEL DE SAÍDA
# --------------------------------------------------------------------------
cat("\nGerando Figura 2: Funções de Pertinência - Variável de Saída (FSNSI)...\n")

x_seq_out <- seq(0, 10, length.out = 200)

df_saida <- data.frame(
  x = rep(x_seq_out, 3),
  Termo = rep(c("Baixa", "Média", "Alta"), each = length(x_seq_out))
)

df_saida$y <- NA
for (i in 1:nrow(df_saida)) {
  x_val <- df_saida$x[i]
  termo <- df_saida$Termo[i]
  
  if (termo == "Baixa") {
    df_saida$y[i] <- calcular_trimf(x_val, params_out_baixa)
  } else if (termo == "Média") {
    df_saida$y[i] <- calcular_trimf(x_val, params_out_media)
  } else {
    df_saida$y[i] <- calcular_trimf(x_val, params_out_alta)
  }
}

fig2 <- ggplot(df_saida, aes(x = x, y = y, color = Termo, linetype = Termo)) +
  geom_line(linewidth = 1.2) +
  scale_color_manual(values = c("Baixa" = "#E41A1C", "Média" = "#377EB8", "Alta" = "#4DAF4A")) +
  scale_linetype_manual(values = c("Baixa" = "solid", "Média" = "dashed", "Alta" = "dotted")) +
  labs(
    x = "FSNSI (0-10)",
    y = "Grau de pertinência",
    color = "Qualidade funcional",
    linetype = "Qualidade funcional"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "bottom"
  )

ggsave(
  filename = file.path(pasta_figuras, "fuzzy_fig2_funcao_pertinencia_saida.png"),
  plot = fig2,
  width = 8,
  height = 5,
  dpi = 300
)

cat("✓ Figura 2 salva: fuzzy_fig2_funcao_pertinencia_saida.png\n")

# --------------------------------------------------------------------------
# 7. GERAR FIGURA 3: BOXPLOT DO FSNSI POR USO DA TERRA (COM PADRÕES)
# --------------------------------------------------------------------------
cat("\nGerando Figura 3: Boxplot FSNSI por Uso da Terra...\n")

# Carregar ggpattern se necessário
if (!require("ggpattern", quietly = TRUE)) {
  install.packages("ggpattern")
  library(ggpattern)
}

# Preparar dados
dados_norm$amb <- factor(dados_norm$amb,
                         levels = 1:5,
                         labels = c("Cerrado", "Conventional\nAgriculture", "Mahogany", "Eucalyptus", "Teak"))

fig3 <- ggplot(dados_norm, aes(x = amb, y = if_valor_fuzzy)) +
  geom_boxplot_pattern(
    aes(pattern = amb, fill = amb),
    width = 0.5,
    pattern_density = 0.4,
    pattern_angle = 45,
    pattern_spacing = 0.05,
    pattern_key_scale_factor = 0.6,
    outlier.shape = NA,
    alpha = 0.6
  ) +
  geom_jitter(aes(color = amb), width = 0.2, alpha = 0.6, size = 2) +
  scale_pattern_manual(values = c(
    "Cerrado" = "stripe",
    "Conventional\nAgriculture" = "crosshatch",
    "Mahogany" = "circle",
    "Eucalyptus" = "pch",
    "Teak" = "magick"
  )) +
  scale_fill_brewer(palette = "Set1") +
  scale_color_brewer(palette = "Set1") +
  scale_y_continuous(limits = c(0, 10), expand = expansion(mult = c(0.05, 0.05))) +
  labs(
    title = "Fuzzy Soil Nutrient Sustainability Index",
    x = "Uso da Terra",
    y = "FSNSI (0–10)"
  ) +
  guides(
    fill = "none",
    pattern = guide_legend(
      title = "Graph legend",
      override.aes = list(
        fill = RColorBrewer::brewer.pal(5, "Set1")
      )
    ),
    color = guide_legend(title = "Graph legend")
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "right"
  )

ggsave(
  filename = file.path(pasta_figuras, "fuzzy_fig3_boxplot_fsnsi_uso_terra.png"),
  plot = fig3,
  width = 8,
  height = 6,
  dpi = 300
)

cat("✓ Figura 3 salva: fuzzy_fig3_boxplot_fsnsi_uso_terra.png\n")

# --------------------------------------------------------------------------
# 8. GERAR FIGURA 4: BARPLOT COM ERRO PADRÃO DO FSNSI POR USO DA TERRA
# --------------------------------------------------------------------------
cat("\nGerando Figura 4: Barplot FSNSI com erro padrão por Uso da Terra...\n")

# Calcular estatísticas por uso da terra
resumo_fsnsi <- dados_norm %>%
  group_by(amb) %>%
  summarise(
    media = mean(if_valor_fuzzy, na.rm = TRUE),
    sd = sd(if_valor_fuzzy, na.rm = TRUE),
    n = n(),
    se = sd / sqrt(n),
    .groups = "drop"
  )

fig4 <- ggplot(resumo_fsnsi, aes(x = amb, y = media, fill = amb)) +
  geom_col(alpha = 0.8, color = "black", linewidth = 0.5) +
  geom_errorbar(aes(ymin = media - se, ymax = media + se), 
                width = 0.3, linewidth = 0.8) +
  scale_fill_brewer(palette = "Dark2") +
  scale_y_continuous(limits = c(0, 10), breaks = seq(0, 10, 2), expand = c(0, 0)) +
  labs(
    x = "Uso da Terra",
    y = "FSNSI médio (± EP)",
    fill = "Uso da Terra"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none",
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank()
  )

ggsave(
  filename = file.path(pasta_figuras, "fuzzy_fig4_barplot_fsnsi_uso_terra.png"),
  plot = fig4,
  width = 8,
  height = 6,
  dpi = 300
)

cat("✓ Figura 4 salva: fuzzy_fig4_barplot_fsnsi_uso_terra.png\n")

# --------------------------------------------------------------------------
# 9. GERAR FIGURA 5: FSNSI POR PROFUNDIDADE E USO DA TERRA
# --------------------------------------------------------------------------
cat("\nGerando Figura 5: FSNSI por Profundidade e Uso da Terra...\n")

# Preparar dados com profundidade
dados_norm$prof <- factor(dados_norm$prof,
                          levels = c("0-10", "10-20", "20-30", "30-40", "40-50"),
                          labels = c("0-10 cm", "10-20 cm", "20-30 cm", "30-40 cm", "40-50 cm"))

fig5 <- ggplot(dados_norm, aes(x = prof, y = if_valor_fuzzy, fill = amb)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  geom_jitter(aes(color = amb), width = 0.2, alpha = 0.5, size = 1) +
  scale_fill_brewer(palette = "Set1") +
  scale_color_brewer(palette = "Set1") +
  scale_y_continuous(limits = c(0, 10), breaks = seq(0, 10, 2)) +
  facet_wrap(~ amb, ncol = 2) +
  labs(
    x = "Profundidade",
    y = "FSNSI (0-10)",
    fill = "Uso da Terra"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 9),
    legend.position = "none",
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold")
  )

ggsave(
  filename = file.path(pasta_figuras, "fuzzy_fig5_fsnsi_profundidade_uso_terra.png"),
  plot = fig5,
  width = 10,
  height = 8,
  dpi = 300
)

cat("✓ Figura 5 salva: fuzzy_fig5_fsnsi_profundidade_uso_terra.png\n")

# --------------------------------------------------------------------------
# 10. GERAR RELATÓRIOS CONSOLIDADOS PARA ANÁLISE E DISCUSSÃO
# --------------------------------------------------------------------------
cat("\n")
cat("==============================================================================\n")
cat("GERANDO RELATÓRIOS CONSOLIDADOS PARA ANÁLISE\n")
cat("==============================================================================\n")

# --------------------------------------------------------------------------
# 10.1 ESTATÍSTICAS DESCRITIVAS DO FSNSI POR USO DA TERRA
# --------------------------------------------------------------------------
cat("\n[1/6] Estatísticas descritivas do FSNSI por uso da terra...\n")

tabela_estatisticas <- dados_norm %>%
  group_by(amb) %>%
  summarise(
    n = n(),
    Média = round(mean(if_valor_fuzzy, na.rm = TRUE), 2),
    DP = round(sd(if_valor_fuzzy, na.rm = TRUE), 2),
    EP = round(sd(if_valor_fuzzy, na.rm = TRUE) / sqrt(n()), 2),
    CV_percent = round((sd(if_valor_fuzzy, na.rm = TRUE) / mean(if_valor_fuzzy, na.rm = TRUE)) * 100, 2),
    Mínimo = round(min(if_valor_fuzzy, na.rm = TRUE), 2),
    Q1 = round(quantile(if_valor_fuzzy, 0.25, na.rm = TRUE), 2),
    Mediana = round(median(if_valor_fuzzy, na.rm = TRUE), 2),
    Q3 = round(quantile(if_valor_fuzzy, 0.75, na.rm = TRUE), 2),
    Máximo = round(max(if_valor_fuzzy, na.rm = TRUE), 2),
    .groups = "drop"
  )

# Adicionar classificação predominante e percentuais
tabela_class_completa <- dados_norm %>%
  group_by(amb, classificacao_linguistica) %>%
  summarise(n = n(), .groups = "drop") %>%
  group_by(amb) %>%
  mutate(
    percentual = round((n / sum(n)) * 100, 1),
    classe_label = paste0(classificacao_linguistica, " (", percentual, "%)")
  ) %>%
  arrange(amb, desc(n)) %>%
  summarise(
    Classificação_predominante = first(classificacao_linguistica),
    Distribuição_classes = paste(classe_label, collapse = "; "),
    .groups = "drop"
  )

tabela_final <- left_join(tabela_estatisticas, tabela_class_completa, by = "amb")

write.csv(tabela_final, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_01_estatisticas_descritivas.csv"),
          row.names = FALSE)

print(tabela_final)
cat("✓ Salvo: fuzzy_relatorio_01_estatisticas_descritivas.csv\n")

# --------------------------------------------------------------------------
# 10.2 ESTATÍSTICAS POR PROFUNDIDADE E USO DA TERRA
# --------------------------------------------------------------------------
cat("\n[2/6] Estatísticas do FSNSI por profundidade e uso da terra...\n")

tabela_prof <- dados_norm %>%
  group_by(amb, prof) %>%
  summarise(
    n = n(),
    Média = round(mean(if_valor_fuzzy, na.rm = TRUE), 2),
    DP = round(sd(if_valor_fuzzy, na.rm = TRUE), 2),
    EP = round(sd(if_valor_fuzzy, na.rm = TRUE) / sqrt(n()), 2),
    Mediana = round(median(if_valor_fuzzy, na.rm = TRUE), 2),
    .groups = "drop"
  )

write.csv(tabela_prof, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_02_fsnsi_por_profundidade.csv"),
          row.names = FALSE)

print(tabela_prof)
cat("✓ Salvo: fuzzy_relatorio_02_fsnsi_por_profundidade.csv\n")

# --------------------------------------------------------------------------
# 10.3 ANÁLISE DE VARIÂNCIA (ANOVA) E TESTE DE TUKEY
# --------------------------------------------------------------------------
cat("\n[3/6] Análise de variância (ANOVA) e teste de comparação múltipla...\n")

# ANOVA
modelo_anova <- aov(if_valor_fuzzy ~ amb, data = dados_norm)
resumo_anova <- summary(modelo_anova)

# Teste de Tukey
tukey_test <- TukeyHSD(modelo_anova)
tukey_df <- as.data.frame(tukey_test$amb)
tukey_df$Comparação <- rownames(tukey_df)
tukey_df <- tukey_df[, c("Comparação", "diff", "lwr", "upr", "p adj")]
colnames(tukey_df) <- c("Comparação", "Diferença", "IC_inferior", "IC_superior", "p_ajustado")
tukey_df$Significância <- ifelse(tukey_df$p_ajustado < 0.001, "***",
                                  ifelse(tukey_df$p_ajustado < 0.01, "**",
                                         ifelse(tukey_df$p_ajustado < 0.05, "*", "ns")))
tukey_df <- tukey_df %>%
  mutate(across(c(Diferença, IC_inferior, IC_superior), ~round(., 2))) %>%
  mutate(p_ajustado = format.pval(p_ajustado, digits = 3))

write.csv(tukey_df, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_03_teste_tukey.csv"),
          row.names = FALSE)

# Salvar resumo ANOVA
sink(file.path(pasta_figuras, "fuzzy_relatorio_03_anova_resumo.txt"))
cat("==============================================================================\n")
cat("ANÁLISE DE VARIÂNCIA (ANOVA) - FSNSI por Uso da Terra\n")
cat("==============================================================================\n\n")
print(resumo_anova)
cat("\n==============================================================================\n")
cat("TESTE DE TUKEY HSD - Comparações Múltiplas\n")
cat("==============================================================================\n\n")
print(tukey_df)
sink()

print(tukey_df)
cat("✓ Salvo: fuzzy_relatorio_03_teste_tukey.csv\n")
cat("✓ Salvo: fuzzy_relatorio_03_anova_resumo.txt\n")

# --------------------------------------------------------------------------
# 10.4 CORRELAÇÕES ENTRE VARIÁVEIS DE ENTRADA E FSNSI
# --------------------------------------------------------------------------
cat("\n[4/6] Análise de correlação entre variáveis de entrada e FSNSI...\n")

# Selecionar variáveis para correlação
dados_corr <- dados_norm %>%
  select(n_total, p_total, ds, n_labil, n_humico, p_labil, p_humico, 
         areia, silte, argila, if_valor_fuzzy)

# Matriz de correlação
matriz_corr <- cor(dados_corr, use = "complete.obs")
matriz_corr_round <- round(matriz_corr, 3)

# Salvar matriz de correlação
write.csv(matriz_corr_round, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_04_matriz_correlacao.csv"))

# Correlações específicas com FSNSI
corr_fsnsi <- data.frame(
  Variável = colnames(dados_corr)[-ncol(dados_corr)],
  Correlação_Pearson = round(matriz_corr[, "if_valor_fuzzy"][-nrow(matriz_corr)], 3)
) %>%
  arrange(desc(abs(Correlação_Pearson)))

# Teste de significância das correlações
corr_tests <- sapply(colnames(dados_corr)[-ncol(dados_corr)], function(var) {
  test <- cor.test(dados_corr[[var]], dados_corr$if_valor_fuzzy, method = "pearson")
  c(p_valor = test$p.value, IC_inf = test$conf.int[1], IC_sup = test$conf.int[2])
})

corr_fsnsi$p_valor <- format.pval(corr_tests["p_valor", ], digits = 3)
corr_fsnsi$IC_inferior <- round(corr_tests["IC_inf", ], 3)
corr_fsnsi$IC_superior <- round(corr_tests["IC_sup", ], 3)
corr_fsnsi$Significância <- ifelse(as.numeric(corr_tests["p_valor", ]) < 0.001, "***",
                                    ifelse(as.numeric(corr_tests["p_valor", ]) < 0.01, "**",
                                           ifelse(as.numeric(corr_tests["p_valor", ]) < 0.05, "*", "ns")))

write.csv(corr_fsnsi, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_04_correlacoes_fsnsi.csv"),
          row.names = FALSE)

print(corr_fsnsi)
cat("✓ Salvo: fuzzy_relatorio_04_matriz_correlacao.csv\n")
cat("✓ Salvo: fuzzy_relatorio_04_correlacoes_fsnsi.csv\n")

# --------------------------------------------------------------------------
# 10.5 RANKING E CLASSIFICAÇÃO DOS SISTEMAS
# --------------------------------------------------------------------------
cat("\n[5/6] Ranking e classificação dos sistemas por funcionalidade...\n")

ranking <- tabela_estatisticas %>%
  select(amb, Média, DP, EP, CV_percent) %>%
  arrange(desc(Média)) %>%
  mutate(
    Posição = row_number(),
    Classificação_funcional = case_when(
      Média >= 6.7 ~ "Alta",
      Média >= 3.4 ~ "Média",
      TRUE ~ "Baixa"
    )
  ) %>%
  select(Posição, everything())

write.csv(ranking, 
          file = file.path(pasta_figuras, "fuzzy_relatorio_05_ranking_sistemas.csv"),
          row.names = FALSE)

print(ranking)
cat("✓ Salvo: fuzzy_relatorio_05_ranking_sistemas.csv\n")

# --------------------------------------------------------------------------
# 10.6 RESUMO EXECUTIVO PARA DISCUSSÃO
# --------------------------------------------------------------------------
cat("\n[6/6] Gerando resumo executivo para discussão...\n")

sink(file.path(pasta_figuras, "fuzzy_relatorio_06_resumo_executivo.txt"))
cat("==============================================================================\n")
cat("RESUMO EXECUTIVO - ANÁLISE FUZZY DE SUSTENTABILIDADE EDÁFICA\n")
cat("==============================================================================\n\n")

cat("1. OBJETIVO\n")
cat("   Avaliar a funcionalidade edáfica de diferentes usos da terra no sul do\n")
cat("   Tocantins por meio do Índice Fuzzy de Sustentabilidade Edáfica (FSNSI).\n\n")

cat("2. SISTEMAS AVALIADOS\n")
cat("   - Cerrado nativo (referência)\n")
cat("   - Agricultura convencional\n")
cat("   - Mogno-africano (Khaya ivorensis)\n")
cat("   - Eucalipto (Eucalyptus sp.)\n")
cat("   - Teca (Tectona grandis)\n\n")

cat("3. AMOSTRAGEM\n")
cat("   - Total de amostras:", nrow(dados_norm), "\n")
cat("   - Amostras por uso da terra:", unique(table(dados_norm$amb)), "\n")
cat("   - Profundidades avaliadas: 0-10, 10-20, 20-30, 30-40, 40-50 cm\n\n")

cat("4. RESULTADOS PRINCIPAIS\n\n")
cat("   4.1 Ranking de Funcionalidade (FSNSI médio)\n")
for (i in 1:nrow(ranking)) {
  cat(sprintf("       %d. %-20s FSNSI = %.2f ± %.2f (EP = %.2f) [%s]\n",
              ranking$Posição[i],
              ranking$amb[i],
              ranking$Média[i],
              ranking$DP[i],
              ranking$EP[i],
              ranking$Classificação_funcional[i]))
}

cat("\n   4.2 Distribuição por Classe de Funcionalidade\n")
dist_classes <- dados_norm %>%
  group_by(classificacao_linguistica) %>%
  summarise(n = n(), .groups = "drop") %>%
  mutate(percentual = round((n / sum(n)) * 100, 1))

for (i in 1:nrow(dist_classes)) {
  cat(sprintf("       - %-10s: %3d amostras (%.1f%%)\n",
              dist_classes$classificacao_linguistica[i],
              dist_classes$n[i],
              dist_classes$percentual[i]))
}

cat("\n   4.3 Comparações Estatisticamente Significativas (p < 0.05)\n")
tukey_sig <- tukey_df %>% filter(Significância != "ns")
if (nrow(tukey_sig) > 0) {
  for (i in 1:nrow(tukey_sig)) {
    cat(sprintf("       - %s: Δ = %.2f [IC: %.2f a %.2f] %s\n",
                tukey_sig$Comparação[i],
                tukey_sig$Diferença[i],
                tukey_sig$IC_inferior[i],
                tukey_sig$IC_superior[i],
                tukey_sig$Significância[i]))
  }
} else {
  cat("       - Nenhuma diferença significativa detectada.\n")
}

cat("\n   4.4 Correlações Mais Fortes com FSNSI\n")
corr_top <- corr_fsnsi %>% head(5)
for (i in 1:nrow(corr_top)) {
  cat(sprintf("       - %-15s: r = %+.3f [IC: %.3f a %.3f] %s\n",
              corr_top$Variável[i],
              corr_top$Correlação_Pearson[i],
              corr_top$IC_inferior[i],
              corr_top$IC_superior[i],
              corr_top$Significância[i]))
}

cat("\n5. CONCLUSÕES PRELIMINARES\n")
cat("   - Sistema com MAIOR funcionalidade:", ranking$amb[1], 
    sprintf("(FSNSI = %.2f)\n", ranking$Média[1]))
cat("   - Sistema com MENOR funcionalidade:", ranking$amb[nrow(ranking)], 
    sprintf("(FSNSI = %.2f)\n", ranking$Média[nrow(ranking)]))
cat("   - Diferença entre extremos:", 
    sprintf("%.2f pontos (%.1f%% da escala)\n",
            ranking$Média[1] - ranking$Média[nrow(ranking)],
            ((ranking$Média[1] - ranking$Média[nrow(ranking)]) / 10) * 100))

cat("\n6. IMPLICAÇÕES PARA MANEJO\n")
if (ranking$amb[1] == "Cerrado") {
  cat("   - O Cerrado nativo apresenta a maior funcionalidade, servindo como\n")
  cat("     referência para práticas conservacionistas.\n")
} else {
  cat("   - O sistema", ranking$amb[1], "apresentou funcionalidade superior ao\n")
  cat("     Cerrado nativo, sugerindo potencial de melhoria da qualidade edáfica.\n")
}

if ("Agricultura" %in% ranking$amb[ranking$Classificação_funcional == "Baixa"]) {
  cat("   - A agricultura convencional apresenta funcionalidade comprometida,\n")
  cat("     indicando necessidade de práticas de manejo conservacionista.\n")
}

cat("\n==============================================================================\n")
cat("Relatório gerado em:", format(Sys.time(), "%d/%m/%Y %H:%M:%S"), "\n")
cat("==============================================================================\n")
sink()

cat("✓ Salvo: fuzzy_relatorio_06_resumo_executivo.txt\n")

# --------------------------------------------------------------------------
# 11. MENSAGEM FINAL
# --------------------------------------------------------------------------
cat("\n")
cat("==============================================================================\n")
cat("TODAS AS FIGURAS E TABELAS FORAM GERADAS COM SUCESSO!\n")
cat("==============================================================================\n")
cat("\nArquivos salvos em:", pasta_figuras, "\n")
cat("\nLista de figuras geradas:\n")
cat("  1. fuzzy_fig1_funcoes_pertinencia_entrada.png\n")
cat("  2. fuzzy_fig2_funcao_pertinencia_saida.png\n")
cat("  3. fuzzy_fig3_boxplot_fsnsi_uso_terra.png\n")
cat("  4. fuzzy_fig4_barplot_fsnsi_uso_terra.png\n")
cat("  5. fuzzy_fig5_fsnsi_profundidade_uso_terra.png\n")
cat("  6. fuzzy_tabela_estatisticas_fsnsi.csv\n")
cat("==============================================================================\n")
