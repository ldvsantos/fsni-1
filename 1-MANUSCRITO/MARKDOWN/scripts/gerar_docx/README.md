# Scripts de Geração DOCX

Esta pasta contém todos os scripts responsáveis pela geração e formatação dos documentos DOCX.

## Scripts Principais

### `gerar-docx.py`
Script principal que gera todos os documentos DOCX (manuscrito PT/EN, title page, cover letter).
- Usa Pandoc para conversão Markdown → DOCX
- Aplica templates de referência
- Processa bibliografias e citações

**Uso:**
```bash
python scripts/gerar-docx.py
# ou
python scripts/gerar_docx/gerar-docx.py
```

## Scripts de Formatação

### `fix_docx_template.py`
Aplica formatações acadêmicas aos templates DOCX:
- Texto justificado
- Títulos em negrito
- Espaçamento de linha 1,15
- Recuo de primeira linha 0,63cm
- Figuras centralizadas
- Fonte Times New Roman

**Uso:**
```bash
python scripts/gerar_docx/fix_docx_template.py
```

### `fix_table_style_v2.py`
Configura estilo de tabelas para formato acadêmico (booktabs):
- Layout auto-ajustável (distribuído por texto)
- Largura 100% da página
- Margens nas células (4pt)
- Linhas apenas: topo, abaixo do cabeçalho, rodapé

**Uso:**
```bash
python scripts/gerar_docx/fix_table_style_v2.py
```

### `fix_reference_doc_fonts.py`
Cria variantes dos templates com fonte Times New Roman explícita.

**Uso:**
```bash
python scripts/gerar_docx/fix_reference_doc_fonts.py
```

## Scripts de Inspeção

### `inspect_docx_fonts.py`
Inspeciona definições de fonte em arquivos DOCX.

### `inspect_docx_theme_fonts.py`
Inspeciona esquema de fontes do tema DOCX.

### `peek_docx_styles.py`
Exibe trechos do styles.xml para debug.

## Fluxo de Trabalho

1. **Preparação dos templates:**
   ```bash
   python scripts/gerar_docx/fix_docx_template.py
   python scripts/gerar_docx/fix_table_style_v2.py
   ```

2. **Geração dos documentos:**
   ```bash
   python scripts/gerar-docx.py
   ```

3. **Verificação (opcional):**
   ```bash
   python scripts/gerar_docx/inspect_docx_fonts.py
   ```

## Arquivos Gerados

Os documentos DOCX são gerados em:
```
output_docx/
├── manuscript_PT.docx
├── manuscript_EN.docx
├── title_page.docx
└── cover_letter.docx
```

## Templates

Os templates de referência estão em:
```
1-MANUSCRITO/MARKDOWN/
├── modelo_manuscript.docx
├── modelo_manuscript_times.docx
├── modelo_coverletter.docx
└── modelo_coverletter_times.docx
```

## Dependências

- Python 3.8+
- Pandoc 2.11+
- Bibliotecas Python: (nenhuma externa, usa apenas stdlib)
