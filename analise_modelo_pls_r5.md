# Análise Comparativa: Modelo PLS-R5 (draw.io) vs Dados Gerados (R)

## 1. ESTRUTURA DO MODELO PLS-R5 (draw.io)

### 1.1 Modelo Global (Cerrado)

```
VARIÁVEIS LATENTES:
├── P Total (r² = 0.959)
│   ├── Indicadores de saída: PT, EstPT
│   ├── Loadings: λ = 0.981, λ = -0.402
│   └── Entrada: P Lábil → P Total (β = -0.313)
│                P Húmico → P Total (β = 1.286)
│
└── N Total (r² = 0.959)
    ├── Indicadores de saída: NT, EstNT
    ├── Loadings: λ = 0.981, λ = -0.402
    └── Entrada: N Lábil → N Total (β = -0.313)
                 N Húmico → N Total (β = 1.286)

INDICADORES DE ENTRADA:
P Lábil: PLábil (λ=0.990), PMOL (λ=0.988)
P Húmico: PTAF (λ=0.990), PTAH (λ=1.0), PTHum (λ=0.988)
N Lábil: NLábil (λ=0.990), NMOL (λ=1.0)
N Húmico: NTAF (λ=0.988), NTAH (λ=1.0), NTHum (λ=0.999)
```

### 1.2 Modelo Multigrupo (5 Ambientes)

**Cerrado:**
- P Total: r² = 0.892
- N Total: r² = 0.892

**Estrutura paralela para 4 outros ambientes (Agricultura, Mogno, Eucalipto, Teca)**

---

## 2. DADOS GERADOS PELOS SCRIPTS R

### 2.1 Coeficientes de Caminho (Path Coefficients)

| Grupo | Relacionamento | Coeficiente |
|-------|---|---|
| Cerrado | N_húmico → N_total | **1.286** ✓ |
| Cerrado | N_lábil → N_total | **-0.313** ✓ |
| Agricultura | N_húmico → N_total | 1.18 |
| Agricultura | N_lábil → N_total | -0.237 |
| Mogno | N_húmico → N_total | 1.271 |
| Mogno | N_lábil → N_total | -0.277 |
| Eucalipto | N_húmico → N_total | 1.275 |
| Eucalipto | N_lábil → N_total | -0.283 |
| Teca | N_húmico → N_total | 1.372 |
| Teca | N_lábil → N_total | -0.445 |

✓ = Valores confirmados no draw.io para Cerrado

### 2.2 VIP Scores para Nitrogênio (N)

| Variável | VIP |
|----------|-----|
| EstNT | 2.447 |
| NTHum | 1.574 |
| EstNTHum | 1.186 |
| NTAH | 0.726 |
| EstNAH | 0.461 |
| NTAF | 0.351 |
| NLabil | 0.339 |
| EstNAF | 0.309 |
| EstNLabil | 0.213 |
| NMOL | 0.096 |
| EstNMOL | 0.041 |

**Interpretação:** EstNT (N total estratificado) é o preditor mais importante (VIP=2.447 > 1.0)

### 2.3 VIP Scores para Fósforo (P)

| Variável | VIP |
|----------|-----|
| EstPT | 2.447 |
| PTHum | 1.574 |
| EstPTHum | 1.186 |
| PTAH | 0.726 |
| EstPAH | 0.461 |
| PTAF | 0.351 |
| PLabil | 0.339 |
| EstPAF | 0.309 |
| EstPLabil | 0.213 |
| PMOL | 0.096 |
| EstPMOL | 0.041 |

---

## 3. FIGURAS GERADAS (Onde Inserir)

### 3.1 Figuras PLSR de Nitrogênio
- **biplot_plsr_nt.png** - Biplot mostrando relação entre variáveis e componentes
  - Localizar no artigo: Seção 3.3 (Regressão PLS para N)
  - Referência: próximo ao texto sobre PLSR_NT.R

- **predicoes_nt.png** - Gráfico de predições vs observados
  - Localizar: Seção 3.3 (Avaliação do modelo PLSR-NT)

### 3.2 Figuras PLSR de Fósforo
- **biplot_plsr_pt.png** - Biplot mostrando relação entre variáveis e componentes
  - Localizar: Seção 3.4 (Regressão PLS para P)

- **predicoes_pt.png** - Gráfico de predições vs observados
  - Localizar: Seção 3.4 (Avaliação do modelo PLSR-PT)

- **vip_pt.png** - Gráfico de VIP scores
  - Localizar: Seção 3.4 (Importância das variáveis)

- **residuos_pt.png** - Análise de resíduos
  - Localizar: Seção 3.4 (Diagnóstico do modelo)

### 3.3 Figura de Comparação
- **comparacao_coeficientes.png** - Comparação dos coeficientes entre ambientes
  - Localizar: Seção 3.5 (Análise Multigrupo - PLS-MGA)
  - Mostra: N_húmico → N_total e N_lábil → N_total para 5 ambientes

---

## 4. TABELAS GERADAS (Onde Inserir)

### 4.1 Tabelas VIP
- **tabela_vip_nt.csv** - VIP scores para modelo de N
- **tabela_vip_pt.csv** - VIP scores para modelo de P
  - Localizar: Apêndice ou Tabela suplementar
  - Usar: Para discutir importância relativa das variáveis

### 4.2 Tabelas Multigrupo
- **tabela_coeficientes_estratificados.csv** - Coeficientes para 5 ambientes
  - Localizar: Tabela 3 ou Tabela 4 (Seção 3.5)
  - Mostra: Variabilidade dos efeitos entre grupos

- **tabela_r2_pls_sem.csv** - R² dos modelos por ambiente (vazio - precisa verificar)
  - Localizar: Tabela de ajuste do modelo

---

## 5. VALIDAÇÃO DO MODELO: ALINHAMENTO DRAW.IO ↔ DADOS R

### ✓ CONFIRMADO (Valores idênticos)
- **Cerrado - N_húmico → N_total: β = 1.286** ✓ Aparece no draw.io
- **Cerrado - N_lábil → N_total: β = -0.313** ✓ Aparece no draw.io

### ⚠ INFORMAÇÃO INCOMPLETA NO DRAW.IO
- **R² values**: Draw.io mostra r² = 0.959 para Cerrado (global)
  - Dados R indicam r² pode variar entre grupos
  - Necessário: Verificar se P Total também tem coeficientes (draw.io incompleto?)

### ❓ A INVESTIGAR
- Arquivo `tabela_r2_pls_sem.csv` está vazio - Regenerar?
- Coeficientes para P (fósforo) - estão no draw.io mas não nos dados gerados?

---

## 6. RECOMENDAÇÕES PARA INTEGRAÇÃO

### 6.1 Estrutura sugerida do artigo (Seção 3)

```markdown
## 3. RESULTADOS

### 3.1 Estatísticas Descritivas
- Usar: fuzzy_relatorio_01_estatisticas_descritivas.csv
- Tabela: Resumo N, P, densidade do solo

### 3.2 Modelo Fuzzy (FSNSI)
- [Figuras 7-11 já integradas]

### 3.3 Análise PLSR para Nitrogênio
- Figura: biplot_plsr_nt.png (modelo)
- Figura: predicoes_nt.png (validação)
- Tabela: tabela_vip_nt.csv (VIP scores)
- Texto: Explicar coeficientes

### 3.4 Análise PLSR para Fósforo
- Figura: biplot_plsr_pt.png (modelo)
- Figura: predicoes_pt.png (validação)
- Figura: vip_pt.png (VIP scores)
- Figura: residuos_pt.png (diagnóstico)
- Tabela: tabela_vip_pt.csv (VIP scores)

### 3.5 Análise Multigrupo (PLS-MGA)
- Figura: comparacao_coeficientes.png (efeitos por ambiente)
- Tabela: tabela_coeficientes_estratificados.csv
- Tabela: tabela_r2_pls_sem.csv (ajuste por ambiente)

### 3.6 Modelo Conceitual PLS-SEM
- Figura: modelo-pls-R5.drawio (exportado como PNG)
  - Com anotações dos coeficientes validados
```

### 6.2 Checklist de Integração
- [ ] Exportar modelo-pls-R5.drawio como PNG
- [ ] Inserir no artigo entre Seções 3.5 e Discussão
- [ ] Referenciar todos os coeficientes com dados das tabelas
- [ ] Verificar se estão os 5 ambientes no diagrama ou adicionar
- [ ] Gerar/verificar tabela_r2_pls_sem.csv
- [ ] Adicionar legenda explicando símbolos (hexágonos=VL, retângulos=indicadores)

---

## 7. PRÓXIMOS PASSOS

1. **Regenerar tabela_r2_pls_sem.csv** (se necessário)
2. **Exportar draw.io para PNG** com alta qualidade
3. **Inserir figura comparativa** (modelo global + 5 grupos)
4. **Documentar loadings e CVommunalities** se necessário
5. **Criar Tabela de Síntese** com:
   - Coeficientes para P (fósforo) também
   - R² por ambiente e por construto
   - Loadings dos indicadores principais

