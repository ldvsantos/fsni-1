# Carregar pacotes
library(pls)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(readxl)
library(tidyr)


rm(list = ls())
cat("\014")  # limpa o console
if (dev.cur() != 1) dev.off()

# Carregar dados
dados <- read_excel("banco_dados.xlsx", sheet = "dados") %>% na.omit()

# Remover espaços ocultos nos nomes das colunas
names(dados) <- trimws(names(dados))

# Selecionar variáveis preditoras relacionadas ao nitrogênio
variaveis_N <- c("NLabil", "NMOL", "NTAF", "NTAH", "NTHum",
                 "EstNT", "EstNLabil", "EstNMOL", "EstNAF", "EstNAH", "EstNTHum")

X <- dados %>% select(all_of(variaveis_N))
Y_NT <- dados$NT
grupo <- factor(dados$Amb, levels = 1:5,
                labels = c("Cerrado", "Mogno", "Eucalipto", "Teca", "Agricultura"))
# Rodar o modelo PLSR
modelo <- plsr(Y_NT ~ ., data = X, ncomp = 2, validation = "LOO")

# Scores das amostras
scores_df <- as.data.frame(scores(modelo)[, 1:2])
colnames(scores_df) <- c("LV1", "LV2")
scores_df$Amb <- grupo

# Loadings normalizados
loadings_raw <- loadings(modelo)[, 1:2]
loadings_scaled <- sweep(loadings_raw, 1, sqrt(rowSums(loadings_raw^2)), FUN = "/")
loadings_df <- as.data.frame(loadings_scaled)
colnames(loadings_df) <- c("LV1", "LV2")
loadings_df$var <- rownames(loadings_df)

# Círculo de correlação unitário
circle <- data.frame(
  x = cos(seq(0, 2 * pi, length.out = 100)),
  y = sin(seq(0, 2 * pi, length.out = 100))
)

# Variância explicada de X pelas duas primeiras componentes (em %)
expl_x <- explvar(modelo)[1:2]
label_x <- paste0("LV1 (", round(expl_x[1], 1), "% X)")
label_y <- paste0("LV2 (", round(expl_x[2], 1), "% X)")

# Gráfico final
ggplot() +
  geom_path(data = circle, aes(x = x, y = y), linetype = "dotted", color = "gray40") +
  geom_hline(yintercept = 0, color = "gray50") +
  geom_vline(xintercept = 0, color = "gray50") +
  geom_point(data = scores_df, aes(x = LV1, y = LV2, shape = Amb, color = Amb), size = 3, alpha = 0.9) +
  geom_segment(data = loadings_df, aes(x = 0, y = 0, xend = LV1, yend = LV2),
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  geom_text_repel(data = loadings_df, aes(x = LV1, y = LV2, label = var), size = 3.5) +
  coord_fixed(xlim = c(-1.05, 1.05), ylim = c(-1.05, 1.05)) +
  scale_color_brewer(palette = "Dark2") +
  scale_shape_manual(values = 1:5) +
  labs(
    x = label_x,
    y = label_y,
    color = "Ambiente",
    shape = "Ambiente"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid = element_blank(),
    legend.position = "right"
  )



# TABELA 1 – Estatísticas descritivas
tabela_descr <- X %>%
  summarise_all(list(
    media = mean,
    sd = sd,
    min = min,
    max = max,
    cv = ~ 100 * sd(.) / mean(.)
  )) %>%
  pivot_longer(cols = everything(),
               names_to = c("Variável", ".value"),
               names_sep = "_")


# TABELA 2 – Variância explicada
r2 <- R2(modelo, estimate = "train")

# Variância explicada acumulada para Y_NT
r2y <- round(100 * r2$val[1, 1, c("1 comps", "2 comps")], 2)

# Como explvar() funciona corretamente para X:
expl_x <- round( explvar(modelo)[1:2], 2)

# Montar tabela
tabela_r2 <- data.frame(
  Componente = c("LV1", "LV2"),
  R2X_acum = expl_x,
  R2Y_acum = r2y
)

# Verifique a estrutura
print(tabela_r2)


# Se for uma lista com matriz $val, use:
if (is.matrix(r2$val)) {
  r2x <- round(r2$val[1, 1:2] * 100, 2)
  r2y <- round(r2$val[2, 1:2] * 100, 2)
} else {
  r2x <- round(unlist(r2$val)[1:2] * 100, 2)
  r2y <- round(unlist(r2$val)[3:4] * 100, 2)
}

# TABELA 3 – Loadings das variáveis nas componentes
tabela_loadings <- as.data.frame(loadings(modelo)[, 1:2])
colnames(tabela_loadings) <- c("LV1", "LV2")
tabela_loadings$Variável <- rownames(tabela_loadings)
tabela_loadings <- tabela_loadings[, c("Variável", "LV1", "LV2")]

# Exibir no console
print("TABELA 1 – Estatísticas descritivas:")
print(tabela_descr, digits = 3)

print("TABELA 2 – Variância explicada por componente:")
print(tabela_r2)

print("TABELA 3 – Loadings das variáveis:")
print(tabela_loadings, digits = 3)






#========================== VIP scores (Variable Importance in Projection) ===========


# Função para calcular VIP scores
vip_pls <- function(object) {
  SS <- c(object$Yloadings[, 1]^2) * colSums(object$scores^2)
  W <- object$loading.weights
  p <- nrow(W)
  h <- ncol(object$scores)
  VIP <- rep(0, p)
  for (j in 1:p) {
    weight_sq <- W[j, ]^2
    VIP[j] <- sqrt(p * sum(SS * weight_sq) / sum(SS))
  }
  names(VIP) <- rownames(W)  # <- CORRETO
  return(VIP)
}



# Calcular VIP
vip_scores <- vip_pls(modelo)







# Gráfico tipo Wold VIP plot
ggplot(tabela_vip, aes(x = reorder(Variável, VIP), y = VIP)) +
  geom_segment(aes(xend = Variável, y = 0, yend = VIP), color = "blue", size = 0.7) +
  geom_point(color = "blue", size = 2.5) +
  geom_hline(yintercept = 0.8, linetype = "dashed", color = "black") +
  labs(
    title = "Importância das Variáveis segundo VIP (Critério de Wold)",
    x = "Variáveis preditoras",
    y = "VIP Score"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold", hjust = 0.5)
  )


# Tabela de VIPs
tabela_vip <- data.frame(
  Variável = names(vip_scores),
  VIP = round(vip_scores, 3)
) %>%
  arrange(desc(VIP))

# Visualizar
print("TABELA 4 – Importância das variáveis (VIP):")
print(tabela_vip)


#VIP > 1 → variável considerada importante para o modelo
#VIP < 0.8 → pouco relevante
#VIP entre 0.8 e 1 → relevância intermediária


# Exportar (opcional)
# write.csv(tabela_vip, "tabela_vip.csv", row.names = FALSE)






# ==========================
# FIGURA 4 – Y observado vs. Y predito
# ==========================

# Previsões do modelo com Y_NT
y_pred <- predict(modelo, ncomp = 2)
df_pred <- data.frame(
  Observado = Y_NT,
  Predito = y_pred[, , 1],
  Ambiente = grupo
)

# Criar linha de tendência
modelo_lm <- lm(Predito ~ Observado, data = df_pred)
linha_trend <- data.frame(
  Observado = seq(min(df_pred$Observado), max(df_pred$Observado), length.out = 100)
)
linha_trend$Predito <- predict(modelo_lm, newdata = linha_trend)

# Gráfico com preenchimento e borda preta
ggplot(df_pred, aes(x = Observado, y = Predito)) +
  geom_point(aes(fill = Ambiente), shape = 21, color = "black", size = 3, stroke = 1) +  # shape 21 = círculo com borda
  geom_line(data = linha_trend, aes(x = Observado, y = Predito), color = "black", linewidth = 1) +
  scale_fill_brewer(palette = "Dark2") +
  labs(
    title = "Valores observados vs. preditos para NT (PLSR)",
    x = "NT observado",
    y = "NT predito",
    fill = "Ambiente"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "right",
    plot.title = element_text(face = "bold", hjust = 0.5)
  )


