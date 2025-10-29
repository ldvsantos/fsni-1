#!/usr/bin/env python3
"""
Conta palavras em um arquivo Markdown excluindo a seção de referências.

Uso:
    python count_words_exclude_refs.py [caminho/para/artigo.md]

Se nenhum caminho for fornecido, usa o arquivo padrão `artigo.md` na pasta atual.

O script identifica o início da seção de referências por marcadores comuns
(`# Referências`, `# References`, `<div id="refs">`, `\bibliography{` etc.) e
remove tudo a partir desse ponto antes de contar palavras. Também remove
elementos Markdown comuns (imagens, links, blocos de código) e citações
no formato Pandoc/BibTeX (@autorYYYY e [@autorYYYY]).
"""

from pathlib import Path
import argparse
import re
import sys


DEFAULT_PATH = Path(__file__).resolve().parents[1] / "artigo.md"


def strip_references_section(text: str) -> str:
    # Procura por marcadores que indicam início das referências e corta o texto
    markers = [r'^#{1,3}\s*Refer', r'^#{1,3}\s*References', r'^<div\s+id="refs"', r'^\\bibliography', r'^<!--\s*references', r'^#\s*Referências']
    pattern = re.compile('|'.join(markers), flags=re.IGNORECASE | re.MULTILINE)
    m = pattern.search(text)
    if m:
        return text[:m.start()]
    return text


def remove_markdown_noise(text: str) -> str:
    # Remove APENAS sintaxe Markdown mínima, preservando TODO conteúdo (tabelas, código, equações)
    
    # Preserva code fences, inline code, tabelas - APENAS remove marcadores
    # Remove apenas ``` no início e fim de blocos de código, mantendo conteúdo
    text = re.sub(r'^```\w*\s*$', '', text, flags=re.MULTILINE)
    
    # Remove apenas crases simples de inline code, mantendo conteúdo
    text = re.sub(r'`', '', text)
    
    # Remove APENAS sintaxe de imagens ![alt](url), preservando alt text
    text = re.sub(r'!\[([^\]]*)\]\([^\)]*\)', r'\1', text)
    
    # Remove APENAS sintaxe de links [text](url), preservando text
    text = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', text)
    
    # Remove tags HTML vazias, mantém conteúdo entre tags
    text = re.sub(r'<([^/>]+)>([^<]*)</\1>', r'\2', text)
    text = re.sub(r'<[^>]+/>', ' ', text)
    
    # Remove APENAS colchetes de citações Pandoc [@...], mantém conteúdo
    text = re.sub(r'\[@', '', text)
    text = re.sub(r'@', '', text)
    text = re.sub(r'\]', '', text)
    
    # Remove APENAS marcadores Markdown (#, *, -, |), preserva TODO o texto
    text = re.sub(r'^#{1,6}\s+', '', text, flags=re.MULTILINE)
    text = re.sub(r'^\s*[-*+]\s+', '', text, flags=re.MULTILINE)
    text = re.sub(r'^\s*\d+\.\s+', '', text, flags=re.MULTILINE)
    text = re.sub(r'\|', ' ', text)  # Separadores de tabela
    text = re.sub(r'^[-:|\s]+$', '', text, flags=re.MULTILINE)  # Linhas separadoras de tabela
    
    # Remove apenas sintaxe LaTeX ($ para equações), mantém conteúdo
    text = re.sub(r'\$\$?', '', text)
    
    # Normaliza whitespace
    text = re.sub(r'\s+', ' ', text)
    return text.strip()


def count_words(text: str) -> int:
    # Use Unicode word characters
    words = re.findall(r"\w+", text, flags=re.UNICODE)
    return len(words)


def extract_bib_content(bib_path: Path) -> str:
    """Extrai conteúdo textual de um arquivo .bib (títulos, autores, abstracts, etc.)"""
    if not bib_path.exists():
        return ""
    
    text = bib_path.read_text(encoding='utf-8', errors='ignore')
    
    # Remove comandos LaTeX e chaves de entrada BibTeX
    text = re.sub(r'@\w+\{[^,]*,', '', text)  # Remove @article{key,
    text = re.sub(r'^\s*\w+\s*=\s*[{\"]', '', text, flags=re.MULTILINE)  # Remove field =
    text = re.sub(r'[}\"],?\s*$', '', text, flags=re.MULTILINE)  # Remove trailing }",
    text = re.sub(r'\\[a-zA-Z]+\{([^}]*)\}', r'\1', text)  # Remove \command{text} -> text
    text = re.sub(r'[{}]', ' ', text)  # Remove remaining braces
    
    return text


def extract_sections(text: str) -> dict:
    """Extrai as seções principais do artigo: Resumo, Introdução, Métodos, Resultados, Conclusão"""
    sections = {
        'Resumo': '',
        'Introdução': '',
        'Material e Métodos': '',
        'Resultados e Discussão': '',
        'Conclusão': ''
    }
    
    # Padrões para identificar cada seção (case-insensitive)
    patterns = {
        'Resumo': r'^#\s*Resumo',
        'Introdução': r'^#\s*\d*\.?\s*Introdução',
        'Material e Métodos': r'^#\s*\d*\.?\s*(Material e Métodos|Materiais? e Métodos?)',
        'Resultados e Discussão': r'^#\s*\d*\.?\s*Resultados?\s*(e|and)?\s*Discussão',
        'Conclusão': r'^#\s*\d*\.?\s*(Conclusão|Conclusões)'
    }
    
    # Encontra todas as posições das seções
    section_positions = {}
    for section_name, pattern in patterns.items():
        match = re.search(pattern, text, flags=re.IGNORECASE | re.MULTILINE)
        if match:
            section_positions[section_name] = match.start()
    
    # Ordena as seções por posição
    sorted_sections = sorted(section_positions.items(), key=lambda x: x[1])
    
    # Extrai o conteúdo de cada seção
    for i, (section_name, start_pos) in enumerate(sorted_sections):
        # Determina onde a seção termina (início da próxima ou fim do texto)
        if i < len(sorted_sections) - 1:
            end_pos = sorted_sections[i + 1][1]
        else:
            # Para a última seção, vai até as referências ou fim do texto
            ref_match = re.search(r'^#\s*Referências', text[start_pos:], flags=re.IGNORECASE | re.MULTILINE)
            if ref_match:
                end_pos = start_pos + ref_match.start()
            else:
                end_pos = len(text)
        
        sections[section_name] = text[start_pos:end_pos]
    
    return sections


def count_section_words(section_text: str, method: str) -> int:
    """Conta palavras em uma seção específica"""
    clean = remove_markdown_noise(section_text)
    
    if method == 'unicode':
        return count_words(clean)
    else:
        tokens = re.findall(r"\S+", clean)
        return len(tokens)


def main():
    parser = argparse.ArgumentParser(description=r'Conta palavras em Markdown por seção estrutural (Resumo, Introdução, Métodos, Resultados, Conclusão)')
    parser.add_argument('path', nargs='?', default=str(DEFAULT_PATH), help='Caminho para o arquivo Markdown (padrão: artigo.md)')
    parser.add_argument('--include-bibtex', action='store_true', help='Incluir contagem das referências do arquivo .bib (simula o que Pandoc gera no DOCX)')
    parser.add_argument('--method', choices=['unicode', 'whitespace'], default='whitespace', help=r"Método de tokenização: 'unicode' usa \\w+, 'whitespace' (padrão) conta tokens separados por espaços (mais próximo do Word)")
    args = parser.parse_args()

    path = Path(args.path)
    if not path.exists():
        print(f'Arquivo não encontrado: {path}', file=sys.stderr)
        sys.exit(2)

    text = path.read_text(encoding='utf-8')

    # Remove frontmatter YAML (--- ... ---) mas captura o arquivo bibliography
    bib_file = None
    yaml_match = re.match(r'^---[\s\S]*?---\s*', text)
    if yaml_match:
        yaml_content = yaml_match.group(0)
        bib_match = re.search(r'bibliography:\s*(\S+)', yaml_content)
        if bib_match:
            bib_file = bib_match.group(1)
        text = text[yaml_match.end():]

    # Remove seção de referências (vazia no .md)
    body = strip_references_section(text)

    # Extrai e conta palavras por seção
    sections = extract_sections(body)
    
    print(f'\n{"="*60}')
    print(f'Arquivo: {path.name}')
    print(f'Método: {args.method}')
    print(f'{"="*60}\n')
    
    print('CONTAGEM POR SEÇÃO:')
    print(f'{"-"*60}')
    
    total_body = 0
    for section_name, section_content in sections.items():
        if section_content:  # Só conta se a seção foi encontrada
            word_count = count_section_words(section_content, args.method)
            total_body += word_count
            print(f'{section_name:.<30} {word_count:>8} palavras')
    
    print(f'{"-"*60}')
    print(f'{"SUBTOTAL (corpo do artigo)":.<30} {total_body:>8} palavras')

    # Conta referências do BibTeX se solicitado
    total_refs = 0
    if args.include_bibtex and bib_file:
        bib_path = path.parent / bib_file
        if bib_path.exists():
            bib_content = extract_bib_content(bib_path)
            bib_clean = remove_markdown_noise(bib_content)
            if args.method == 'unicode':
                total_refs = count_words(bib_clean)
            else:
                total_refs = len(re.findall(r"\S+", bib_clean))
            print(f'{"Referências (BibTeX)":.<30} {total_refs:>8} palavras')
        else:
            print(f'\nAviso: arquivo bibliography não encontrado: {bib_path}', file=sys.stderr)

    total = total_body + total_refs
    
    print(f'{"="*60}')
    print(f'{"TOTAL GERAL":.<30} {total:>8} palavras')
    print(f'{"="*60}\n')


if __name__ == '__main__':
    main()
