#!/usr/bin/env python3
"""
Ajusta estilo de tabelas DOCX para formato acadêmico booktabs com distribuição automática.

Aplica:
- Layout auto-ajustável (distribuído por texto)
- Largura 100% da página
- Margens nas células (4pt)
- Linhas apenas: topo, abaixo do cabeçalho, rodapé (12pt)
"""

import sys
import zipfile
from pathlib import Path
from xml.etree import ElementTree as ET

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
NS = {'w': W_NS}

def detect_encoding(content_bytes):
    """Detecta UTF-16 ou UTF-8."""
    if content_bytes[:2] in (b'\xff\xfe', b'\xfe\xff'):
        return 'utf-16'
    if any(b == 0 for b in content_bytes[:2000:2]):
        return 'utf-16'
    return 'utf-8'

def register_namespaces():
    """Registra namespaces."""
    ET.register_namespace('w', W_NS)

def create_booktabs_table_style(styles_root):
    """Cria estilo de tabela booktabs com distribuição automática."""
    # Procura TableGrid
    table_style = None
    for style in styles_root.findall('w:style', NS):
        if style.get(f'{{{W_NS}}}styleId') in ['TableGrid', 'TableNormal']:
            table_style = style
            break
    
    if table_style is None:
        table_style = ET.SubElement(styles_root, f'{{{W_NS}}}style')
        table_style.set(f'{{{W_NS}}}type', 'table')
        table_style.set(f'{{{W_NS}}}styleId', 'TableGrid')
        
        name = ET.SubElement(table_style, f'{{{W_NS}}}name')
        name.set(f'{{{W_NS}}}val', 'Table Grid')
    
    # Remove tblPr existente
    for tblPr in table_style.findall(f'{{{W_NS}}}tblPr'):
        table_style.remove(tblPr)
    
    # Cria novo tblPr
    tblPr = ET.SubElement(table_style, f'{{{W_NS}}}tblPr')
    
    # 1. Layout automático (autofit - distribui por texto)
    tblLayout = ET.SubElement(tblPr, f'{{{W_NS}}}tblLayout')
    tblLayout.set(f'{{{W_NS}}}type', 'auto')
    
    # 2. Largura 100%
    tblW = ET.SubElement(tblPr, f'{{{W_NS}}}tblW')
    tblW.set(f'{{{W_NS}}}w', '5000')  # 100% = 5000
    tblW.set(f'{{{W_NS}}}type', 'pct')
    
    # 3. Sem espaçamento entre células
    tblCellSpacing = ET.SubElement(tblPr, f'{{{W_NS}}}tblCellSpacing')
    tblCellSpacing.set(f'{{{W_NS}}}w', '0')
    tblCellSpacing.set(f'{{{W_NS}}}type', 'dxa')
    
    # 4. Sem indentação
    tblInd = ET.SubElement(tblPr, f'{{{W_NS}}}tblInd')
    tblInd.set(f'{{{W_NS}}}w', '0')
    tblInd.set(f'{{{W_NS}}}type', 'dxa')
    
    # 5. Margens das células (4pt = 80 twips)
    tblCellMar = ET.SubElement(tblPr, f'{{{W_NS}}}tblCellMar')
    for side in ['top', 'left', 'bottom', 'right']:
        margin = ET.SubElement(tblCellMar, f'{{{W_NS}}}{side}')
        margin.set(f'{{{W_NS}}}w', '80')
        margin.set(f'{{{W_NS}}}type', 'dxa')
    
    # 6. Sem bordas padrão
    tblBorders = ET.SubElement(tblPr, f'{{{W_NS}}}tblBorders')
    for border_name in ['top', 'left', 'bottom', 'right', 'insideH', 'insideV']:
        border = ET.SubElement(tblBorders, f'{{{W_NS}}}{border_name}')
        border.set(f'{{{W_NS}}}val', 'none')
        border.set(f'{{{W_NS}}}sz', '0')
    
    # Remove tblStylePr existentes
    for tblStylePr in table_style.findall(f'{{{W_NS}}}tblStylePr'):
        table_style.remove(tblStylePr)
    
    # 7. Primeira linha (cabeçalho): linha acima e abaixo
    firstRow = ET.SubElement(table_style, f'{{{W_NS}}}tblStylePr')
    firstRow.set(f'{{{W_NS}}}type', 'firstRow')
    
    tcPr_first = ET.SubElement(firstRow, f'{{{W_NS}}}tcPr')
    tcBorders_first = ET.SubElement(tcPr_first, f'{{{W_NS}}}tcBorders')
    
    # Linha acima
    top = ET.SubElement(tcBorders_first, f'{{{W_NS}}}top')
    top.set(f'{{{W_NS}}}val', 'single')
    top.set(f'{{{W_NS}}}sz', '12')  # 1.5pt
    top.set(f'{{{W_NS}}}color', '000000')
    
    # Linha abaixo
    bottom = ET.SubElement(tcBorders_first, f'{{{W_NS}}}bottom')
    bottom.set(f'{{{W_NS}}}val', 'single')
    bottom.set(f'{{{W_NS}}}sz', '12')
    bottom.set(f'{{{W_NS}}}color', '000000')
    
    # Sem bordas laterais
    for side in ['left', 'right', 'insideH', 'insideV']:
        border = ET.SubElement(tcBorders_first, f'{{{W_NS}}}{side}')
        border.set(f'{{{W_NS}}}val', 'none')
    
    # 8. Última linha: apenas linha abaixo
    lastRow = ET.SubElement(table_style, f'{{{W_NS}}}tblStylePr')
    lastRow.set(f'{{{W_NS}}}type', 'lastRow')
    
    tcPr_last = ET.SubElement(lastRow, f'{{{W_NS}}}tcPr')
    tcBorders_last = ET.SubElement(tcPr_last, f'{{{W_NS}}}tcBorders')
    
    # Linha abaixo
    bottom_last = ET.SubElement(tcBorders_last, f'{{{W_NS}}}bottom')
    bottom_last.set(f'{{{W_NS}}}val', 'single')
    bottom_last.set(f'{{{W_NS}}}sz', '12')
    bottom_last.set(f'{{{W_NS}}}color', '000000')
    
    # Sem outras bordas
    for side in ['top', 'left', 'right', 'insideH', 'insideV']:
        border = ET.SubElement(tcBorders_last, f'{{{W_NS}}}{side}')
        border.set(f'{{{W_NS}}}val', 'none')

def fix_table_style(docx_path):
    """Aplica estilo booktabs ao template."""
    print(f"📐 Ajustando tabelas: {Path(docx_path).name}")
    
    temp_dir = Path(docx_path).parent / f'.temp_table_{Path(docx_path).stem}'
    temp_dir.mkdir(exist_ok=True)
    
    with zipfile.ZipFile(docx_path, 'r') as docx:
        docx.extractall(temp_dir)
    
    styles_path = temp_dir / 'word' / 'styles.xml'
    with open(styles_path, 'rb') as f:
        content = f.read()
    
    encoding = detect_encoding(content)
    register_namespaces()
    tree = ET.fromstring(content.decode(encoding))
    
    create_booktabs_table_style(tree)
    
    styles_xml = ET.tostring(tree, encoding='unicode', method='xml')
    styles_xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n' + styles_xml
    
    with open(styles_path, 'w', encoding='utf-8') as f:
        f.write(styles_xml)
    
    with zipfile.ZipFile(docx_path, 'w', zipfile.ZIP_DEFLATED) as docx:
        for file_path in temp_dir.rglob('*'):
            if file_path.is_file():
                docx.write(file_path, str(file_path.relative_to(temp_dir)))
    
    import shutil
    shutil.rmtree(temp_dir)
    
    print(f"✓ Concluído: {Path(docx_path).name}")

def main():
    script_dir = Path(__file__).parent
    markdown_dir = script_dir.parent
    
    templates = [
        markdown_dir / 'modelo_manuscript.docx',
        markdown_dir / 'modelo_manuscript_times.docx'
    ]
    
    for template in templates:
        if template.exists():
            fix_table_style(template)
    
    print("\n✅ Estilos de tabela atualizados!")
    print("  - Layout: auto-ajustável (distribuído por texto)")
    print("  - Largura: 100% da página")
    print("  - Margens células: 4pt")
    print("  - Cabeçalho: linha acima e abaixo (1.5pt)")
    print("  - Rodapé: linha abaixo (1.5pt)")
    print("  - Corpo: sem linhas")

if __name__ == '__main__':
    main()
