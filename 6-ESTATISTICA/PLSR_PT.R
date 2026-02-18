# Carregar pacotes
library(pls)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(readxl)
library(tidyr)


rm(list = ls())     
gc()

# Carregar dados
dados <- read_excel("banco_dados.xlsx", sheet = "dados") %>% na.omit()
names(dados) <- trimws(names(dados))  # Corrigir espaços nos nomes

# Variáveis preditoras relacionadas ao fósforo (P)
variaveis_P <- c(
  "PLabil", "PMOL", "PTAF", "PTAH", "PTHum",
  "EstPT", "EstPLabil", "EstPMOL", "EstPAF", "EstPAH", "EstPTHum"
)
X <- dados %>% select(all_of(variaveis_P))
Y_PT <- dados$PT
grupo <- factor(dados$Amb, levels = 1:5,
                labels = c("Cerrado", "African mahogany", "Eucalyptus", "Teak", "Agriculture"))

# Rodar PLSR
modelo <- plsr(Y_PT ~ ., data = X, ncomp = 2, validation = "LOO")
expl_x <- explvar(modelo)[1:2] * 100
label_x <- paste0("LV1 (", round(expl_x[1], 1), "% X)")
label_y <- paste0("LV2 (", round(expl_x[2], 1), "% X)")



# Scores
scores_df <- as.data.frame(scores(modelo)[, 1:2])
colnames(scores_df) <- c("LV1", "LV2")
scores_df <- scores_df %>%
  mutate(
    LV1 = LV1 * 4,
    LV2 = LV2 * 4
  )
colnames(scores_df) <- c("LV1", "LV2")
scores_df$Amb <- grupo

# Loadings normalizados
loadings_raw <- loadings(modelo)[, 1:2]
loadings_scaled <- sweep(loadings_raw, 1, sqrt(rowSums(loadings_raw^2)), FUN = "/")
loadings_df <- as.data.frame(loadings_scaled)
colnames(loadings_df) <- c("LV1", "LV2")
loadings_df$var <- rownames(loadings_df)

# Escalar os loadings para caber no raio de 1.2
escala_setas <- 0.5
loadings_df$LV1 <- loadings_df$LV1 * escala_setas
loadings_df$LV2 <- loadings_df$LV2 * escala_setas

# Círculo de correlação ajustado (raio = 1.2)
circle <- data.frame(
  x = cos(seq(0, 2 * pi, length.out = 100)) * escala_setas,
  y = sin(seq(0, 2 * pi, length.out = 100)) * escala_setas
)

# Gráfico PLSR com ajustes visuais
ggplot() +
  geom_path(data = circle, aes(x = x, y = y),
            linetype = "dotted", color = "gray40") +
  geom_hline(yintercept = 0, color = "gray50") +
  geom_vline(xintercept = 0, color = "gray50") +
  geom_point(data = scores_df, aes(x = LV1, y = LV2, shape = Amb, color = Amb),
             size = 3, alpha = 0.9) +
  geom_segment(data = loadings_df,
               aes(x = 0, y = 0, xend = LV1, yend = LV2),
               arrow = arrow(length = unit(0.2, "cm")), color = "black") +
  geom_text_repel(data = loadings_df,
                  aes(x = LV1, y = LV2, label = var), size = 3.5) +
  coord_fixed(xlim = c(-0.5, 0.5), ylim = c(-0.5, 0.5)) +
  scale_color_brewer(palette = "Dark2") +
  scale_shape_manual(values = 1:5) +
  labs(x = label_x, y = label_y, color = "Land use", shape = "Land use") +
  theme_minimal(base_size = 14) +
  theme(panel.grid = element_blank(), legend.position = "right")


# TABELA 1 – Estatísticas descritivas
tabela_descr <- X %>%
  summarise_all(list(
    media = mean, sd = sd, min = min, max = max,
    cv = ~ 100 * sd(.) / mean(.)
  )) %>%
  pivot_longer(cols = everything(),
               names_to = c("Variável", ".value"),
               names_sep = "_")

# TABELA 2 – Variância explicada acumulada
r2 <- R2(modelo, estimate = "train")
r2y <- round(100 * r2$val[1, 1, c("1 comps", "2 comps")], 2)
expl_x <- round(explvar(modelo)[1:2] * 100, 2)
tabela_r2 <- data.frame(
  Componente = c("LV1", "LV2"),
  R2X_acum = expl_x,
  R2Y_acum = r2y
)

# TABELA 3 – Loadings
tabela_loadings <- as.data.frame(loadings(modelo)[, 1:2])
colnames(tabela_loadings) <- c("LV1", "LV2")
tabela_loadings$Variável <- rownames(tabela_loadings)
tabela_loadings <- tabela_loadings[, c("Variável", "LV1", "LV2")]

# TABELA 4 – VIP scores
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
  names(VIP) <- rownames(W)
  return(VIP)
}
vip_scores <- vip_pls(modelo)
tabela_vip <- data.frame(
  Variável = names(vip_scores),
  VIP = round(vip_scores, 3)
) %>% arrange(desc(VIP))

# Gráfico de VIP
ggplot(tabela_vip, aes(x = reorder(Variável, VIP), y = VIP)) +
  geom_segment(aes(xend = Variável, y = 0, yend = VIP), color = "blue", size = 0.7) +
  geom_point(color = "blue", size = 2.5) +
  geom_hline(yintercept = 0.8, linetype = "dashed", color = "black") +
  labs(
    title = "Variable importance according to VIP (Wold criterion)",
    x = "Predictor variables",
    y = "VIP Score"
  ) +
  theme_minimal(base_size = 14) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(face = "bold", hjust = 0.5))

# Exibir tabelas no console
print("TABELA 1 – Estatísticas descritivas:")
print(tabela_descr, digits = 3)
print("TABELA 2 – Variância explicada:")
print(tabela_r2)
print("TABELA 3 – Loadings das variáveis:")
print(tabela_loadings, digits = 3)
print("TABELA 4 – VIP (Critério de Wold):")
print(tabela_vip)




# ==========================
# FIGURA 4 – Y observado vs. Y predito
# ==========================

# Previsões do modelo com Y_PT
y_pred <- predict(modelo, ncomp = 2)
df_pred <- data.frame(
  Observado = Y_PT,
  Predito = y_pred[, , 1],
  LandUse = grupo
)

# Criar linha de tendência
modelo_lm <- lm(Predito ~ Observado, data = df_pred)
linha_trend <- data.frame(
  Observado = seq(min(df_pred$Observado), max(df_pred$Observado), length.out = 100)
)
linha_trend$Predito <- predict(modelo_lm, newdata = linha_trend)

# Gráfico final
ggplot(df_pred, aes(x = Observado, y = Predito)) +
  geom_point(aes(fill = LandUse), shape = 21, color = "black", size = 3, stroke = 1) +
  geom_line(data = linha_trend, aes(x = Observado, y = Predito), color = "black", linewidth = 1) +
  scale_fill_brewer(palette = "Dark2") +
  labs(
    title = "Observed versus predicted total phosphorus (PLSR)",
    x = "Observed PT",
    y = "Predicted PT",
    fill = "Land use"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "right",
    plot.title = element_text(face = "bold", hjust = 0.5)
  )

       
# ==========================
# FIGURA 5 – Resíduos vs. Y predito
# ==========================
residuos <- Y_PT - y_pred[, , 1]
df_resid <- data.frame(Predito = y_pred[, , 1], Residual = residuos)

ggplot(df_resid, aes(x = Predito, y = Residual)) +
  geom_point(alpha = 0.7) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray50") +
  labs(
    title = "Residuals versus predicted values for total phosphorus (PLSR)",
    x = "Predicted PT",
    y = "Residual"
  ) +
  theme_minimal(base_size = 14)

