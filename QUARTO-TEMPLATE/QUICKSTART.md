## 🎯 Preview no VS Code - Guia Rápido

### Como Abrir o Preview em Split Screen

**1. Opção Mais Rápida (Recomendada):**
   - Pressione `Ctrl+K V`
   - O preview abre à direita do editor

**2. Via Menu:**
   - Abra um arquivo `.qmd`
   - Clique em "Preview" no canto superior direito
   - Selecione "Preview in Viewer Pane"

**3. Via Paleta de Comandos:**
   - Pressione `Ctrl+Shift+P`
   - Digite "Quarto: Preview"
   - Selecione a opção

### Fluxo de Trabalho

```
1. Abra um arquivo .qmd (ex: chapters/01-introduction.qmd)
   ↓
2. Pressione Ctrl+K V
   ↓
3. Editor à esquerda | Preview à direita
   ↓
4. Edite o texto → Salve (Ctrl+S)
   ↓
5. Preview atualiza automaticamente
```

### Funcionalidades

✅ Live preview enquanto você digita
✅ Sincronização automática de mudanças
✅ Suporte a Markdown, R, Python, LaTeX
✅ Renderização de figuras em tempo real
✅ Tabelas formatadas
✅ Citações automáticas

### Se o Preview Não Abrir

1. Verifique se tem o arquivo `.qmd` aberto
2. Confirme que a extensão Quarto está instalada:
   - Ctrl+Shift+X → busque "Quarto"
   - Deve estar instalada e habilitada
3. Tente: Ctrl+Shift+P → "Quarto: Preview"

---

**Pronto!** Comece editando os capítulos em `chapters/`.



Gerar apenas PDF: quarto render --to pdf
Gerar apenas HTML: quarto render --to html
Gerar tudo (HTML, PDF, DOCX): quarto render