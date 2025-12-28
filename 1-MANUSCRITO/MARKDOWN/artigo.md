---
title: "Dinâmica Funcional de Nitrogênio e Fósforo em Solos Tropicais sob Diferentes Usos: Uma Abordagem Integrada Fuzzy-PLS"
author: "Diego Vidal"
date: "29 de outubro de 2025"
bibliography: referencias_artigo.bib
csl: apa.csl
reference-doc: modelo_formatacao.docx
fig-align: center
table-align: center
lang: pt-BR
---

# Resumo

A conversão de ecossistemas naturais em sistemas agrícolas altera a dinâmica de fósforo (P) e nitrogênio (N) no solo, impactando a sustentabilidade de ambientes tropicais. Este estudo avaliou a dinâmica funcional de N e P em frações lábeis e húmicas sob quatro usos da terra no sul do Tocantins (Cerrado nativo, Eucalipto, Pastagem e Agricultura com milho). O objetivo foi integrar evidências preditivas, estruturais e sínteses fuzzy para o diagnóstico da funcionalidade edáfica. Amostras de 0–50 cm foram analisadas para frações lábeis e húmicas de N e P, além de estoques totais e densidade do solo. A Regressão por Mínimos Quadrados Parciais (PLSR) identificou as frações húmicas como preditoras dominantes (VIP > 1,0) da disponibilidade de nutrientes. A Modelagem por Equações Estruturais (PLS-SEM) demonstrou que as frações húmicas exercem um efeito positivo forte sobre os estoques totais de N e P (β = 1,286), enquanto as frações lábeis apresentaram coeficientes negativos moderados (β = −0,313). A simetria dos coeficientes entre N e P sugere um acoplamento biogeoquímico fundamental em Latossolos. O Índice de Sustentabilidade Nutricional do Solo Fuzzy (FSNSI) diferenciou os usos, com o Eucalipto apresentando a maior funcionalidade (FSNSI = 6,07), superando o Cerrado nativo. A densidade do solo foi confirmada como fator limitante transversal, correlacionando-se negativamente com o FSNSI. Conclui-se que o enriquecimento das frações húmicas, associado a um melhor aporte de serapilheira e estrutura física, é o principal suporte para os estoques de N e P e a funcionalidade edáfica. A integração metodológica proposta constitui uma abordagem robusta e multiescalar para o diagnóstico da sustentabilidade nutricional do solo e a orientação de intervenções conservacionistas em ambientes tropicais.


**Palavras-chave:** Nitrogênio do solo; Frações húmicas; Mudança de uso da terra; Cerrado; Latossolo.

# 1. Introdução

A conversão de ecossistemas nativos, como o Cerrado, para sistemas agropecuários e silviculturais altera profundamente os ciclos biogeoquímicos, impactando a qualidade e a quantidade da matéria orgânica do solo (MOS) [@lal2020]. Essas alterações refletem-se diretamente na dinâmica de nitrogênio (N) e fósforo (P), nutrientes essenciais cuja disponibilidade é regulada por processos de mineralização e imobilização em frações húmicas e lábeis [@cotrufo2019]. Em solos tropicais altamente intemperizados, a manutenção dessas frações é crítica para a sustentabilidade edáfica, atuando na retenção de água e na estruturação do solo [@sano2020].

Embora a importância individual de N e P seja bem documentada, a compreensão do acoplamento biogeoquímico entre suas formas lábeis e estáveis sob diferentes usos da terra permanece limitada. A interação entre esses elementos na MOS sugere que a perturbação em um ciclo afeta a estabilidade do outro, exigindo uma análise integrada [@helfenstein2020]. Abordagens tradicionais frequentemente falham em capturar a complexidade dessas interações não lineares. Nesse contexto, a Modelagem por Equações Estruturais (PLS-SEM) surge como uma ferramenta robusta para quantificar relações causais entre compartimentos do solo, enquanto a Lógica Fuzzy permite sintetizar múltiplos indicadores em índices de sustentabilidade interpretáveis, lidando com a incerteza inerente aos dados ambientais [@hair2021; @mendonca2024].

Este estudo justifica-se pela necessidade de avaliar o impacto da expansão agrícola e silvicultural no Cerrado (um hotspot de biodiversidade) sobre a funcionalidade nutricional do solo. A escolha dos sistemas de uso (Eucalipto, Mogno, Teca e Agricultura) reflete as principais tendências de ocupação da terra na região, permitindo uma comparação direta com o ecossistema nativo.

O objetivo deste trabalho foi diagnosticar a dinâmica funcional de N e P em frações húmicas e lábeis de um Latossolo sob diferentes usos, integrando modelagem preditiva (PLSR), estrutural (PLS-SEM) e um Índice de Sustentabilidade Nutricional Fuzzy (FSNSI). Busca-se, especificamente, identificar quais frações controlam os estoques totais e como o manejo do solo altera o acoplamento entre N e P, fornecendo subsídios para práticas de manejo mais sustentáveis.

# Metodologia

## Área de estudo

A pesquisa foi desenvolvida, no município de São Valério da Natividade em Tocantins, com área total de 53,23 ha, nas coordenadas geográficas 11º54'37" S e 48º12'31" O (Figura 1).


![Figura 1. Localização das áreas experimentais](../../2-FIGURAS/mapa_area.png){#fig:1 width=70%}

O clima do município, é do tipo úmido subsumido com moderada deficiência hídrica (C2wA'a"), com duas estações bem definidas, inverno seco que vai de maio a outubro e verão chuvoso, de novembro a abril [@thornthwaite1948]. De acordo com a classificação climática de Köppen, o município de São Valério da Natividade possui pluviosidade média anual de 1643.3 mm, temperatura média 26°C. Está localizado a uma altitude de 320.48 m, e possui 90% da região com declividade inferior a 8º, indicando solos planos [@cho2021]. Os solos das áreas experimentais foram classificados como Latossolo Vermelho-Amarelo, possui uma estrutura granular a subagregada, com boa a excelente drenagem, porém é naturalmente pobre em nutrientes, especialmente nitrogênio, fósforo e potássio [@ker1997; @lopes1996].

## Características das áreas de estudo

As características detalhadas dos sistemas de uso da terra avaliados, incluindo histórico, manejo e adubação, estão sumarizadas na Tabela 1. As doses de fertilizantes seguiram as recomendações técnicas para cada cultura na região.

: Tabela 1 - Caracterização dos sistemas de uso da terra avaliados no sul do Tocantins.

| Sistema | Idade | Espaçamento/Densidade | Preparo do Solo | Adubação/Manejo |
|:---|:---:|:---:|:---|:---|
| **Cerrado** (*Sensu Stricto*) | > 40 anos | Natural (Denso) | Sem intervenção | Área de referência (testemunha). Vegetação nativa preservada. |
| **Eucalipto** (*Eucalyptus* sp.) | 5 anos | 3 x 2 m (1667 pl/ha) | Lâmina, Aragem, Gradagem | Cova: NPK 5-25-15 + Ca, S, Zn, Cu, B. Adubação de base para arranque. |
| **Mogno Africano** (*Khaya ivorensis*) | 7 anos | 3 x 3 m (1111 pl/ha) -> 6 x 6 m | Lâmina, Aragem, Gradagem | Cova: NPK 00-10-10 + Esterco bovino (trimestral no 1º ano). Desbaste após fechamento de copa. |
| **Teca** (*Tectona grandis*) | 10 anos | 3 x 2 m (1667 pl/ha) | Lâmina, Aragem, Gradagem | Cobertura: NPK 20-05-20 (2x no 1º ano). Podas e desbrotas frequentes. |
| **Agricultura** (Soja/Milho) | > 10 anos | Soja: 0.5 m entrelinha<br>Milho: 0.2 x 0.8 m | Gradagem, Nivelamento/Sulcamento | Soja: 300 kg/ha NPK 4-28-10 + Fungicidas/Inseticidas.<br>Milho: 400 kg/ha NPK 4-14-18 + N em cobertura (50-150 kg/ha). |



Um inventário fitossociológico da área de Cerrado foi realizado (Apêndice A).

## Amostragem de solo

A amostragem de solo foi realizada em [Mês/Ano], ao final da estação chuvosa. Em cada sistema de uso da terra, foram abertas cinco trincheiras (70 × 70 × 100 cm) distribuídas aleatoriamente, totalizando 25 unidades amostrais.

A coleta foi estratificada em oito profundidades: 0-10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-80 e 80-100 cm. Para determinação da densidade do solo, foram coletadas amostras indeformadas utilizando anéis volumétricos de aço inoxidável (Kopecky). Simultaneamente, amostras deformadas foram coletadas para as análises químicas e de fracionamento da matéria orgânica. As amostras deformadas foram secas ao ar, destorroadas e passadas em peneira de 2 mm (TFSA).

### Análises físicas

A determinação da distribuição dos tamanhos das partículas do solo foi realizada em amostras deformadas por meio do método da pipeta [@teixeira2017] (TABELA 2). A determinação da densidade do solo foi realizada por meio do método do cilindro volumétrico, conforme descrito por @teixeira2017 (APENDICE B). Desta forma, cilindros de aço inoxidável com 3 cm de diâmetro e 8 cm de altura foram inseridos e retirados do solo sem ocorrer deformação e acondicionadas em sacos plásticos devidamente identificados. As amostras indeformadas foram submetidas à secagem por 72 horas, utilizando-se uma estufa de ventilação forçada com temperatura regulada para 105ºC, sendo determinada a massa de solo seco para realização do cálculo de densidade.



### Análises químicas

#### Determinação do fósforo total no solo

O solo foi pesado em 0,5 g, passado em peneira de 150 μm (100 mesh), depois foi realizado a adição do ácido sulfúrico mais o peróxido de hidrogênio, e colocado em bloco digestor. Através de colorimetria pelo método de Murphy e Riley (1962) foi determinado P total do solo.

#### Fracionamento das substâncias húmicas e teores de fósforo em cada fração

Para extrair as substâncias húmicas, as amostras de solo passaram por um processo de fracionamento seguindo o método da International Humic Substances Society (IHSS), conforme descrito por SWIFT em 1996. Esse processo resultou na obtenção das frações de ácidos fúlvicos (AF), ácidos húmicos (AH) e humina (Hum), baseado na solubilidade em soluções ácidas e alcalinas. A extração começou com a mistura de 200 gramas de solo com uma solução de HCl a 0,1 mol/L, na proporção de 1 grama de solo para 10 mililitros de solução. Essa mistura foi agitada manualmente por 1 hora e, em seguida, deixada em repouso por 4 horas. O líquido que ficou por cima foi sifonado e reservado, dando origem ao extrato I de ácidos fúlvicos. Depois disso, adicionou-se uma solução de NaOH a 0,1 mol/L na mesma proporção (1:10) e também foi agitada manualmente. Após essa etapa, a solução foi deixada em repouso por 16 horas. Em seguida, o material que se precipitou foi separado, correspondendo à fração de humina e ao material mineral. O sobrenadante, que continha as frações de AF e AH, foi centrifugado por 10 minutos a 10.000 rpm. Depois, acidificou-se essa solução com a adição de 50 mililitros de HCl a 6 mol/L, ajustando o pH para um valor entre 1 e 2, e agitou-se manualmente por dois minutos. Após esse procedimento, a solução foi deixada em repouso por 12 horas. Ao final, o sobrenadante foi desviado, obtendo-se o extrato II de ácidos fúlvicos, enquanto o material precipitado estava relacionado à fração de ácidos húmicos. Após o fracionamento das substâncias húmicas, as amostras foram congeladas e liofilizadas para a determinação dos teores de P em cada fração AF, AH e Hum, utilizando o método de colorimetria pelo método de Murphy e Riley (1962).


#### Determinação dos estoques de fósforo

A partir das concentrações de P obtidas no solo e em cada uma das frações húmicas, foi possível determinar os estoques no solo e frações húmicas, expresso em microgramas por hectare (Mg ha⁻¹), para cada profundidade amostrada, conforme equação a seguir:

$$\text{EstP} = \text{TP} \times \text{Ds} \times e$$

Em que:
- EstP = Estoque de P na camada do solo, em Mg ha⁻¹;
- TP = Teor de P na fração amostrada de solo, em g kg⁻¹;
- Ds = Densidade do solo, em g cm⁻³;
- e = espessura da camada, em cm.

Após o cálculo do estoque de P em cada camada, foi realizada a correção do estoque de P. Por fim, o estoque total de P no solo e nas substâncias húmicas na profundidade de 0 a 50 cm foi resultante da soma dos valores obtidos em cada camada amostrada.

### Determinação dos estoques de Nitrogênio

Os teores de Nitrogênio total (NT) foram determinados pelo método de combustão a seco (analisador elementar PE-2400 Série II Perkin Elmer) em amostras maceradas (< 150 μm). O fracionamento das substâncias húmicas seguiu o mesmo procedimento descrito para o fósforo (método IHSS), com determinação subsequente de N nas frações liofilizadas (AF, AH e Hum) por combustão a seco.

Os estoques de N (EstN) e P (EstP) em cada camada foram calculados conforme a Equação 2:

$$\text{Est} = \text{Teor} \times \text{Ds} \times e$$

Em que:
- Est = Estoque do nutriente (N ou P), em Mg ha⁻¹;
- Teor = Concentração do nutriente na fração, em g kg⁻¹;
- Ds = Densidade do solo, em g cm⁻³;
- e = espessura da camada, em cm.

Os estoques totais na camada 0-50 cm foram obtidos pela soma dos estoques das camadas individuais, com correção pela massa de solo equivalente [@sisti2004].

## Análises estatísticas

A análise dos dados seguiu uma abordagem hierárquica. Inicialmente, a normalidade dos resíduos foi verificada (Shapiro-Wilk) e a homogeneidade de variâncias testada (Levene). Diferenças entre usos da terra e profundidades foram avaliadas por ANOVA, seguida de teste de Tukey (p < 0.05).

Para modelagem preditiva, utilizou-se Regressão por Mínimos Quadrados Parciais (PLSR) para identificar as frações de N e P mais relevantes (VIP scores) na predição dos estoques totais. A estrutura causal entre frações lábeis, húmicas e estoques totais foi modelada via Equações Estruturais (PLS-SEM), avaliando-se coeficientes de caminho e qualidade de ajuste (R², SRMR). Por fim, um Sistema de Inferência Fuzzy (Mamdani) foi desenvolvido para integrar os indicadores em um índice de sustentabilidade (FSNSI). Detalhes completos dos procedimentos estatísticos, configurações dos modelos e parâmetros de validação estão disponíveis no Material Suplementar. Todas as análises foram realizadas no ambiente R [@Team2019].




# Resultados e Discussão

## Predição dos estoques de N e P (PLSR)

A Regressão por Mínimos Quadrados Parciais (PLSR) demonstrou que as frações húmicas são os principais preditores dos estoques totais de Nitrogênio (NT) e Fósforo (PT). Os escores VIP (Variable Importance in Projection) indicaram que as frações associadas aos Ácidos Húmicos (AH) e Humina (Hum) apresentaram valores > 1.0, confirmando sua dominância na retenção de nutrientes em comparação às frações lábeis (Tabela 5).

![Figura 4. Biplot PLSR para NT. "Est" refere-se aos estoques (Mg ha⁻¹) das frações. A legenda "Ambiente" indica os usos da terra: Cerrado, Eucalipto, Mogno, Teca e Agricultura.](../../2-FIGURAS/biplot_plsr_nt.png){#fig:4 width=90%}

A forte associação entre as frações húmicas e os estoques totais reflete a estabilização de N e P em complexos organo-minerais de longa persistência, essenciais em solos tropicais intemperizados [@cotrufo2019].


![Figura 5. Biplot PLSR para PT. Padrão similar ao NT, evidenciando o acoplamento biogeoquímico.](../../2-FIGURAS/biplot_plsr_pt.png){#fig:5 width=90%}

## Relações estruturais (PLS-SEM) e Análise Multigrupo (PLS-MGA)

A Modelagem por Equações Estruturais (PLS-SEM) explicou 95.9% da variância dos estoques totais de N e P no Cerrado (Figura 6). Os coeficientes de caminho revelaram um efeito positivo forte das frações húmicas (β ≈ 1.28) e um efeito negativo moderado das frações lábeis (β ≈ -0.31), indicando que o acúmulo de nutrientes depende da conversão de formas lábeis em estáveis (humificação).

![Figura 6. Modelo estrutural (PLS-SEM) das frações de N e P.](../../2-FIGURAS/analise_caminhos_pls.png){#fig:6 width=95%}

A Análise Multigrupo (PLS-MGA) evidenciou que o manejo altera essa dinâmica (Figura 7). O Eucalipto manteve coeficientes similares ao Cerrado, enquanto a Agricultura apresentou redução na contribuição húmica (β = 1.18), sugerindo uma maior dependência de frações lábeis devido à fertilização constante e revolvimento do solo.

![Figura 7. Comparação dos coeficientes de caminho (PLS-MGA) entre os usos da terra.](../../2-FIGURAS/comparacao_coeficientes.png){#fig:7 width=95%}




## Integração fuzzy da funcionalidade edáfica: Índice de Sustentabilidade (FSNSI) {-}

O Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) integrou N total, P total e densidade do solo em uma métrica sintética (0-10). A superfície de resposta (Figura 8) demonstra que a sustentabilidade máxima depende da sinergia entre disponibilidade química e qualidade física, sendo penalizada severamente pela compactação (densidade > 1.4 g cm⁻³).

![Figura 8. Função de pertinência fuzzy para a variável de saída FSNSI.](../../2-FIGURAS/funcao_pertinencia_saida.png){#fig:8 width=80%}

O Eucalipto apresentou o maior FSNSI médio (6.07), superando o Cerrado nativo (4.42) e a Agricultura (4.25) (Figura 9). Esse desempenho reflete o acúmulo de serapilheira e a ausência de revolvimento do solo no sistema florestal, favorecendo a humificação. A Teca obteve o pior desempenho (2.77), limitada pela compactação e menor aporte de resíduos de qualidade.

![Figura 9. Distribuição do FSNSI por uso da terra.](../../2-FIGURAS/boxplot_fsnsi_uso_terra.png){#fig:9 width=90%}

A análise estratificada (Figura 10) revelou que a funcionalidade concentra-se nos primeiros 20 cm em todos os sistemas, com declínio abrupto em profundidade, especialmente na Agricultura e Teca. O Cerrado apresentou gradiente natural, enquanto o Eucalipto manteve funcionalidade moderada em subsuperfície.

![Figura 10. Distribuição do FSNSI estratificado por profundidade.](../../2-FIGURAS/fsnsi_profundidade_uso_terra.png){#fig:10 width=95%}

As correlações (Tabela 7) confirmaram que N e P totais são os principais determinantes do FSNSI (r ≈ 0.79), mas a densidade do solo atua como limitante transversal (r = -0.42), indicando que a recuperação química isolada não garante a funcionalidade plena se houver degradação física.

**Tabela 7.** Correlações de Pearson entre variáveis edáficas e FSNSI.

| Variável | r | p-valor |
|:---------|--:|:--------|
| N total | 0.79 | < 0.001 |
| P total | 0.79 | < 0.001 |
| N lábil | 0.63 | < 0.001 |
| Densidade | -0.42 | < 0.001 |



# Conclusão

A integração de PLSR, PLS-SEM e Lógica Fuzzy demonstrou que a sustentabilidade nutricional em Latossolos tropicais é governada pela estabilização de N e P em frações húmicas. O modelo estrutural confirmou que o acúmulo de estoques totais depende primariamente da humificação (β ≈ 1.28), enquanto as frações lábeis desempenham papel secundário ou transitório.

O Índice FSNSI revelou que sistemas florestais bem manejados, como o Eucalipto, podem superar a funcionalidade química do Cerrado nativo, desde que haja manutenção de resíduos e ausência de perturbação do solo. Contudo, a degradação física (compactação) atua como um veto funcional, limitando o desempenho de sistemas como a Teca, mesmo na presença de fertilidade química.

Recomenda-se o uso do FSNSI como ferramenta de monitoramento para identificar fome oculta de qualidade do solo, permitindo intervenções precisas antes do colapso produtivo. Futuros estudos devem incorporar indicadores biológicos para refinar a sensibilidade do índice.

<div id="refs"></div>
