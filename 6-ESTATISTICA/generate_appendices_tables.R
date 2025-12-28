# Gera tabelas em Markdown (Apêndices) com médias ± DP por uso da terra e profundidade
# a partir de 6-ESTATISTICA/dados.csv.

options(stringsAsFactors = FALSE)

input_csv <- "dados.csv"
output_md <- "../1-MANUSCRITO/MARKDOWN/apendices_quimicos.md"

# Leitura com separador ';' e decimal ','
dados <- read.csv(input_csv, sep = ";", dec = ",", check.names = FALSE)

# Mapeamento do fator Amb conforme scripts PLS
map_amb <- c(
  `1` = "Cerrado",
  `2` = "Agricultura",
  `3` = "Mogno",
  `4` = "Eucalipto",
  `5` = "Teca"
)

dados$Uso <- map_amb[as.character(dados$Amb)]

# Ordem padrão
ordem_usos <- c("Cerrado", "Teca", "Mogno", "Eucalipto", "Agricultura")
ordem_profundidades <- c("0-10", "10-20", "20-30", "30-40", "40-50", "50-60", "60-80", "80-100")

fmt_mean_sd <- function(x) {
  m <- mean(x, na.rm = TRUE)
  s <- sd(x, na.rm = TRUE)
  sprintf("%.3f±%.3f", m, s)
}

make_table <- function(vars, title, unit_label) {
  # Retorna vetor de linhas markdown
  linhas <- c()
  linhas <- c(linhas, paste0("## ", title), "")
  header <- c("Uso da terra", vars)
  linhas <- c(linhas, paste0("| ", paste(header, collapse = " | "), " |"))
  linhas <- c(linhas, paste0("| ", paste(rep(":---", length(header)), collapse = " | "), " |"))

  # Linha de unidade
  unidades <- c("", rep(unit_label, length(vars)))
  linhas <- c(linhas, paste0("| ", paste(unidades, collapse = " | "), " |"))

  for (prof in ordem_profundidades) {
    linhas <- c(linhas, paste0("| ", prof, " cm", paste(rep("", length(vars)), collapse = " | "), " |"))

    for (uso in ordem_usos) {
      sub <- dados[dados$Prof == prof & dados$Uso == uso, , drop = FALSE]
      if (nrow(sub) == 0) next

      vals <- vapply(vars, function(v) fmt_mean_sd(sub[[v]]), character(1))
      linhas <- c(linhas, paste0("| ", paste(c(uso, vals), collapse = " | "), " |"))
    }
  }

  linhas <- c(linhas, "")
  linhas
}

vars_n_conc <- c("NLabil ", "NMOL", "NTAF", "NTAH", "NTHum ", "NT ")
vars_p_conc <- c("PLabil", "PMOL", "PTAF", "PTAH", "PTHum ", "PT ")
vars_n_stock <- c("EstNLabil", "EstNMOL", "EstNAF ", "EstNAH", "EstNTHum", "EstNT ")
vars_p_stock <- c("EstPLabil", "EstPMOL", "EstPAF ", "EstPAH", "EstPTHum", "EstPT ")

md <- c()
md <- c(md, "# APÊNDICES QUÍMICOS", "")
md <- c(md, "Estas tabelas apresentam médias e desvios padrão calculados a partir das repetições experimentais por profundidade e uso da terra.", "")

md <- c(md, make_table(vars_n_conc, "Apêndice 3 – Teores médios de nitrogênio no solo e frações (média±DP)", "g kg⁻¹"))
md <- c(md, make_table(vars_p_conc, "Apêndice 4 – Teores médios de fósforo no solo e frações (média±DP)", "g kg⁻¹"))
md <- c(md, make_table(vars_n_stock, "Apêndice 5 – Estoques de nitrogênio no solo e frações (média±DP)", "Mg ha⁻¹"))
md <- c(md, make_table(vars_p_stock, "Apêndice 6 – Estoques de fósforo no solo e frações (média±DP)", "Mg ha⁻¹"))

writeLines(md, output_md, useBytes = TRUE)
cat("Arquivo gerado em:", normalizePath(output_md, winslash = "/"), "\n")
