#!/usr/bin/env python3
"""
Aplica formatação completa ao template DOCX para compatibilidade com Pandoc.

Este script modifica os estilos do template DOCX para incluir:
- Texto justificado
- Títulos em negrito
- Espaçamento de linha 1,15
- Recuo de primeira linha 0,63cm
- Figuras centralizadas
- Tabelas com estilo booktabs
"""

import sys
import os
import zipfile
import re
from pathlib import Path
from xml.etree import ElementTree as ET

# Namespaces do OpenXML
NS = {
    'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main',
    'r': 'http://schemas.openxmlformats.org/officeDocument/2006/relationships',
}

def detect_encoding(content_bytes):
    """Detecta UTF-16 ou UTF-8."""
    if content_bytes[:2] == b'\xff\xfe' or content_bytes[:2] == b'\xfe\xff':
        return 'utf-16'
    if any(b == 0 for b in content_bytes[:2000:2]):
        return 'utf-16'
    return 'utf-8'

def register_namespaces():
    """Registra namespaces para preservar prefixos no XML."""
    for prefix, uri in NS.items():
        ET.register_namespace(prefix, uri)

def modify_paragraph_style(style_elem, style_id, style_name, **kwargs):
    """
    Modifica ou cria um estilo de parágrafo com as propriedades especificadas.
    
    Args:
        style_elem: Elemento <w:style>
        style_id: ID do estilo
        style_name: Nome do estilo
        **kwargs: Propriedades do estilo (jc, spacing_line, indent_first_line, bold, etc.)
    """
    # Garante pPr exists
    pPr = style_elem.find('w:pPr', NS)
    if pPr is None:
        pPr = ET.SubElement(style_elem, f'{{{NS["w"]}}}pPr')
    
    # Justificação
    if 'jc' in kwargs:
        jc = pPr.find('w:jc', NS)
        if jc is None:
            jc = ET.SubElement(pPr, f'{{{NS["w"]}}}jc')
        jc.set(f'{{{NS["w"]}}}val', kwargs['jc'])
    
    # Espaçamento de linha
    if 'spacing_line' in kwargs or 'spacing_after' in kwargs or 'spacing_before' in kwargs:
        spacing = pPr.find('w:spacing', NS)
        if spacing is None:
            spacing = ET.SubElement(pPr, f'{{{NS["w"]}}}spacing')
        if 'spacing_line' in kwargs:
            spacing.set(f'{{{NS["w"]}}}line', str(kwargs['spacing_line']))
            spacing.set(f'{{{NS["w"]}}}lineRule', 'auto')
        if 'spacing_after' in kwargs:
            spacing.set(f'{{{NS["w"]}}}after', str(kwargs['spacing_after']))
        if 'spacing_before' in kwargs:
            spacing.set(f'{{{NS["w"]}}}before', str(kwargs['spacing_before']))
    
    # Recuo de primeira linha
    if 'indent_first_line' in kwargs:
        ind = pPr.find('w:ind', NS)
        if ind is None:
            ind = ET.SubElement(pPr, f'{{{NS["w"]}}}ind')
        ind.set(f'{{{NS["w"]}}}firstLine', str(kwargs['indent_first_line']))
    
    # Negrito (para rPr dentro de pPr)
    if 'bold' in kwargs and kwargs['bold']:
        rPr = pPr.find('w:rPr', NS)
        if rPr is None:
            rPr = ET.SubElement(pPr, f'{{{NS["w"]}}}rPr')
        b = rPr.find('w:b', NS)
        if b is None:
            ET.SubElement(rPr, f'{{{NS["w"]}}}b')
    
    # Fonte
    if 'font' in kwargs:
        rPr = pPr.find('w:rPr', NS)
        if rPr is None:
            rPr = ET.SubElement(pPr, f'{{{NS["w"]}}}rPr')
        rFonts = rPr.find('w:rFonts', NS)
        if rFonts is None:
            rFonts = ET.SubElement(rPr, f'{{{NS["w"]}}}rFonts')
        for attr in ['ascii', 'hAnsi', 'cs']:
            rFonts.set(f'{{{NS["w"]}}}{attr}', kwargs['font'])

def fix_template_styles(docx_path):
    """
    Aplica formatação completa ao template DOCX.
    
    Args:
        docx_path: Caminho para o arquivo DOCX
    """
    print(f"📋 Aplicando formatação: {Path(docx_path).name}")
    
    # Cria backup
    backup_path = str(docx_path) + '.bak'
    if not Path(backup_path).exists():
        import shutil
        shutil.copy2(docx_path, backup_path)
    
    # Extrai o DOCX
    temp_dir = Path(docx_path).parent / f'.temp_{Path(docx_path).stem}'
    temp_dir.mkdir(exist_ok=True)
    
    with zipfile.ZipFile(docx_path, 'r') as docx:
        docx.extractall(temp_dir)
    
    # Lê styles.xml
    styles_path = temp_dir / 'word' / 'styles.xml'
    with open(styles_path, 'rb') as f:
        content = f.read()
    
    encoding = detect_encoding(content)
    styles_xml = content.decode(encoding)
    
    # Parse XML
    register_namespaces()
    tree = ET.fromstring(styles_xml)
    
    # Encontra ou cria docDefaults
    docDefaults = tree.find('w:docDefaults', NS)
    if docDefaults is None:
        docDefaults = ET.SubElement(tree, f'{{{NS["w"]}}}docDefaults')
    
    # Aplica formatação padrão do documento
    rPrDefault = docDefaults.find('w:rPrDefault', NS)
    if rPrDefault is None:
        rPrDefault = ET.SubElement(docDefaults, f'{{{NS["w"]}}}rPrDefault')
    
    rPr = rPrDefault.find('w:rPr', NS)
    if rPr is None:
        rPr = ET.SubElement(rPrDefault, f'{{{NS["w"]}}}rPr')
    
    # Fonte Times New Roman
    rFonts = rPr.find('w:rFonts', NS)
    if rFonts is None:
        rFonts = ET.SubElement(rPr, f'{{{NS["w"]}}}rFonts')
    for attr in ['ascii', 'hAnsi', 'cs']:
        rFonts.set(f'{{{NS["w"]}}}{attr}', 'Times New Roman')
    
    # Formatação padrão de parágrafo
    pPrDefault = docDefaults.find('w:pPrDefault', NS)
    if pPrDefault is None:
        pPrDefault = ET.SubElement(docDefaults, f'{{{NS["w"]}}}pPrDefault')
    
    pPr = pPrDefault.find('w:pPr', NS)
    if pPr is None:
        pPr = ET.SubElement(pPrDefault, f'{{{NS["w"]}}}pPr')
    
    # Justificado
    jc = pPr.find('w:jc', NS)
    if jc is None:
        jc = ET.SubElement(pPr, f'{{{NS["w"]}}}jc')
    jc.set(f'{{{NS["w"]}}}val', 'both')
    
    # Espaçamento 1,15 (276 twips = 1,15 * 240)
    spacing = pPr.find('w:spacing', NS)
    if spacing is None:
        spacing = ET.SubElement(pPr, f'{{{NS["w"]}}}spacing')
    spacing.set(f'{{{NS["w"]}}}line', '276')
    spacing.set(f'{{{NS["w"]}}}lineRule', 'auto')
    
    # Recuo de primeira linha 0,63cm (360 twips)
    ind = pPr.find('w:ind', NS)
    if ind is None:
        ind = ET.SubElement(pPr, f'{{{NS["w"]}}}ind')
    ind.set(f'{{{NS["w"]}}}firstLine', '360')
    
    # Modifica estilos específicos do Pandoc
    styles = tree.findall('w:style', NS)
    
    style_configs = {
        'Normal': {
            'jc': 'both',
            'spacing_line': 276,
            'indent_first_line': 360,
            'font': 'Times New Roman'
        },
        'BodyText': {
            'jc': 'both',
            'spacing_line': 276,
            'indent_first_line': 360,
            'font': 'Times New Roman'
        },
        'FirstParagraph': {
            'jc': 'both',
            'spacing_line': 276,
            'indent_first_line': 0,  # Primeiro parágrafo sem recuo
            'font': 'Times New Roman'
        },
        'Heading1': {
            'bold': True,
            'spacing_line': 276,
            'font': 'Times New Roman'
        },
        'Heading2': {
            'bold': True,
            'spacing_line': 276,
            'font': 'Times New Roman'
        },
        'Heading3': {
            'bold': True,
            'spacing_line': 276,
            'font': 'Times New Roman'
        },
        'Figure': {
            'jc': 'center',
            'spacing_line': 276,
            'font': 'Times New Roman'
        },
        'ImageCaption': {
            'jc': 'center',
            'spacing_line': 276,
            'font': 'Times New Roman'
        },
        'TableCaption': {
            'jc': 'left',
            'spacing_line': 276,
            'spacing_after': 120,
            'font': 'Times New Roman'
        }
    }
    
    # Aplica configurações aos estilos existentes
    for style in styles:
        style_id = style.get(f'{{{NS["w"]}}}styleId')
        if style_id in style_configs:
            config = style_configs[style_id]
            modify_paragraph_style(style, style_id, style_id, **config)
            print(f"  ✓ Estilo modificado: {style_id}")
    
    # Cria estilos faltantes
    for style_id, config in style_configs.items():
        existing = any(s.get(f'{{{NS["w"]}}}styleId') == style_id for s in styles)
        if not existing:
            new_style = ET.SubElement(tree, f'{{{NS["w"]}}}style')
            new_style.set(f'{{{NS["w"]}}}type', 'paragraph')
            new_style.set(f'{{{NS["w"]}}}styleId', style_id)
            
            name = ET.SubElement(new_style, f'{{{NS["w"]}}}name')
            name.set(f'{{{NS["w"]}}}val', style_id)
            
            modify_paragraph_style(new_style, style_id, style_id, **config)
            print(f"  + Estilo criado: {style_id}")
    
    # Salva styles.xml
    styles_xml_modified = ET.tostring(tree, encoding='unicode', method='xml')
    # Adiciona declaração XML
    styles_xml_modified = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n' + styles_xml_modified
    
    with open(styles_path, 'w', encoding='utf-8') as f:
        f.write(styles_xml_modified)
    
    # Recompacta o DOCX
    with zipfile.ZipFile(docx_path, 'w', zipfile.ZIP_DEFLATED) as docx:
        for file_path in temp_dir.rglob('*'):
            if file_path.is_file():
                arcname = str(file_path.relative_to(temp_dir))
                docx.write(file_path, arcname)
    
    # Remove diretório temporário
    import shutil
    shutil.rmtree(temp_dir)
    
    print(f"✅ Concluído: {Path(docx_path).name}")

def main():
    script_dir = Path(__file__).parent
    markdown_dir = script_dir.parent
    
    templates = [
        markdown_dir / 'modelo_manuscript.docx',
        markdown_dir / 'modelo_manuscript_times.docx'
    ]
    
    for template in templates:
        if template.exists():
            fix_template_styles(template)
        else:
            print(f"⚠️  Template não encontrado: {template.name}")
    
    print("\n✅ Formatação de templates concluída!")
    print("   - Texto justificado")
    print("   - Títulos em negrito")
    print("   - Espaçamento 1,15")
    print("   - Recuo primeira linha 0,63cm")
    print("   - Figuras centralizadas")

if __name__ == '__main__':
    main()
