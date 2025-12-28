#!/usr/bin/env python3
"""
Script de entrada para geração de documentos DOCX.
Chama o módulo principal em gerar_docx/
"""

import sys
from pathlib import Path

# Adiciona pasta gerar_docx ao path
gerar_docx_dir = Path(__file__).parent / 'gerar_docx'
sys.path.insert(0, str(gerar_docx_dir))

# Importa e executa o módulo principal
if __name__ == '__main__':
    # Carrega o script principal
    import runpy
    script_path = gerar_docx_dir / 'gerar-docx.py'
    runpy.run_path(str(script_path), run_name='__main__')
