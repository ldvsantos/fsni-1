# Pacotes
library(dplyr)
library(stringr)
library(boot)
library(car)
library(emmeans)
library(tibble)
library(knitr)
library(kableExtra)
library(haven)  # Para read_sav
library(ggeffects)  # Para estimativas marginais com IC
library(broom)

# Limpeza do ambiente
rm(list = ls())
graphics.off()
cat("\014")

# 1. Leitura do banco SPSS
dados <- read_sav("Dados.sav")
names(dados) <- trimws(names(dados))

dados <- dados %>% 
  filter(!is.na(Amb), !is.na(Prof)) %>%
  group_by(Amb, Prof) %>%
  filter(n() > 0) %>%
  ungroup()

# 2. Conversão de fatores
dados <- dados %>%
  mutate(
    Amb = as_factor(Amb),
    Prof = as_factor(Prof),
    ParcelaID = str_c(Amb, "_", Rep)
  )

options(contrasts = c("contr.sum", "contr.poly"))

# 3. Modelo GLM com distribuição Gamma e link log
modelo_final <- glm(
  EstNT ~ Amb * Prof  + NLabil + NMOL + NTAF + NTAF,
  data = dados,
  family = Gamma(link = "log"),
  control = glm.control(maxit = 100, epsilon = 1e-8, trace = TRUE)
)



# 4. Tabela de Coeficientes
cat("\n=== Estimativas dos Parâmetros (GLM - Gamma) ===\n")
summary_tbl <- broom::tidy(modelo_final) %>%
  rename(Termo = term, Valor = estimate, `Erro Padrão` = std.error,
         `z` = statistic, `p-valor` = p.value)
kable(summary_tbl, digits = 4, caption = "Estimativas dos Coeficientes do Modelo") %>%
  kable_styling(full_width = FALSE)



# 5. Análise de variância tipo III (Wald)
cat("\n=== ANOVA Tipo III (Wald) ===\n")
anova_glm3 <- Anova(modelo_final, type = 2)
anova_tbl3 <- as.data.frame(anova_glm3) %>%
  rownames_to_column("Origem")
kable(anova_tbl3, digits = 4, caption = "Testes de Efeitos do Modelo (Tipo III - Wald)") %>%
  kable_styling(full_width = FALSE)



# 6. Estimativas Marginais (EMMEANS) com IC de Wald
cat("\n=== Médias Marginais Estimadas (Amb*Prof) ===\n")
emmeans_tbl <- emmeans(modelo_final, ~ Amb * Prof, type = "response") %>%
  as.data.frame()
kable(emmeans_tbl, digits = 4, caption = "Médias Marginais Estimadas (Escala Original)") %>%
  kable_styling(full_width = FALSE)



# 7. Comparações de pares com Bonferroni
cat("\n=== Comparações de Pares (Bonferroni) ===\n")
comparacoes <- pairs(emmeans(modelo_final, ~ Amb * Prof), adjust = "bonferroni") %>%
  as.data.frame()
kable(comparacoes, digits = 4, caption = "Comparações de Pares com Bonferroni") %>%
  kable_styling(full_width = FALSE)



# 8. Bootstrap para Estimativas de Parâmetro
cat("\n=== Bootstrap para Estimativas de Parâmetro ===\n")

modelo_glm_boot <- function(data, indices) {
  d <- data[indices, ]
  fit <- glm(
    EstNT ~ Amb * Prof  + EstNLabil + NLabil + NMOL, 
    data = d,
    family = Gamma(link = "log"))
  return(coef(fit))
}


set.seed(123)
boot_result <- boot(data = dados,
                    statistic = modelo_glm_boot,
                    R = 1000)

bootstrap_tabela <- purrr::map_dfr(seq_along(boot_result$t0), function(i) {
  est <- boot_result$t0[i]
  dist_boot <- boot_result$t[, i]
  media_boot <- mean(dist_boot)
  bias <- media_boot - est
  se <- sd(dist_boot)
  
  ci <- tryCatch(boot.ci(boot_result, type = c("perc", "bca"), index = i), error = function(e) NULL)
  
  p_boot <- 2 * min(
    mean(dist_boot >= 0, na.rm = TRUE),
    mean(dist_boot <= 0, na.rm = TRUE)
  )
  
  tibble(
    Termo = names(boot_result$t0)[i],
    Estimativa = est,
    Bias = bias,
    `Erro Padrão` = se,
    `IC Perc. Inf` = if (!is.null(ci)) ci$perc[4] else NA,
    `IC Perc. Sup` = if (!is.null(ci)) ci$perc[5] else NA,
    `IC BCa Inf` = if (!is.null(ci)) ci$bca[4] else NA,
    `IC BCa Sup` = if (!is.null(ci)) ci$bca[5] else NA,
    `p-valor bootstrap` = round(p_boot, 4)
  )
})

kable(bootstrap_tabela, digits = 4,
      caption = "Bootstrap para Estimativas de Parâmetro (1000 reamostragens)") %>%
  kable_styling(full_width = FALSE)


