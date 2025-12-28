from __future__ import annotations

import zipfile
from pathlib import Path


def diagnose(docx: Path) -> None:
    print(f"\n{'=' * 70}")
    print(f"DIAGNOSING: {docx.name}")
    print(f"{'=' * 70}")
    
    if not docx.exists():
        print("❌ File does not exist!")
        return
    
    print(f"✓ Exists: {docx.stat().st_size:,} bytes")
    
    try:
        with zipfile.ZipFile(docx) as z:
            files = z.namelist()
            print(f"✓ Valid ZIP with {len(files)} files")
            
            # Check for key files
            key_files = ["word/styles.xml", "word/document.xml", "word/theme/theme1.xml"]
            for kf in key_files:
                if kf in files:
                    info = z.getinfo(kf)
                    print(f"  ✓ {kf}: {info.file_size:,} bytes")
                else:
                    print(f"  ❌ {kf}: MISSING")
            
            # Extract and show styles.xml raw bytes
            if "word/styles.xml" in files:
                data = z.read("word/styles.xml")
                print(f"\n📄 word/styles.xml raw data:")
                print(f"  Length: {len(data):,} bytes")
                print(f"  First 200 bytes (hex): {data[:200].hex()}")
                print(f"  First 200 bytes (repr): {repr(data[:200])}")
                
                # Try different encodings
                for enc in ["utf-8", "utf-16", "utf-16-le", "utf-16-be", "latin-1"]:
                    try:
                        decoded = data.decode(enc, errors="strict")
                        if "w:styles" in decoded or "docDefaults" in decoded:
                            print(f"  ✓ Decoding with {enc} WORKS")
                            print(f"    Contains w:styles: {'w:styles' in decoded}")
                            print(f"    Contains docDefaults: {'docDefaults' in decoded}")
                            print(f"    First 500 chars:\n{decoded[:500]}")
                            break
                    except Exception as e:
                        print(f"  ✗ {enc}: {type(e).__name__}")
                        
    except zipfile.BadZipFile:
        print("❌ Not a valid ZIP/DOCX file!")
    except Exception as e:
        print(f"❌ Error: {type(e).__name__}: {e}")


def main() -> None:
    base = Path(__file__).resolve().parent.parent
    
    templates = [
        base / "modelo_manuscript.docx",
        base / "modelo_manuscript_times.docx",
    ]
    
    for t in templates:
        diagnose(t)


if __name__ == "__main__":
    main()
