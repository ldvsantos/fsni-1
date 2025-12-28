from __future__ import annotations

import shutil
import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET

W_NS = "http://schemas.openxmlformats.org/wordprocessingml/2006/main"
NS = {"w": W_NS}


def _ensure_rfonts(rpr: ET.Element, font: str) -> None:
    rfonts = rpr.find("w:rFonts", NS)
    if rfonts is None:
        rfonts = ET.SubElement(rpr, f"{{{W_NS}}}rFonts")
    rfonts.set(f"{{{W_NS}}}ascii", font)
    rfonts.set(f"{{{W_NS}}}hAnsi", font)
    rfonts.set(f"{{{W_NS}}}cs", font)


def set_docx_default_fonts(docx_path: Path, font: str) -> None:
    if not docx_path.exists():
        raise FileNotFoundError(docx_path)

    tmp_path = docx_path.with_suffix(docx_path.suffix + ".tmp")

    with zipfile.ZipFile(docx_path, "r") as zin:
        with zipfile.ZipFile(tmp_path, "w", compression=zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                data = zin.read(item.filename)

                if item.filename == "word/styles.xml":
                    tree = ET.ElementTree(ET.fromstring(data))
                    root = tree.getroot()

                    # docDefaults / rPrDefault / rPr
                    doc_defaults = root.find("w:docDefaults", NS)
                    if doc_defaults is not None:
                        rpr_default = doc_defaults.find("w:rPrDefault", NS)
                        if rpr_default is not None:
                            rpr = rpr_default.find("w:rPr", NS)
                            if rpr is None:
                                rpr = ET.SubElement(rpr_default, f"{{{W_NS}}}rPr")
                            _ensure_rfonts(rpr, font)

                    # Normal style
                    normal_style = root.find("w:style[@w:styleId='Normal']", NS)
                    if normal_style is not None:
                        rpr = normal_style.find("w:rPr", NS)
                        if rpr is None:
                            rpr = ET.SubElement(normal_style, f"{{{W_NS}}}rPr")
                        _ensure_rfonts(rpr, font)

                    data = ET.tostring(root, encoding="utf-8", xml_declaration=True)

                zout.writestr(item, data)

    shutil.move(str(tmp_path), str(docx_path))


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    targets = [
        base / "modelo_manuscript.docx",
        base / "modelo_coverletter.docx",
    ]

    for p in targets:
        if not p.exists():
            print(f"Skipping (missing): {p}")
            continue

        out = p.with_name(p.stem + "_times" + p.suffix)
        print(f"Copying : {p.name} -> {out.name}")
        shutil.copy2(p, out)
        print(f"Patching: {out}")
        set_docx_default_fonts(out, font="Times New Roman")

    print("Done.")


if __name__ == "__main__":
    main()
