from __future__ import annotations

import zipfile
from pathlib import Path


def peek(docx: Path) -> None:
    with zipfile.ZipFile(docx) as z:
        data = z.read("word/styles.xml")
        if data.startswith(b"\xff\xfe") or b"\x00" in data[:2000]:
            xml = data.decode("utf-16", errors="ignore")
        else:
            xml = data.decode("utf-8", errors="ignore")

    print("DOCX:", docx)
    print("styles.xml len:", len(xml))

    needles = [
        "w:docDefaults",
        "w:rPrDefault",
        'w:styleId="Normal"',
        "w:styleId='Normal'",
        "w:rFonts",
    ]
    for n in needles:
        print(f"contains {n}:", n in xml)

    idx = xml.find("w:docDefaults")
    print("docDefaults idx:", idx)
    if idx != -1:
        print(xml[idx : idx + 700])

    # show Normal styleId vicinity (first match)
    import re

    m = re.search(r"w:styleId=(?:\"Normal\"|'Normal')", xml)
    print("Normal styleId match:", bool(m))
    if m:
        start = max(0, m.start() - 200)
        end = m.start() + 800
        print(xml[start:end])


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    for name in [
        "modelo_manuscript.docx",
        "modelo_manuscript_times.docx",
        "modelo_coverletter.docx",
        "modelo_coverletter_times.docx",
    ]:
        p = base / name
        if p.exists():
            peek(p)
            print("\n" + "-" * 60 + "\n")


if __name__ == "__main__":
    main()
