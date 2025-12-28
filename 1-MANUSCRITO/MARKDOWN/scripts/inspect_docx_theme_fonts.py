from __future__ import annotations

import zipfile
from pathlib import Path
import xml.etree.ElementTree as ET

A_NS = "http://schemas.openxmlformats.org/drawingml/2006/main"
NS = {"a": A_NS}


def theme_fonts(docx_path: Path) -> dict:
    with zipfile.ZipFile(docx_path) as z:
        names = set(z.namelist())
        out: dict = {"has_theme1": "word/theme/theme1.xml" in names}
        if not out["has_theme1"]:
            return out
        xml = z.read("word/theme/theme1.xml")

    root = ET.fromstring(xml)
    font_scheme = root.find(".//a:fontScheme", NS)
    if font_scheme is None:
        return {**out, "error": "fontScheme not found"}

    def pick(kind: str) -> dict:
        node = font_scheme.find(f"a:{kind}Font", NS)
        if node is None:
            return {"latin": None, "ea": None, "cs": None, "present": False}
        latin = node.find("a:latin", NS)
        ea = node.find("a:ea", NS)
        cs = node.find("a:cs", NS)
        return {
            "present": True,
            "latin": latin.get("typeface") if latin is not None else None,
            "ea": ea.get("typeface") if ea is not None else None,
            "cs": cs.get("typeface") if cs is not None else None,
        }

    return {
        **out,
        "majorFont": pick("major"),
        "minorFont": pick("minor"),
        "scheme_name": font_scheme.get("name"),
    }


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    paths = {
        "template_manuscript": base / "modelo_manuscript.docx",
        "out_manuscript_PT": base / "output_docx" / "manuscript_PT.docx",
        "out_manuscript_EN": base / "output_docx" / "manuscript_EN.docx",
        "out_title_page": base / "output_docx" / "title_page.docx",
    }

    for name, path in paths.items():
        print(f"\n{name}: {path}")
        if not path.exists():
            print("  MISSING")
            continue
        try:
            info = theme_fonts(path)
            print("  has_theme1:", info.get("has_theme1"))
            if info.get("has_theme1"):
                print("  scheme_name:", info.get("scheme_name"))
                print("  majorFont:", info.get("majorFont"))
                print("  minorFont:", info.get("minorFont"))
            if info.get("error"):
                print("  error:", info["error"])
        except PermissionError:
            print("  LOCKED (PermissionError) — close in Word/OneDrive and retry")


if __name__ == "__main__":
    main()
