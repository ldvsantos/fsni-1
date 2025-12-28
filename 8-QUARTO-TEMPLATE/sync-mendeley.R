# Script para sincronizar referências do Mendeley
# Útil se você não quer usar a sincronização automática do Mendeley

library(RefManageR)

# Caminho para o arquivo BibTeX exportado do Mendeley
# (Você pode configurar o Mendeley para exportar automaticamente aqui)
mendeley_bib <- "references.bib"

# Ler o arquivo BibTeX
if (file.exists(mendeley_bib)) {
  bib <- ReadBib(mendeley_bib)
  
  # Verificar referências
  cat("Total de referências:", length(bib), "\n")
  
  # Listar chaves de citação
  cat("\nChaves disponíveis para citação:\n")
  print(names(bib))
  
  # Salvar cópia atualizada (se necessário)
  WriteBib(bib, file = mendeley_bib)
  
  cat("\n✓ Referências sincronizadas com sucesso!\n")
} else {
  cat("⚠ Arquivo", mendeley_bib, "não encontrado.\n")
  cat("Configure o Mendeley para exportar para este local.\n")
}
