#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para gerar arquivos HTML com referências a partir do Markdown
Uso: python gerar-html.py
Gera artigo.html (Português) e artigo_ENGLISH.html (English)
"""

import os
import subprocess
import sys
from pathlib import Path
import time

def gerar_html(md_file, output_file, bib_file, csl_file, apendices_file=None):
    """
    Gera arquivo HTML usando Pandoc
    
    Args:
        md_file: Arquivo Markdown de entrada
        output_file: Arquivo HTML de saída
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
                    return 1
    
    # Comando Pandoc para HTML
    cmd = [
        "pandoc",
        str(md_file),
        "--to", "html5",
        "--embed-resources",
        "--standalone",
        "--mathjax",
        "--citeproc",
        "--bibliography", str(bib_file),
        "--csl", str(csl_file),
        "-o", str(output_file)
    ]
    
    # Adicionar apêndices ANTES do --citeproc
    if apendices_file and apendices_file.exists():
        cmd.insert(1, str(apendices_file))
        print(f"📎 Incluindo apêndices: {apendices_file.name}")
    
    print(f"🚀 Executando Pandoc...")
    
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
    base_dir = script_dir
    os.chdir(base_dir)
    
    print("=" * 70)
    print("🌐 GERADOR DE ARTIGOS HTML - PORTUGUÊS E INGLÊS")
    print("=" * 70)
    
    # Arquivos comuns - procurar no script_dir ou parent
    bib_file = base_dir / "referencias_artigo.bib"
    if not bib_file.exists():
        bib_file = base_dir.parent / "referencias_artigo.bib"
    csl_file = base_dir / "apa.csl"
    if not csl_file.exists():
        csl_file = base_dir.parent / "apa.csl"
    # apendices_pt = base_dir / "apendices.md"  # Comentado: artigo ainda não possui apêndices
    
    # Verificar arquivos necessários
    arquivos_necessarios = [bib_file, csl_file]
    arquivos_faltando = [f for f in arquivos_necessarios if not f.exists()]
    
    if arquivos_faltando:
        print("\n❌ Erro: Arquivos necessários não encontrados:")
        for arquivo in arquivos_faltando:
            print(f"   - {arquivo}")
        return 1
    
    # Contador de sucesso
    sucessos = 0
    total = 2
    
    # ========================================================================
    # 1. GERAR ARTIGO EM PORTUGUÊS
    # ========================================================================
    md_pt = base_dir / "artigo.md"
    if not md_pt.exists():
        md_pt = base_dir.parent / "artigo.md"
    if not md_pt.exists():
        md_pt = base_dir / "scripts" / "artigo.md"
    html_pt = base_dir / "artigo.html"
    
    if not md_pt.exists():
        print(f"\n⚠️  Arquivo {md_pt} não encontrado, pulando...")
    else:
        # Passar None para apendices_pt pois o artigo ainda não possui apêndices
        result = gerar_html(md_pt, html_pt, bib_file, csl_file, apendices_file=None)
        if result == 0:
            sucessos += 1
    
    # ========================================================================
    # 2. GERAR ARTIGO EM INGLÊS
    # ========================================================================
    md_en = base_dir / "artigo_ENGLISH.md"
    if not md_en.exists():
        md_en = base_dir.parent / "artigo_ENGLISH.md"
    if not md_en.exists():
        md_en = base_dir / "scripts" / "artigo_ENGLISH.md"
    html_en = base_dir / "artigo_ENGLISH.html"
    apendices_en = base_dir / "apendices_ENGLISH.md" if (base_dir / "apendices_ENGLISH.md").exists() else (base_dir.parent / "apendices_ENGLISH.md" if (base_dir.parent / "apendices_ENGLISH.md").exists() else (base_dir / "scripts" / "apendices_ENGLISH.md" if (base_dir / "scripts" / "apendices_ENGLISH.md").exists() else None))
    
    if not md_en.exists():
        print(f"\n⚠️  Arquivo {md_en} não encontrado, pulando...")
    else:
        result = gerar_html(md_en, html_en, bib_file, csl_file, apendices_en)
        if result == 0:
            sucessos += 1
    
    # ========================================================================
    # RESUMO FINAL
    # ========================================================================
    print("\n" + "=" * 70)
    print("📊 RESUMO DA GERAÇÃO")
    print("=" * 70)
    print(f"✅ Arquivos gerados com sucesso: {sucessos}/{total}")
    
    if sucessos == total:
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