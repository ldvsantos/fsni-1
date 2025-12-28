# ----------------------------------------
# 0. Pacotes e ambiente
# ----------------------------------------
library(readxl)
library(dplyr)
library(janitor)
library(FuzzyR)
library(ggplot2)
library(seminr)

rm(list = ls())
cat("\014")
graphics.off()

# ----------------------------------------
# 1. Leitura dos dados
# ----------------------------------------
dados <- read_excel("data_base_22072025.xlsx", sheet = "DADOS") %>% clean_names()

# ----------------------------------------
# 2. Funções auxiliares
# ----------------------------------------
normalizar <- function(x) {
  if (max(x, na.rm = TRUE) == min(x, na.rm = TRUE)) return(rep(0.5, length(x)))
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

normalizar_invertido <- function(x) {
  x <- -1 * x
  normalizar(x)
}

# ----------------------------------------
# 3. Loop para cada profundidade
# ----------------------------------------
profundidades <- unique(dados$prof)

for (p in profundidades) {
  cat("\nProfundidade:", p, "\n")
  
  dados_p <- dados %>% filter(prof == p)
  
  # Constrói e normaliza os construtos
  dados_p <- dados_p %>%
    mutate(
      n_labil  = rowMeans(across(c(nlabil, nmol)), na.rm = TRUE),
      n_humico = rowMeans(across(c(ntaf, ntah, nthum)), na.rm = TRUE),
      p_labil  = rowMeans(across(c(plabil, pmol)), na.rm = TRUE),
      p_humico = rowMeans(across(c(ptaf, ptah, pthum)), na.rm = TRUE),
      n_total  = rowMeans(across(c(nt, estnt)), na.rm = TRUE),
      p_total  = rowMeans(across(c(pt, estpt)), na.rm = TRUE)
    ) %>%
    mutate(across(c(n_labil, n_humico, p_labil, p_humico, n_total, p_total), normalizar),
           ds = normalizar_invertido(ds),
           areia = normalizar(areia),
           silte = normalizar(silte),
           argila = normalizar(argila))
  
  # ---------------------
  # PLS-SEM
  # ---------------------
  modelo_mensuracao <- constructs(
    composite("n_labil",  single_item("n_labil")),
    composite("n_humico", single_item("n_humico")),
    composite("p_labil",  single_item("p_labil")),
    composite("p_humico", single_item("p_humico")),
    composite("n_total",  single_item("n_total")),
    composite("p_total",  single_item("p_total"))
  )
  
  modelo_estrutural <- relationships(
    paths(from = c("n_labil", "n_humico"), to = "n_total"),
    paths(from = c("p_labil", "p_humico"), to = "p_total")
  )
  
  modelo_pls <- estimate_pls(
    data = dados_p,
    measurement_model = modelo_mensuracao,
    structural_model = modelo_estrutural
  )
  
  cat("Resumo PLS para profundidade:", p, "\n")
  print(summary(modelo_pls))
  
  # ---------------------
  # Sistema Fuzzy
  # ---------------------
  fis <- newfis("IF_fuzzy", defuzzMethod = "centroid")
  
  fis <- addvar(fis, "input", "N_total", c(0, 1))
  fis <- addvar(fis, "input", "P_total", c(0, 1))
  fis <- addvar(fis, "input", "Ds", c(0, 1))
  fis <- addvar(fis, "output", "Qualidade", c(0, 10))
  
  params_in_baixa <- c(0, 0, 0.4)
  params_in_media <- c(0.3, 0.5, 0.7)
  params_in_alta  <- c(0.6, 1, 1)
  
  for (i in 1:3) {
    fis <- addmf(fis, "input", i, "baixa", "trimf", params_in_baixa)
    fis <- addmf(fis, "input", i, "media", "trimf", params_in_media)
    fis <- addmf(fis, "input", i, "alta",  "trimf", params_in_alta)
  }
  
  fis <- addmf(fis, "output", 1, "baixa", "trimf", c(0, 0, 4))
  fis <- addmf(fis, "output", 1, "media", "trimf", c(3, 5, 7))
  fis <- addmf(fis, "output", 1, "alta",  "trimf", c(6, 10, 10))
  
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
    2, 3, 1, 3, 1.0, 1,
    3, 2, 1, 3, 1.0, 1
  ), ncol = 6, byrow = TRUE)
  
  fis <- addrule(fis, regras_fuzzy)
  
  entrada_fuzzy <- dados_p %>%
    select(n_total, p_total, ds) %>%
    as.matrix()
  
  dados_p$if_valor_fuzzy <- apply(entrada_fuzzy, 1, function(l) evalfis(matrix(l, nrow = 1), fis))
  
  # ---------------------
  # Gráfico
  # ---------------------
  dados_p$amb <- factor(dados_p$amb,
                        levels = 1:5,
                        labels = c("Cerrado", "Agricultura", "Mahogany", "Eucalyptus", "Teak"))
  
  g <- ggplot(dados_p, aes(x = amb, y = if_valor_fuzzy)) +
    geom_boxplot(aes(fill = amb), outlier.shape = NA) +
    geom_jitter(aes(color = amb), width = 0.2, alpha = 0.5) +
    scale_fill_brewer(palette = "Set1") +
    scale_color_brewer(palette = "Set1") +
    labs(title = paste("FSNSI – Profundidade:", p),
         x = "Uso do Solo",
         y = "Índice Fuzzy (0–10)") +
    theme_minimal(base_size = 13) +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  print(g)
}
