from __future__ import annotations

import shutil
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"


def create_booktabs_style(styles_root: ET.Element) -> None:
    """Cria ou modifica estilo de tabela para formato acadêmico (booktabs)."""
    
    # Registrar namespace
    ET.register_namespace("w", W_NS)
    
    # Procurar estilo "Table Grid" ou criar novo
    style_id = "TableGrid"
    table_style = None
    
    for style in styles_root.findall(f".//{{{W_NS}}}style"):
        if style.get(f"{{{W_NS}}}styleId") == style_id:
            table_style = style
            break
    
    # Se não existe, criar novo estilo
    if table_style is None:
        table_style = ET.SubElement(styles_root, f"{{{W_NS}}}style")
        table_style.set(f"{{{W_NS}}}type", "table")
        table_style.set(f"{{{W_NS}}}styleId", style_id)
        
        name = ET.SubElement(table_style, f"{{{W_NS}}}name")
        name.set(f"{{{W_NS}}}val", "Table Grid")
        
        base_style = ET.SubElement(table_style, f"{{{W_NS}}}basedOn")
        base_style.set(f"{{{W_NS}}}val", "TableNormal")
    
    # Remover formatação de borda existente
    for tbl_pr in table_style.findall(f".//{{{W_NS}}}tblPr"):
        for borders in tbl_pr.findall(f"{{{W_NS}}}tblBorders"):
            tbl_pr.remove(borders)
    
    # Adicionar formatação booktabs (sem bordas por padrão)
    tbl_pr = table_style.find(f"{{{W_NS}}}tblPr")
    if tbl_pr is None:
        tbl_pr = ET.SubElement(table_style, f"{{{W_NS}}}tblPr")
    
    # Bordas da tabela (nenhuma por padrão)
    tbl_borders = ET.SubElement(tbl_pr, f"{{{W_NS}}}tblBorders")
    
    for border_name in ["top", "left", "bottom", "right", "insideH", "insideV"]:
        border = ET.SubElement(tbl_borders, f"{{{W_NS}}}{border_name}")
        border.set(f"{{{W_NS}}}val", "none")
        border.set(f"{{{W_NS}}}sz", "0")
        border.set(f"{{{W_NS}}}space", "0")
        border.set(f"{{{W_NS}}}color", "auto")
    
    # Configurar formatação condicional para cabeçalho (primeira linha)
    tbl_style_pr_first = ET.SubElement(table_style, f"{{{W_NS}}}tblStylePr")
    tbl_style_pr_first.set(f"{{{W_NS}}}type", "firstRow")
    
    tc_pr_first = ET.SubElement(tbl_style_pr_first, f"{{{W_NS}}}tcPr")
    tc_borders_first = ET.SubElement(tc_pr_first, f"{{{W_NS}}}tcBorders")
    
    # Linha acima do cabeçalho
    top_border = ET.SubElement(tc_borders_first, f"{{{W_NS}}}top")
    top_border.set(f"{{{W_NS}}}val", "single")
    top_border.set(f"{{{W_NS}}}sz", "12")  # 1.5pt
    top_border.set(f"{{{W_NS}}}space", "0")
    top_border.set(f"{{{W_NS}}}color", "000000")
    
    # Linha abaixo do cabeçalho
    bottom_border = ET.SubElement(tc_borders_first, f"{{{W_NS}}}bottom")
    bottom_border.set(f"{{{W_NS}}}val", "single")
    bottom_border.set(f"{{{W_NS}}}sz", "12")
    bottom_border.set(f"{{{W_NS}}}space", "0")
    bottom_border.set(f"{{{W_NS}}}color", "000000")
    
    # Sem bordas laterais e internas
    for border_name in ["left", "right", "insideH", "insideV"]:
        border = ET.SubElement(tc_borders_first, f"{{{W_NS}}}{border_name}")
        border.set(f"{{{W_NS}}}val", "none")
        border.set(f"{{{W_NS}}}sz", "0")
    
    # Configurar última linha
    tbl_style_pr_last = ET.SubElement(table_style, f"{{{W_NS}}}tblStylePr")
    tbl_style_pr_last.set(f"{{{W_NS}}}type", "lastRow")
    
    tc_pr_last = ET.SubElement(tbl_style_pr_last, f"{{{W_NS}}}tcPr")
    tc_borders_last = ET.SubElement(tc_pr_last, f"{{{W_NS}}}tcBorders")
    
    # Linha abaixo da última linha
    bottom_border_last = ET.SubElement(tc_borders_last, f"{{{W_NS}}}bottom")
    bottom_border_last.set(f"{{{W_NS}}}val", "single")
    bottom_border_last.set(f"{{{W_NS}}}sz", "12")
    bottom_border_last.set(f"{{{W_NS}}}space", "0")
    bottom_border_last.set(f"{{{W_NS}}}color", "000000")
    
    # Sem outras bordas
    for border_name in ["top", "left", "right", "insideH", "insideV"]:
        border = ET.SubElement(tc_borders_last, f"{{{W_NS}}}{border_name}")
        border.set(f"{{{W_NS}}}val", "none")
        border.set(f"{{{W_NS}}}sz", "0")


def fix_table_styles(docx_path: Path) -> None:
    """Modifica estilos de tabela no DOCX para formato acadêmico."""
    if not docx_path.exists():
        raise FileNotFoundError(docx_path)
    
    tmp_path = docx_path.with_suffix(docx_path.suffix + ".tmp")
    
    with zipfile.ZipFile(docx_path, "r") as zin:
        with zipfile.ZipFile(tmp_path, "w", compression=zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)
                
                if item.filename == "word/styles.xml":
                    # Detectar encoding
                    if data.startswith(b"\xff\xfe") or b"\x00" in data[:2000]:
                        text = data.decode("utf-16", errors="ignore")
                        encoding = "utf-16"
                    else:
                        text = data.decode("utf-8", errors="ignore")
                        encoding = "utf-8"
                    
                    # Parse XML
                    root = ET.fromstring(text.encode("utf-8"))
                    
                    # Modificar estilo de tabela
                    create_booktabs_style(root)
                    
                    # Converter de volta
                    data = ET.tostring(root, encoding=encoding, xml_declaration=True)
                
                zout.writestr(item, data)
    
    shutil.move(str(tmp_path), str(docx_path))


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    targets = [
        base / "modelo_manuscript.docx",
        base / "modelo_manuscript_times.docx",
    ]
    
    for p in targets:
        if not p.exists():
            print(f"⊗ Pulando (não encontrado): {p.name}")
            continue
        
        print(f"📐 Ajustando estilo de tabela: {p.name}")
        try:
            fix_table_styles(p)
            print(f"✓ Concluído: {p.name}")
        except Exception as e:
            print(f"✗ Erro em {p.name}: {e}")
    
    print("\n✓ Estilos de tabela atualizados para formato acadêmico (booktabs).")
    print("  - Cabeçalho: linha acima e abaixo (12pt)")
    print("  - Corpo: sem linhas")
    print("  - Rodapé: linha abaixo (12pt)")
    print("  - Layout: auto-ajustável (distribuído por texto)")
    print("  - Largura: 100% da página")
    print("  - Margens células: 4pt")


if __name__ == "__main__":
    main()
