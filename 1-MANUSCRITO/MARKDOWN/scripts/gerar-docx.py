#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para gerar arquivos Word com referências a partir do Markdown
Uso: python gerar-docx.py
Gera artigo.docx (Português) e artigo_ENGLISH.docx (English)
"""

import os
import subprocess
import sys
from pathlib import Path
import time


def _read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8", errors="replace")
    except Exception:
        return ""


def preflight_sections(md_file: Path) -> None:
    text = _read_text(md_file).lower()
    if not text:
        print(f"⚠️  Não foi possível ler {md_file.name} para preflight de seções.")
        return

    checks = {
        "data availability": ["data availability", "disponibilidade de dados", "dados dispon"],
        "funding/support": ["funding", "financial support", "apoio financeiro", "financiamento"],
        "conflict of interest": ["conflict of interest", "competing interests", "conflito de interesses"],
        "acknowledgments": ["acknowledg", "agradecimento", "agradecimentos"],
        "ethics/consent": ["ethics", "ethical", "consent", "human", "animal", "approved"],
        "author contributions": ["author contributions", "contribui", "contributions"],
    }

    missing = []
    for label, needles in checks.items():
        if not any(n in text for n in needles):
            missing.append(label)

    if missing:
        print("\n⚠️  Preflight (seções comuns em submissão Springer/EMA):")
        print(f"   Arquivo: {md_file.name}")
        print("   Itens não detectados (pode ser ok, mas vale conferir):")
        for m in missing:
            print(f"   - {m}")
        print("   (Obs.: esta checagem é por palavras-chave; não substitui as instruções da revista.)")

def gerar_docx(md_file, output_file, bib_files, csl_file=None, apendices_file=None, reference_doc=None):
    """
    Gera arquivo DOCX usando Pandoc
    
    Args:
        md_file: Arquivo Markdown de entrada
        output_file: Arquivo DOCX de saída
        bib_file: Arquivo de bibliografia
        csl_file: Arquivo de estilo de citação
        apendices_file: Arquivo de apêndices (opcional)
    
    Returns:
        0 se sucesso, 1 se erro
    """
    print(f"\n🔄 Gerando {output_file.name}...")
    
    # Remover arquivo antigo se existir
    if output_file.exists():
        print(f"📝 Removendo arquivo antigo: {output_file.name}")
        max_attempts = 5
        for attempt in range(max_attempts):
            try:
                output_file.unlink()
                break
            except PermissionError:
                if attempt < max_attempts - 1:
                    print(f"⚠️  Tentativa {attempt + 1}/{max_attempts}: Arquivo em uso, aguardando...")
                    time.sleep(0.6)
                else:
                    print(f"❌ Erro: Não foi possível remover '{output_file.name}'.")
                    print("   Certifique-se de que o arquivo não está aberto no Word ou OneDrive.")
                    return 1
    
    # Comando Pandoc
    cmd = ["pandoc", str(md_file)]
    
    # Adicionar apêndices ANTES do --citeproc
    if apendices_file and apendices_file.exists():
        cmd.append(str(apendices_file))
        print(f"📎 Incluindo apêndices: {apendices_file.name}")
    
    # Adicionar processamento de citações
    # Se houver bibliografia, passa explicitamente para evitar divergências entre YAML e CLI.
    if bib_files:
        cmd.append("--citeproc")
        for bib in bib_files:
            cmd.extend(["--bibliography", str(bib)])
        if csl_file:
            cmd.extend(["--csl", str(csl_file)])
    
    if reference_doc and Path(reference_doc).exists():
        try:
            with open(reference_doc, "rb"):
                pass
            print(f"📐 Using reference document: {reference_doc}")
            cmd.extend(["--reference-doc", str(reference_doc)])
        except PermissionError:
            print(f"⚠️ Permission denied reading reference document: {reference_doc}")
            print("   Close the file if it's open in Word/OneDrive or adjust file permissions, or remove the template.")
        except Exception as e:
            print(f"⚠️ Could not access reference document {reference_doc}: {e}")
            print("   Continuing without custom reference document.")
    
    cmd.extend(["-o", str(output_file)])
    
    print("Executando Pandoc...")
    
    try:
        # Executar Pandoc
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            encoding='utf-8',
            errors='replace'
        )
        
        # Mostrar warnings/erros do Pandoc
        if result.stderr:
            print(f"\n⚠️  Avisos do Pandoc para {output_file.name}:")
            print(result.stderr)
        
        # Verificar se o arquivo foi criado
        if output_file.exists():
            print(f"\n✅ Arquivo {output_file.name} gerado com sucesso!")
            print(f"📍 Localização: {output_file.absolute()}")
            print(f"📊 Tamanho: {output_file.stat().st_size / 1024:.1f} KB")
            return 0
        else:
            print(f"\n❌ Erro: O arquivo {output_file.name} não foi gerado!")
            if result.stdout:
                print("Saída:", result.stdout)
            return 1
            
    except FileNotFoundError:
        print("\n❌ Erro: Pandoc não está instalado ou não está no PATH do sistema!")
        print("   Instale o Pandoc em: https://pandoc.org/installing.html")
        return 1
    except Exception as e:
        print(f"\n❌ Erro inesperado: {e}")
        return 1

def main():
    # Definir o diretório base onde estão os arquivos
    script_dir = Path(__file__).parent
    base_dir = script_dir.parent  # Diretório pai: 1-MANUSCRITO/MARKDOWN
    os.chdir(base_dir)
    
    print("=" * 70)
    print("📚 GERADOR DE ARTIGOS WORD - PORTUGUÊS E INGLÊS")
    print("=" * 70)
    
    # Arquivos comuns
    csl_file = base_dir / "apa.csl"
    bib_candidates = [base_dir / "referencias_artigo.bib", base_dir / "references_old.bib"]
    bib_files = [p for p in bib_candidates if p.exists()]

    # Modelos DOCX (separados)
    manuscript_reference_doc = next(
        (
            p
            for p in [
                base_dir / "modelo_manuscript_times.docx",
                base_dir / "modelo_manuscript.docx",
                base_dir / "template.docx",
                base_dir.parent.parent / "8-QUARTO-TEMPLATE" / "reference-justified.docx",
            ]
            if p.exists()
        ),
        None,
    )
    cover_reference_doc = next(
        (
            p
            for p in [
                base_dir / "modelo_coverletter_times.docx",
                base_dir / "modelo_coverletter.docx",
            ]
            if p.exists()
        ),
        None,
    )
    # apendices_pt = base_dir / "apendices.md"  # Comentado: artigo ainda não possui apêndices
    
    # Verificar arquivos necessários
    arquivos_necessarios = [csl_file]
    if not bib_files:
        print("\n❌ Erro: Nenhum arquivo .bib encontrado para as citações.")
        print("   Esperado: referencias_artigo.bib e opcionalmente references_old.bib")
        return 1
    arquivos_faltando = [f for f in arquivos_necessarios if not f.exists()]
    
    if arquivos_faltando:
        print("\n❌ Erro: Arquivos necessários não encontrados:")
        for arquivo in arquivos_faltando:
            print(f"   - {arquivo}")
        return 1
    
    # Contador de sucesso
    sucessos = 0
    total = 0

    out_dir = base_dir / "output_docx"
    out_dir.mkdir(parents=True, exist_ok=True)
    
    # ========================================================================
    # 1. GERAR ARTIGO EM PORTUGUÊS
    # ========================================================================
    md_pt = base_dir / "manuscript_revised_PT.md"
    docx_pt = out_dir / "manuscript_PT.docx"
    
    if not md_pt.exists():
        print(f"\n⚠️  Arquivo {md_pt} não encontrado, pulando...")
    else:
        total += 1
        preflight_sections(md_pt)
        result = gerar_docx(md_pt, docx_pt, bib_files, csl_file, apendices_file=None, reference_doc=manuscript_reference_doc)
        if result == 0:
            sucessos += 1
    
    # ========================================================================
    # 2. GERAR ARTIGO EM INGLÊS
    # ========================================================================
    md_en = base_dir / "manuscript_revised_EN.md"
    docx_en = out_dir / "manuscript_EN.docx"
    
    if not md_en.exists():
        print(f"\n⚠️  Arquivo {md_en} não encontrado, pulando...")
    else:
        total += 1
        preflight_sections(md_en)
        result = gerar_docx(md_en, docx_en, bib_files, csl_file, apendices_file=None, reference_doc=manuscript_reference_doc)
        if result == 0:
            sucessos += 1

    # ========================================================================
    # 2B. TITLE PAGE (opcional)
    # ========================================================================
    title_md = base_dir / "title_page.md"
    title_docx = out_dir / "title_page.docx"
    if title_md.exists():
        total += 1
        result = gerar_docx(title_md, title_docx, bib_files=None, csl_file=None, apendices_file=None, reference_doc=manuscript_reference_doc)
        if result == 0:
            sucessos += 1
    else:
        print("\nℹ️  title_page.md não encontrado. Se a revista exigir Title Page separada, crie esse arquivo e rode novamente.")

    # ========================================================================
    # 3. GERAR COVER LETTER
    # ========================================================================
    cover_md = base_dir / "cover_letter.md"
    cover_docx = out_dir / "cover_letter.docx"
    if cover_md.exists():
        total += 1
        # cover letter geralmente não depende de citações, mas manter citeproc não atrapalha
        result = gerar_docx(cover_md, cover_docx, bib_files=None, csl_file=None, apendices_file=None, reference_doc=cover_reference_doc or manuscript_reference_doc)
        if result == 0:
            sucessos += 1
    else:
        print("\n⚠️  cover_letter.md não encontrado, pulando geração do cover letter.")
    
    # ========================================================================
    # RESUMO FINAL
    # ========================================================================
    print("\n" + "=" * 70)
    print("📊 RESUMO DA GERAÇÃO")
    print("=" * 70)
    print(f"✅ Arquivos gerados com sucesso: {sucessos}/{total}")
    
    if total > 0 and sucessos == total:
        print("\n🎉 Todos os arquivos foram gerados com sucesso!")
        return 0
    elif sucessos > 0:
        print(f"\n⚠️  Alguns arquivos não foram gerados ({total - sucessos} falharam)")
        return 1
    else:
        print("\n❌ Nenhum arquivo foi gerado!")
        return 1

if __name__ == "__main__":
    sys.exit(main())
