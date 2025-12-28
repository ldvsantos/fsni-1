import os
import shutil

# Diretório de origem e destino
src_dir = r"C:\Users\vidal\OneDrive\Documentos\13 - CLONEGIT\artigo-posdoc\5 - ARTIGO\artigo_5\fsni\1-MANUSCRITO\MARKDOWN\scripts"
dst_dir = os.path.join(src_dir, "gerar_docx")

# Scripts a mover
scripts = [
    "gerar-docx.py",
    "fix_docx_template.py",
    "fix_table_style.py",
    "fix_table_style_v2.py",
    "fix_reference_doc_fonts.py",
    "inspect_docx_fonts.py",
    "inspect_docx_theme_fonts.py",
    "peek_docx_styles.py"
]

print(f"Origem: {src_dir}")
print(f"Destino: {dst_dir}")
print(f"Existe destino: {os.path.exists(dst_dir)}")
print()

for script in scripts:
    src_path = os.path.join(src_dir, script)
    dst_path = os.path.join(dst_dir, script)
    
    if os.path.exists(src_path):
        try:
            shutil.copy2(src_path, dst_path)
            print(f"✅ Copiado: {script}")
        except Exception as e:
            print(f"❌ Erro ao copiar {script}: {e}")
    else:
        print(f"⚠️  Não encontrado: {script}")

print("\n📁 Conteúdo do diretório gerar_docx:")
for item in os.listdir(dst_dir):
    print(f"  - {item}")
