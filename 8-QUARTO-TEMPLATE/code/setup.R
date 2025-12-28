# Script de Setup - Instalação de Pacotes Necessários
# Execute este script uma vez antes de renderizar o artigo

# Verificar e instalar pacotes necessários
packages <- c(
  "tidyverse",      # Manipulação de dados
  "knitr",          # Tabelas
  "ggplot2",        # Visualização
  "vegan",          # Análise multivariada
  "pls",            # Regressão PLS
  "pheatmap",       # Heatmaps
  "car",            # Análises estatísticas
  "agricolae",      # Testes de comparação (Tukey)
  "corrplot",       # Matrizes de correlação
  "rmarkdown"       # Para integração com Quarto
)

# Função para instalar se não existir
install_if_needed <- function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    cat(sprintf("Instalando %s...\n", pkg))
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  } else {
    cat(sprintf("%s já está instalado.\n", pkg))
  }
}

# Instalar todos os pacotes
sapply(packages, install_if_needed)

cat("\n✓ Todos os pacotes necessários foram instalados com sucesso!\n")
cat("Agora você pode executar: quarto render\n")
