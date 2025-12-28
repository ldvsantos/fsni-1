from __future__ import annotations

import re
import zipfile
from pathlib import Path


def _extract_fonts_from_styles_xml(styles_xml: str) -> dict:
    def grab(block: str) -> tuple[str | None, str | None]:
        # Match attributes with any namespace prefix (w:, ns0:, etc.) or no prefix
        ascii_m = re.search(r'(?:\w+:)?ascii="([^"]+)"', block)
        hansi_m = re.search(r'(?:\w+:)?hAnsi="([^"]+)"', block)
        ascii_theme_m = re.search(r'(?:\w+:)?asciiTheme="([^"]+)"', block)
        hansi_theme_m = re.search(r'(?:\w+:)?hAnsiTheme="([^"]+)"', block)
        cs_m = re.search(r'(?:\w+:)?cs="([^"]+)"', block)
        cs_theme_m = re.search(r'(?:\w+:)?cstheme="([^"]+)"', block, flags=re.I)
        return (
            (ascii_m.group(1) if ascii_m else (ascii_theme_m.group(1) if ascii_theme_m else None)),
            (hansi_m.group(1) if hansi_m else (hansi_theme_m.group(1) if hansi_theme_m else None)),
        )

    # Match with any namespace prefix (w:, ns0:, etc.)
    m = re.search(r"<(?:\w+:)?rPrDefault[^>]*>.*?<(?:\w+:)?rPr[^>]*>.*?<(?:\w+:)?rFonts[^>]*?>", styles_xml, flags=re.S)
    defaults = grab(m.group(0)) if m else (None, None)

    n = re.search(r"<(?:\w+:)?style[^>]+(?:\w+:)?styleId=(?:\"Normal\"|'Normal')[^>]*>.*?</(?:\w+:)?style>", styles_xml, flags=re.S)
    normal = grab(n.group(0)) if n else (None, None)

    def has_explicit_fonts(block: str | None) -> bool:
        if not block:
            return False
        return bool(re.search(r'(?:\w+:)?(ascii|hAnsi|cs)="', block))

    return {
        "docDefaults": {
            "ascii_or_theme": defaults[0],
            "hAnsi_or_theme": defaults[1],
            "found": bool(m),
            "explicit": has_explicit_fonts(m.group(0) if m else None),
        },
        "Normal": {
            "ascii_or_theme": normal[0],
            "hAnsi_or_theme": normal[1],
            "found": bool(n),
            "explicit": has_explicit_fonts(n.group(0) if n else None),
        },
    }


def fonts(docx_path: Path) -> dict:
    with zipfile.ZipFile(docx_path) as z:
        data = z.read("word/styles.xml")
        if data.startswith(b"\xff\xfe") or b"\x00" in data[:2000]:
            xml = data.decode("utf-16", errors="ignore")
        else:
            xml = data.decode("utf-8", errors="ignore")
    return _extract_fonts_from_styles_xml(xml)


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    paths = {
        "template_manuscript_times": base / "modelo_manuscript_times.docx",
        "template_manuscript": base / "modelo_manuscript.docx",
        "template_cover_times": base / "modelo_coverletter_times.docx",
        "template_cover": base / "modelo_coverletter.docx",
        "out_manuscript_PT": base / "output_docx" / "manuscript_PT.docx",
        "out_manuscript_EN": base / "output_docx" / "manuscript_EN.docx",
        "out_title_page": base / "output_docx" / "title_page.docx",
        "out_cover_letter": base / "output_docx" / "cover_letter.docx",
    }

    for name, path in paths.items():
        print(f"\n{name}: {path}")
        if not path.exists():
            print("  MISSING")
            continue
        try:
            info = fonts(path)
            print("  docDefaults:", info["docDefaults"])
            print("  Normal     :", info["Normal"])
        except PermissionError:
            print("  LOCKED (PermissionError) — close in Word/OneDrive and retry")
        except Exception as e:
            print(f"  ERROR: {type(e).__name__}: {e}")


if __name__ == "__main__":
    main()
