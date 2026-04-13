#!/usr/bin/env python3
"""
Personaliza o template.docx do Pandoc para formato de artigo científico
(Springer / Environmental Monitoring and Assessment).

Estilos aplicados:
  - Fonte: Times New Roman em todo o documento
  - Corpo: 12 pt, espaçamento 1.5 linhas, justificado
  - Títulos: negrito, tamanhos 14-16 pt
  - Tabelas: 10 pt, espaçamento simples
  - Margens: 2.54 cm (1 in) em todas as direções
  - Cabeçalhos e rodapés limpos
"""

from pathlib import Path
from docx import Document
from docx.shared import Pt, Cm, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.oxml.ns import qn
import copy

TEMPLATE = Path(__file__).resolve().parent.parent / "template.docx"
FONT_NAME = "Times New Roman"
BODY_SIZE = Pt(12)
TABLE_SIZE = Pt(10)
HEADING1_SIZE = Pt(14)
HEADING2_SIZE = Pt(13)
HEADING3_SIZE = Pt(12)
LINE_SPACING = 1.5  # 1.5 lines
MARGIN = Cm(2.54)   # 1 inch


def set_font(run_or_font, name=FONT_NAME, size=None, bold=None, italic=None, color=None):
    """Aplica fonte a um objeto run ou font."""
    font = run_or_font if hasattr(run_or_font, 'size') else run_or_font.font
    font.name = name
    # Forçar fonte para caracteres East-Asian e Complex Script também
    rpr = font.element
    if rpr.tag.endswith('}rPr') or rpr.tag == 'rPr':
        ea = rpr.find(qn('w:rFonts'))
        if ea is None:
            ea = rpr.makeelement(qn('w:rFonts'), {})
            rpr.insert(0, ea)
        ea.set(qn('w:ascii'), name)
        ea.set(qn('w:hAnsi'), name)
        ea.set(qn('w:eastAsia'), name)
        ea.set(qn('w:cs'), name)
    if size is not None:
        font.size = size
    if bold is not None:
        font.bold = bold
    if italic is not None:
        font.italic = italic
    if color is not None:
        font.color.rgb = color


def style_paragraph_format(pf, alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
                           line_spacing=LINE_SPACING, space_after=Pt(0),
                           space_before=Pt(0), first_line_indent=None):
    pf.alignment = alignment
    pf.line_spacing_rule = WD_LINE_SPACING.MULTIPLE
    pf.line_spacing = line_spacing
    pf.space_after = space_after
    pf.space_before = space_before
    if first_line_indent is not None:
        pf.first_line_indent = first_line_indent


def configure_style(style, font_size, bold=False, italic=False,
                    alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
                    line_spacing=LINE_SPACING,
                    space_before=Pt(0), space_after=Pt(0),
                    color=None, all_caps=False):
    """Configura um estilo de parágrafo completo."""
    # Fonte
    style.font.name = FONT_NAME
    style.font.size = font_size
    style.font.bold = bold
    style.font.italic = italic
    style.font.all_caps = all_caps
    if color:
        style.font.color.rgb = color
    else:
        style.font.color.rgb = RGBColor(0, 0, 0)

    # Forçar rFonts no XML
    rpr = style.element.find(qn('w:rPr'))
    if rpr is None:
        rpr = style.element.makeelement(qn('w:rPr'), {})
        style.element.append(rpr)
    rfonts = rpr.find(qn('w:rFonts'))
    if rfonts is None:
        rfonts = rpr.makeelement(qn('w:rFonts'), {})
        rpr.insert(0, rfonts)
    for attr in ('w:ascii', 'w:hAnsi', 'w:eastAsia', 'w:cs'):
        rfonts.set(qn(attr), FONT_NAME)

    # Parágrafo
    pf = style.paragraph_format
    pf.alignment = alignment
    pf.line_spacing_rule = WD_LINE_SPACING.MULTIPLE
    pf.line_spacing = line_spacing
    pf.space_before = space_before
    pf.space_after = space_after


def set_margins(doc):
    """Define margens do documento."""
    for section in doc.sections:
        section.top_margin = MARGIN
        section.bottom_margin = MARGIN
        section.left_margin = MARGIN
        section.right_margin = MARGIN


def set_default_font(doc):
    """Define Times New Roman como fonte padrão do tema do documento."""
    # Modificar rPrDefault no document styles
    styles_element = doc.styles.element
    doc_defaults = styles_element.find(qn('w:docDefaults'))
    if doc_defaults is None:
        doc_defaults = styles_element.makeelement(qn('w:docDefaults'), {})
        styles_element.insert(0, doc_defaults)

    rpr_default = doc_defaults.find(qn('w:rPrDefault'))
    if rpr_default is None:
        rpr_default = doc_defaults.makeelement(qn('w:rPrDefault'), {})
        doc_defaults.insert(0, rpr_default)

    rpr = rpr_default.find(qn('w:rPr'))
    if rpr is None:
        rpr = rpr_default.makeelement(qn('w:rPr'), {})
        rpr_default.append(rpr)

    rfonts = rpr.find(qn('w:rFonts'))
    if rfonts is None:
        rfonts = rpr.makeelement(qn('w:rFonts'), {})
        rpr.insert(0, rfonts)
    for attr in ('w:ascii', 'w:hAnsi', 'w:eastAsia', 'w:cs', 'w:asciiTheme', 'w:hAnsiTheme'):
        rfonts.set(qn(attr), FONT_NAME)

    sz = rpr.find(qn('w:sz'))
    if sz is None:
        sz = rpr.makeelement(qn('w:sz'), {})
        rpr.append(sz)
    sz.set(qn('w:val'), str(int(BODY_SIZE.pt * 2)))  # half-points

    szCs = rpr.find(qn('w:szCs'))
    if szCs is None:
        szCs = rpr.makeelement(qn('w:szCs'), {})
        rpr.append(szCs)
    szCs.set(qn('w:val'), str(int(BODY_SIZE.pt * 2)))


def main():
    print(f"📐 Personalizando template: {TEMPLATE}")

    doc = Document(str(TEMPLATE))

    # 1. Margens
    set_margins(doc)
    print("   ✅ Margens: 2.54 cm")

    # 2. Fonte padrão do documento
    set_default_font(doc)
    print(f"   ✅ Fonte padrão: {FONT_NAME} {int(BODY_SIZE.pt)} pt")

    # 3. Estilos de parágrafo
    styles = doc.styles

    # Normal (corpo do texto)
    configure_style(
        styles['Normal'],
        font_size=BODY_SIZE,
        alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
        line_spacing=LINE_SPACING,
        space_after=Pt(6),
    )
    print("   ✅ Estilo Normal: 12 pt, justificado, espaçamento 1.5")

    # Heading 1
    configure_style(
        styles['Heading 1'],
        font_size=HEADING1_SIZE,
        bold=True,
        alignment=WD_ALIGN_PARAGRAPH.LEFT,
        line_spacing=LINE_SPACING,
        space_before=Pt(18),
        space_after=Pt(6),
        color=RGBColor(0, 0, 0),
    )
    print("   ✅ Heading 1: 14 pt, negrito")

    # Heading 2
    configure_style(
        styles['Heading 2'],
        font_size=HEADING2_SIZE,
        bold=True,
        alignment=WD_ALIGN_PARAGRAPH.LEFT,
        line_spacing=LINE_SPACING,
        space_before=Pt(12),
        space_after=Pt(6),
        color=RGBColor(0, 0, 0),
    )
    print("   ✅ Heading 2: 13 pt, negrito")

    # Heading 3
    configure_style(
        styles['Heading 3'],
        font_size=HEADING3_SIZE,
        bold=True,
        italic=True,
        alignment=WD_ALIGN_PARAGRAPH.LEFT,
        line_spacing=LINE_SPACING,
        space_before=Pt(12),
        space_after=Pt(4),
        color=RGBColor(0, 0, 0),
    )
    print("   ✅ Heading 3: 12 pt, negrito itálico")

    # Title
    if 'Title' in [s.name for s in styles]:
        configure_style(
            styles['Title'],
            font_size=Pt(16),
            bold=True,
            alignment=WD_ALIGN_PARAGRAPH.CENTER,
            line_spacing=1.15,
            space_after=Pt(12),
            color=RGBColor(0, 0, 0),
        )
        print("   ✅ Title: 16 pt, centralizado, negrito")

    # Abstract / Block Text
    for name in ('Abstract', 'Block Text'):
        if name in [s.name for s in styles]:
            configure_style(
                styles[name],
                font_size=Pt(11),
                alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
                line_spacing=LINE_SPACING,
                space_after=Pt(6),
            )
            print(f"   ✅ {name}: 11 pt, justificado")

    # Caption (legendas de figuras/tabelas)
    if 'Caption' in [s.name for s in styles]:
        configure_style(
            styles['Caption'],
            font_size=Pt(10),
            italic=True,
            alignment=WD_ALIGN_PARAGRAPH.LEFT,
            line_spacing=1.15,
            space_before=Pt(6),
            space_after=Pt(6),
            color=RGBColor(0, 0, 0),
        )
        print("   ✅ Caption: 10 pt, itálico")

    # Table styles — Compact table text
    for tbl_name in ('Compact', 'Table'):
        matches = [s for s in styles if tbl_name.lower() in s.name.lower()]
        for s in matches:
            try:
                s.font.name = FONT_NAME
                s.font.size = TABLE_SIZE
                if hasattr(s, 'paragraph_format'):
                    s.paragraph_format.line_spacing = 1.0
                    s.paragraph_format.space_after = Pt(0)
                    s.paragraph_format.space_before = Pt(0)
            except Exception:
                pass

    # First Paragraph (usado por Pandoc após headings)
    if 'First Paragraph' in [s.name for s in styles]:
        configure_style(
            styles['First Paragraph'],
            font_size=BODY_SIZE,
            alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
            line_spacing=LINE_SPACING,
            space_after=Pt(6),
        )

    # Body Text
    if 'Body Text' in [s.name for s in styles]:
        configure_style(
            styles['Body Text'],
            font_size=BODY_SIZE,
            alignment=WD_ALIGN_PARAGRAPH.JUSTIFY,
            line_spacing=LINE_SPACING,
            space_after=Pt(6),
        )

    # 4. Limpar conteúdo do corpo (manter apenas estilos)
    body = doc.element.body
    # Remover todos os parágrafos e tabelas do corpo, manter sectPr
    for child in list(body):
        if child.tag != qn('w:sectPr'):
            body.remove(child)

    # Salvar
    doc.save(str(TEMPLATE))
    print(f"\n🎉 Template salvo: {TEMPLATE}")
    print(f"   Tamanho: {TEMPLATE.stat().st_size / 1024:.1f} KB")


if __name__ == "__main__":
    main()
