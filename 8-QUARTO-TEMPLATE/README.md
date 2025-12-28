# 📚 QUARTO Template - Artigo Científico

Modelo ARTE (Article Reproducibility Template & Environment) para pesquisa reprodutível em Quarto.

## 🚀 Como Usar

### 1. **Visualizar no VS Code com Preview Lateral**

Pressione `Ctrl+K V` para abrir o preview em split screen:
- **Esquerda**: Editor com seu código `.qmd`
- **Direita**: Preview HTML atualizado em tempo real

### 2. **Estrutura do Projeto**

```
QUARTO-TEMPLATE/
├── index.qmd              # Capa e configurações gerais
├── _quarto.yml            # Configuração principal
├── chapters/              # Capítulos do artigo
│   ├── 01-introduction.qmd
│   ├── 02-background.qmd
│   ├── 03-methodology.qmd
│   ├── 04-results.qmd
│   ├── 05-discussion.qmd
│   └── 06-conclusion.qmd
├── code/                  # Scripts R e Python
│   └── setup.R
├── data/                  # Dados brutos
├── figures/               # Figuras e gráficos
├── outputs/               # Resultados gerados
└── references.bib         # Bibliografia
```

## 📝 Editando Conteúdo

**No VS Code:**
1. Abra um arquivo `.qmd` na pasta `chapters/`
2. Pressione `Ctrl+K V` para visualizar em split screen
3. Edite o conteúdo em Markdown
4. Salve (`Ctrl+S`) - o preview atualiza automaticamente
3. **RStudio** (recomendado): https://posit.co/download/rstudio-desktop/

### Instalação

1. Clone ou copie este diretório:
```bash
cd QUARTO-TEMPLATE
```

### 3. **Usando Citações**

Use `[@author_year]` para citações automáticas:
```markdown
Conforme mencionado [@smith_2020], o resultado foi significativo.
```

### 4. **Adicionando Código R**

```{r}
#| echo: false
#| message: false

library(ggplot2)
plot(mtcars$hp, mtcars$mpg)
```

### 5. **Gerando Output Final**

```bash
# HTML
quarto render --to html

# PDF
quarto render --to pdf

# DOCX
quarto render --to docx

# Todos os formatos
quarto render
```

## ⌨️ Atalhos VS Code

| Atalho | Ação |
|--------|------|
| `Ctrl+K V` | Preview lateral (recomendado) |
| `Ctrl+Shift+V` | Preview em nova aba |
| `Ctrl+S` | Salvar (atualiza preview) |
| `Ctrl+` ` | Abrir terminal integrado |
| `Ctrl+B` | Alternar sidebar |

## 📊 Próximas Etapas

1. ✅ Estrutura criada
2. ✅ Preview funcionando no VS Code
3. 🔄 Editar `chapters/01-introduction.qmd`
4. 🔄 Adicionar dados em `data/`
5. � Integrar seus scripts em `code/`
6. 🔄 Gerar outputs finais

## � Dúvidas?

Consulte:
- [Documentação oficial do Quarto](https://quarto.org)
- [TIER Protocol 4.0](https://www.projecttier.org/)
- [Quarto + R](https://quarto.org/docs/computations/r.html)

---

**Dica**: Este é um template vazio. Comece editando os capítulos em `chapters/`!
