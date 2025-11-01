---
title: "Modelagem Fuzzy-PLS da Dinâmica de Fósforo e Nitrogênio em Usos do Solo no Sul do Tocantins"
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

A conversão de ecossistemas naturais em sistemas agrícolas altera a dinâmica de fósforo (P) e nitrogênio (N) no solo, impactando a sustentabilidade de ambientes tropicais. Este estudo avaliou a dinâmica funcional de N e P em frações lábeis e húmicas sob quatro usos da terra no sul do Tocantins (Cerrado nativo, Eucalipto, Pastagem e Agricultura com milho). O objetivo foi integrar evidências preditivas (PLSR), estruturais (PLS-SEM) e sínteses fuzzy (FSNSI) para o diagnóstico da funcionalidade edáfica. Amostras de 0–50 cm foram analisadas para frações lábeis e húmicas de N e P, além de estoques totais e densidade do solo. A Regressão por Mínimos Quadrados Parciais (PLSR) identificou as frações húmicas como preditoras dominantes (VIP > 1,0) da disponibilidade de nutrientes. A Modelagem por Equações Estruturais (PLS-SEM), com ajuste elevado, demonstrou que as frações húmicas exercem um efeito positivo forte sobre os estoques totais de N e P (β = 1,286), enquanto as frações lábeis apresentaram coeficientes negativos moderados (β = −0,313). A simetria dos coeficientes entre N e P sugere um acoplamento biogeoquímico fundamental em Latossolos. O Sistema de Inferência Fuzzy (FSNSI) diferenciou os usos, com o Eucalipto apresentando a maior funcionalidade (FSNSI = 6,07), superando o Cerrado nativo. A densidade do solo foi confirmada como fator limitante transversal, correlacionando-se negativamente com o FSNSI. Conclui-se que o enriquecimento das frações húmicas, associado a um melhor aporte de serapilheira e estrutura física, é o principal suporte para os estoques de N e P e a funcionalidade edáfica. A integração metodológica proposta (PLSR, PLS-SEM e FSNSI) constitui uma abordagem robusta e multiescalar para o diagnóstico da sustentabilidade nutricional do solo e a orientação de intervenções conservacionistas em ambientes tropicais.


**Palavras-chave:** Nitrogênio do solo; Frações húmicas; Mudança de uso da terra; Cerrado; Latossolo.

# 1. Introdução

Os solos tropicais constituem sistemas biogeoquímicos dinâmicos, onde a matéria orgânica regula os ciclos de nutrientes e sustenta a estabilidade estrutural [@lal2020; @cotrufo2019]. A conversão de ecossistemas nativos para usos agropecuários e silviculturais, no entanto, altera o aporte e a qualidade dos resíduos orgânicos, acelerando a decomposição e reduzindo a formação de compostos húmicos estáveis. Isso resulta na diminuição dos estoques de nitrogênio (N) e fósforo (P), comprometendo a resiliência do solo e a ciclagem de nutrientes em longo prazo [@tivet2013; @wang2023; @silva2022]. Tais mudanças são particularmente evidentes no bioma Cerrado, onde a intensificação do uso da terra tem levado à degradação da funcionalidade edáfica [@strassburg2017; @sousa2021].

O Cerrado brasileiro, reconhecido como um dos principais hotspots de biodiversidade do planeta, abriga solos altamente intemperizados, naturalmente ácidos e pobres em fósforo e nitrogênio disponível [@sano2020]. Nessas condições, a sustentabilidade do sistema depende fortemente da manutenção das frações húmicas da MOS, que atuam como reservatórios de nutrientes e contribuem para a formação de agregados estáveis e a retenção de água [@paul2016; @lehmann2015]. As substâncias húmicas compostas por ácidos húmicos (AH), ácidos fúlvicos (AF) e humina (Hum) exercem papel essencial na estabilização de N e P, seja por adsorção, complexação ou imobilização biogênica, promovendo a persistência desses elementos no solo [@stevenson1994; @helfenstein2020].

Nos últimos anos, tem-se intensificado o interesse científico em compreender o acoplamento biogeoquímico entre N e P isto é, como suas formas lábeis e húmicas interagem e se co-estabilizam na MOS. Evidências crescentes indicam que esses nutrientes não atuam isoladamente, mas são co-regulados por processos de decomposição, humificação e proteção físico-química em complexos organo-minerais [@helfenstein2020; @chen2018]. Esse acoplamento manifesta-se através da incorporação simultânea de N e P na biomassa microbiana durante a decomposição de resíduos vegetais, com subsequente liberação sincronizada mediante lise celular. Simultaneamente, ocorre adsorção competitiva de formas inorgânicas (NH₄⁺, NO₃⁻, H₂PO₄⁻) e orgânicas (aminoácidos, nucleotídeos, fosfolipídios) em superfícies minerais e colóides orgânicos, onde a presença de um nutriente modula a disponibilidade do outro através de competição por sítios de ligação. Adicionalmente, a formação de complexos ternários envolvendo substâncias húmicas, cátions polivalentes (Ca²⁺, Fe³⁺, Al³⁺) e ânions nutricionais estabiliza simultaneamente N e P em formas de longa persistência, enquanto a co-oclusão física em microagregados estabilizados por humina protege N e P orgânicos contra mineralização rápida. Esse acoplamento implica que perturbações no ciclo de um nutriente, criando desbalanços estequiométricos que podem comprometer a eficiência de uso de nutrientes e a estabilidade da MOS. Apesar disso, a maioria dos estudos ainda analisa N e P de forma independente, negligenciando as relações estruturais entre seus compartimentos e as implicações para a sustentabilidade edáfica [@marinhojunior2021; @wang2023].

Modelos analíticos avançados, como a modelagem por equações estruturais baseada em mínimos quadrados parciais (PLS-SEM), oferecem novas oportunidades para desvendar as relações causais entre compartimentos edáficos [@hair2021]. Em paralelo, métodos de inteligência computacional, como os sistemas de inferência fuzzy, possibilitam sintetizar múltiplos indicadores químicos e físicos do solo em um único índice de desempenho funcional [@mamdani1977; @lima2023]. A combinação dessas abordagens fornece uma visão abrangente da funcionalidade edáfica, considerando simultaneamente a disponibilidade química de nutrientes e as restrições físicas impostas pelo uso e manejo da terra, permitindo traduzir os resultados em um Índice Fuzzy de Sustentabilidade Edáfica (FESI) [@mendonca2024].

A compreensão integrada da dinâmica funcional de N e P em diferentes usos da terra é, portanto, fundamental para orientar estratégias de manejo conservacionista e restauração ecológica em ambientes tropicais. A estabilidade da MOS, mais do que a simples quantidade de matéria orgânica acumulada, depende da proporção entre frações lábeis de rápida renovação e húmicas de longa persistência, as quais determinam o equilíbrio entre disponibilidade imediata e armazenamento de longo prazo de nutrientes [@cotrufo2019]. Assim, avaliar como as pressões antrópicas alteram essa relação é essencial para estimar a capacidade do solo de sustentar funções ecológicas críticas e resistir à degradação.

Com base nesse contexto, formula-se a hipótese de que as frações húmicas e lábeis de nitrogênio e fósforo exercem contribuições distintas, porém complementares, para os estoques totais desses nutrientes no solo, e que a degradação física, expressa pela densidade aparente, atua como fator limitante da funcionalidade edáfica. Espera-se que sistemas sob vegetação nativa apresentem maior co-estabilização de N e P em frações húmicas estáveis, enquanto usos agrícolas e silviculturais revelem predominância de formas lábeis e menor sinergia entre os ciclos biogeoquímicos desses elementos.

Diante dessas premissas, o presente estudo teve como objetivo avaliar a dinâmica funcional de nitrogênio e fósforo nas frações húmicas e lábeis do solo sob diferentes usos da terra no sul do Tocantins, integrando abordagens de modelagem preditiva, estrutural e de inferência fuzzy para diagnóstico da sustentabilidade edáfica. Para isso, buscou-se identificar as frações de N e P mais relevantes para predição dos estoques totais por meio de regressão por mínimos quadrados parciais (PLSR), quantificar as contribuições relativas das formas lábeis e húmicas aos estoques totais mediante modelagem por equações estruturais (PLS-SEM) e análise multigrupo entre usos da terra e integrar atributos químicos e físicos do solo em um Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) para sintetizar a funcionalidade biogeoquímica dos sistemas avaliados.

# Metodologia

## Área de estudo

A pesquisa foi desenvolvida, no município de São Valério da Natividade em Tocantins, com área total de 53,23 ha, nas coordenadas geográficas 11º54'37" S e 48º12'31" O (Figura 1).


![Figura 1. Localização das áreas experimentais](../../2-FIGURAS/mapa_area.png){#fig:1 width=70%}

O clima do município, é do tipo úmido subsumido com moderada deficiência hídrica (C2wA'a"), com duas estações bem definidas, inverno seco que vai de maio a outubro e verão chuvoso, de novembro a abril [@thornthwaite1948]. De acordo com a classificação climática de Köppen, o município de São Valério da Natividade possui pluviosidade média anual de 1643.3 mm, temperatura média 26°C. Está localizado a uma altitude de 320.48 m, e possui 90% da região com declividade inferior a 8º, indicando solos planos [@cho2021]. Os solos das áreas experimentais foram classificados como Latossolo Vermelho-Amarelo, possui uma estrutura granular a subagregada, com boa a excelente drenagem, porém é naturalmente pobre em nutrientes, especialmente nitrogênio, fósforo e potássio [@ker1997; @lopes1996].

## Características das áreas de estudo

A área preservada com Cerrado (Sensu Stricto) (Figura 2a) considerada como testemunha possui 44,82 ha, com mais 40 anos, localizada nas coordenadas 11°54'57''S e 48°11'59''W (Figura 2). A vegetação possui características do tipo denso, com árvore que variam entre 5 a 8 metros de altura, uma vez que, a vegetação do cerrado sensu stricto não possui uma fisionomia única, pelo contrário, é bastante diversificada, apresentando desde formas campestres bem abertas, até formas relativamente densas (florestais) [@sano2019; @klink2005].

Figura 2. Áreas estudadas. Fotomontagem das áreas: (a) Cerrado Stricto Sensu (vegetação nativa preservada); (b) Eucalipto (*Eucalyptus* sp.); (c) Mogno Africano (*Khaya ivorensis*); (d) Teca (*Tectona grandis*); (e) Agricultura (soja/milho em rotação).

| (a) | (b) | (c) |
|:--------------:|:--------------:|:--------------:|
| ![](../../2-FIGURAS/cerrado.jpg){ width=100% } | ![](../../2-FIGURAS/eucalipto.jpg){ width=100% } | ![](../../2-FIGURAS/mogno.jpg){ width=100% } |
| (d) | (e) |  |
| ![](../../2-FIGURAS/teca.jpg){ width=100% } | ![](../../2-FIGURAS/agricultura.jpg){ width=100% } |  |

Um inventario foi realizado e calculado os parâmetros fitossociológicos: Densidade Relativa - DR, Dominância Relativa - DMR, Frequência Relativa – FR e Índice de Valor de Importância - IVI [@queiroz2017] (Apêndice A).

O plantio de eucalipto (*Eucalyptus* sp.) possui área total de 2,29 ha com cinco anos de idade, localizado nas coordenadas de 11°54’32’’S, 48°12’22’’W (Figura 2b). Em relação a densidade do plantio, foi de aproximadamente 1667 mudas/ha em um espaçamento de 3 x 2 m, em covas que possuem dimensões de 0,40 x 0,40 x 0,40 m, abertas manualmente com auxílio de cavadeiras, seguido de aplicação de adubo NPK, na formulação 5-25-15, com intuito de estimular o desenvolvimento vegetal, para melhor acondicionamento das mudas ao solo [@verai2022].

No início do plantio foi realizado adubação de base com 20 kg de Ca2+, 0,8 kg de Zn2+, 12 kg de S (SO42-), 1,6 kg de Cu2+ e 1,6 kg de B (H3BO3). A limpeza da área, para remoção de vegetação nativa, foi realizada com o auxílio de lâmina frontal acoplada ao trator de esteira, sucedido por aragem e gradagem, permitindo maior interação de oxigênio ao solo, o que viabiliza melhorias nos processos químicos e biológicos [@almeida2024]. No que tange ao processo de alinhamento e esquadrejamento das mudas, optou-se pela utilização do método do Triangulo Reto (3/4/5) com auxílio de baliza e trena [@verai2022].

Já o plantio de Mogno Africano (**Khaya ivorensis**) possui uma área total de 1,94 ha, com sete anos de idade, localizado nas coordenadas 11°54'29''S, 48°12'10''W (Figura 2c). O plantio foi realizado em covas com dimensões de 0,40 x 0,40 x 0,40 m, e espaçamentos de 3 x 3 m com densidade de 1111 mudas/ha, e durante o plantio foi adicionado em cada cova 0,2 kg de adubo NPK com formulação 00-10-10, e 5 kg de esterco bovino curtido, sendo aplicados durante o primeiro ano de vida a cada três meses, além disto foi realizado o desbaste, quando as copas começaram a se encontrem, deixando o espaçamento final de 6 x 6 metros [@silva2023]. Assim como na área de Eucalipto a limpeza da área, foi realizada com o auxílio de lâmina frontal acoplada ao trator de esteira, sucedido por serviços de aragem e gradagem [@camposmontanari2024].

O Plantio de Teca (**Tectona grandis**) possui uma área total de 1,12 ha, com dez anos de idade, localizado nas coordenadas 11°54’22’’S e 48°12’17’’W (Figura 2d). A limpeza da área antes do plantio, foi realizada com o auxílio de lâmina frontal acoplada ao trator de esteira, sucedido por serviços de aragem e gradagem [@camposmontanari2024]. Durante o primeiro ano, foram realizadas duas adubações de cobertura, onde a primeira foi executada aos 60 dias e a outra no oitavo mês, com aplicação de 95 g cova-1 de NPK com formulação de 20-05-20.

O plantio foi realizado manualmente em espaçamento de 3 x 2 m, nas dimensões de 0,40 x 0,40 m, com 1.667 mudas/hectare, a qual, foram instaladas individualmente com seu colo ao nível do solo. Foi realizado também o replantio das mudas que falharam, além da limpeza no primeiro ano, uma vez que, a teca é particularmente sensível à competição de gramíneas, sendo assim, necessário manter o terreno bem carpido; no segundo ano, o sombreamento proporcionado pela teca evitou boa parte do desenvolvimento de ervas daninhas, reduzindo a necessidade de capinas e roçadas e no terceiro ano, não foram mais necessários tratos culturais [@moreira2021].

Além disso, foram realizadas atividades de podas e desbrotas com auxílio de serrotes, com observações constantes quanto à dimensão dos galhos. 
Por fim a área de agricultura possui 3,06 ha, possui mais de 10 anos, localizada nas coordenadas de 11°54’44’’S e 48°12’02’’W (Figura 2e). A área destinada a agricultura possui mais de 10 anos, sendo rotacionado entre o cultivo de milho e soja. No momento da coleta, a área estava sendo utilizada para plantio de soja que se estende entre os meses de junho e setembro. Foram empregadas atividades de gradagem e nivelamento do solo, com posterior aplicação de 300 kg ha-1 de NPK na formulação 4-28-10, com espaçamento entre os indivíduos de 0,5 m, tratados durante todo o plantio com fungicidas tiofanto-metílico e azoxistrobina, e inseticidas, na dosagem de 100 g para cada 50 kg de sementes, além da remoção de ervas daninhas [@machado2024].

Já o cultivo do milho, estende-se entre os meses janeiro a março, em virtude das condições favoráveis promovidas pela precipitação. O preparo do solo ocorreu através de gradagem e sulcamento, com espaçamento médio, entre os indivíduos, de 0,2 x 0,8 m e adubação de 400 kg de 4-14-18 por ha-1, no interior do sulco de semeadura, e 50, 100 e 150 kg de N por ha-1, sobre a superfície do solo, aliado aos procedimentos relacionados ao combate de daninhas, por meio de capina manual e emprego de herbicidas, quando necessário [@eckardt2021].

## Amostragem de solo

As cinco trincheiras em cada área estudada com dimensões com ajuda de um gabarito 70 × 70 × 100 cm (Figura 3) em pontos distintos [@marinhojunior2021], foram abertas manualmente, totalizando no total vinte e cinco trincheiras. 


![Figura 3. Coleta de solo em área de vegetação nativa (Cerrado sensu stricto)](../../2-FIGURAS/trincheira.png)

A coleta das amostras de solo, deformadas e indeformadas, para as analises físicas e químicas foram realizadas nas profundidades de 0-10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-80, 80-100 cm. Depois, as amostras de solos deformadas foram secas ao ar e passada em peneira de 2 mm para posterior analises.

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

### Determinação do Nitrogênio total no solo

As amostras de solo deformadas, depois de passadas em peneiras de 2 mm, foram maceradas em almofariz de porcelana e pistilo até formar um pó fino, e passadas em peneira de malha de 150 μm. Os teores de Nitrogênio total - NT total no solo foram determinados através deste material, pelo método de combustão a seco, utilizando analisador elementar (Modelo PE-2400 Série II Perkin Elmer).

### Fracionamento das substâncias húmicas e teores de Nitrogênio em cada fração

Para extração das substâncias húmicas, as amostras de solo foram submetidas ao fracionamento segundo o método da International Humic Substances Society - IHSS (Swift, 1996), obtendo-se as frações correspondentes aos ácidos fúlvicos - AF, ácidos húmicos - AH e humina - HUM, com base na solubilidade diferencial em soluções alcalinas e ácidas. Para a extração foi realizada com uma mistura de 200 g de solo com solução de HCl 0,1 mol L-1 na proporção de 1 g de solo para cada 10 mL de solução, sendo agitada manualmente por 1 hora, ficando depois em repouso por 4 horas. O extrato sobrenadante foi sifonado e reservado, correspondendo ao extrato I de AF. Assim, a solução de NaOH 0,1 mol L-1 foi adicionada e precipitada na mesma proporção citada anteriormente (1:10) e também realizada agitação manual. Após este período, a solução foi deixada em repouso por 16 horas, seguindo na sequência para a nova retirada da mistura, na qual o material precipitado foi separado, correspondendo à fração Hum e fração mineral.
O material sobrenadante, referente às frações AF e AH, foi centrifugado por 10 minutos a 10.000 rpm, sendo depois acidificado pela adição de 50 mL de HCl 6 mol L-1 até atingir o valor de pH entre 1 e 2 e agitado manualmente por dois minutos. Após este procedimento, a solução foi deixada em repouso por 12 horas. Por fim, após separação por desvio do sobrenadante, referente ao extrato II de AF, obteve-se o material precipitado que está relacionada à fração de AH. Posteriormente ao fracionamento das substâncias húmicas, as amostras foram congeladas e liofilizadas para determinação dos teores de nitrogênio em cada fração húmica (AF, AH e Hum), a partir do método de combustão a seco, utilizando um analisador elementar (Modelo PE-2400 Série II Perkin Elmer).

2.3.5 Determinação dos estoques de Nitrogênio
Após a obter os teores de N pelos métodos citados anteriormente, foi realizada a determinação do estoque N no solo e nas frações húmicas em Mg ha⁻¹, em cada profundidade amostrada, conforme a equação (Equação 2) a seguir:

$$\text{Est(N)} = \text{TN} \times \text{Ds} \times e$$

Em que: 
- Est(N) = Estoque de N na camada do solo, em Mg ha⁻¹; 
- TN = Teor de N na fração amostrada de solo, em g kg⁻¹; 
- Ds = Densidade do solo, em g cm⁻³; 
- e = espessura da camada, em cm.
Após o cálculo do estoque de N em cada camada, foi realizada a correção do estoque de N, levando em consideração as diferenças na massa do solo [@sisti2004]. Sendo assim, o estoque total de N no solo e nas substâncias húmicas na profundidade de 0 a 50 cm, sendo a última considerada a camada de impedimento foi resultante da soma dos valores obtidos em cada camada amostrada.

Est(N)= TN*Ds*e

Em que:
Est(N) = Estoque de N na camada do solo, em Mg ha-1;
TN = Teor de N na fração amostrada de solo, em g kg-1;
Ds = Densidade do solo, em g cm-3;
e = espessura da camada, em cm.

Após o cálculo do estoque de N em cada camada, foi realizada a correção do estoque de N, levando em consideração as diferenças na massa do solo [@sisti2004]. Sendo assim, o estoque total de N no solo e nas substâncias húmicas na profundidade de 0 a 50 cm, sendo a última considerada a camada de impedimento foi resultante da soma dos valores obtidos em cada camada amostrada.

## Análises estatísticas

Os parâmetros avaliados passaram pelos testes de normalidade de Shapiro Wilk, em seguida, foram submetidos a uma análise de variância para avaliar as diferenças entre os usos da terra e profundidades. A comparação das médias foi realizada pelo teste de Tukey a 5% de significância e utilizado o software estatístico SISVAR (Ferreira, 2011).

### Regressão por Mínimos Quadrados Parciais (PLSR)

Para identificar as variáveis preditoras mais relevantes e compreender a relação entre as frações de nitrogênio e fósforo com os estoques totais desses nutrientes, foi empregada a técnica de Regressão por Mínimos Quadrados Parciais (Partial Least Squares Regression - PLSR). Esta abordagem multivariada é particularmente adequada para conjuntos de dados com multicolinearidade entre variáveis explicativas, permitindo a redução da dimensionalidade e a construção de componentes latentes (variáveis latentes, LV) que maximizam a covariância entre os preditores (X) e a variável resposta (Y).

Dois modelos PLSR independentes foram ajustados: um primeiro modelo para predição do nitrogênio total (NT), utilizando como preditoras as variáveis NLabil, NMOL, NTAF, NTAH, NTHum, EstNT, EstNLabil, EstNMOL, EstNAF, EstNAH e EstNTHum; e um segundo modelo para predição do fósforo total (PT), com as preditoras PLabil, PMOL, PTAF, PTAH, PTHum, EstPT, EstPLabil, EstPMOL, EstPAF, EstPAH e EstPTHum. Ambos os modelos foram estimados com duas componentes latentes (LV1 e LV2), utilizando validação cruzada leave-one-out (LOO) para avaliação da capacidade preditiva.

A análise foi conduzida no ambiente R [@Team2019], utilizando o pacote `pls` [@Mevik2007]. A variância explicada acumulada foi calculada tanto para a matriz de preditores (R²X) quanto para a variável resposta (R²Y). Os loadings das variáveis foram normalizados e representados em biplots de correlação, permitindo visualizar a estrutura de covariância entre as frações de N e P e os estoques totais.

Adicionalmente, foram calculados os escores de importância das variáveis na projeção (Variable Importance in Projection - VIP), conforme o critério de Wold, para identificar quais frações contribuem mais significativamente para a predição dos estoques totais. Variáveis com VIP > 1.0 foram consideradas altamente relevantes, enquanto VIP < 0.8 indicaram contribuição marginal ao modelo.

## Modelagem Proposta

O funcionamento biogeoquímico do solo, com ênfase na dinâmica funcional dos elementos nitrogênio (N) e fósforo (P) e na integração de suas formas lábeis e húmicas aos estoques totais, foi avaliado por meio de uma abordagem metodológica dupla. Inicialmente, a Modelagem por Equações Estruturais com Mínimos Quadrados Parciais (PLS-SEM) foi empregada para explicitar as relações causais entre os construtos latentes (frações lábeis e húmicas de N e P) e os estoques totais de nutrientes, fornecendo uma visão estrutural da dinâmica edáfica.

Em paralelo, foi desenvolvido o Índice Fuzzy de Sustentação Nutricional (FSNSI), baseado em um sistema de inferência fuzzy do tipo Mamdani, com o objetivo de sintetizar o desempenho funcional do solo em um índice único. As variáveis de entrada decisórias para o FSNSI foram os estoques totais de N e P, e a Densidade do Solo (Ds), esta última incorporada como variável penalizadora do índice. A Ds foi tratada com normalização invertida na escala fuzzy [0-10], assumindo que valores mais elevados refletem condições físicas menos favoráveis e, portanto, amplificam o impacto negativo dessa limitação no valor final do FSNSI. O sistema fuzzy foi estruturado com a normalização conservadora das variáveis de entrada, a definição de funções de pertinência triangulares e regras linguísticas baseadas em conhecimento especializado, e a defuzzificação dos valores por meio do método do centróide.

Adicionalmente, as frações granulométricas do solo (areia, silte e argila) foram introduzidas no processo analítico como covariáveis de controle. Embora não tenham sido entradas diretas no sistema fuzzy, sua análise paralela permitiu mitigar o viés potencial decorrente de diferenças texturais naturais entre os ambientes avaliados, assegurando que as respostas funcionais observadas fossem predominantemente atribuídas ao uso e manejo do solo, e não à sua classe textural de origem


#### Normalização das variáveis

Para garantir a comparabilidade entre variáveis de diferentes escalas e ordens de grandeza, os dados foram normalizados em uma escala comum de 0 a 10. Para padronizar as variáveis em uma escala comum entre 0 e 10, adotaram-se dois modelos de normalização linear conservadora (Equação 1).

**Equação 1 (Normalização direta):**
$$x_{\text{norm}} = 10 \times \frac{x - x_{\min}}{x_{\max} - x_{\min}}, \quad \text{com } x \in [x_{\min}, x_{\max}]$$

Em que:
- $x$: valor original da variável
- $x_{\min}$: menor valor observado da variável $x$
- $x_{\max}$: maior valor observado da variável $x$
- $x_{\text{norm}}$: valor normalizado na escala de 0 a 10

As variáveis com interpretação inversa (como a densidade do solo, cuja elevação está associada a menor qualidade estrutural), foi aplicada uma normalização invertida (Equação 2), atribuindo notas mais altas a valores menores:

**Equação 2 (Normalização invertida):**
$$x_{\text{norm}} = 10 \times \frac{x_{\max} - x}{x_{\max} - x_{\min}}, \quad \text{com } x \in [x_{\min}, x_{\max}]$$

Onde:
- Quando $x = x_{\min}$, então $x_{\text{norm}} = 10$ → melhor valor
- Quando $x = x_{\max}$, então $x_{\text{norm}} = 0$ → pior valor

Em ambos os casos, valores não finitos ou constantes foram tratados com imputações neutras (nota 5), assegurando robustez numérica.

#### Estrutura do sistema fuzzy e regras de inferência

O sistema de inferência fuzzy foi implementado no ambiente R por meio do pacote FuzzyR, adotando-se a lógica do tipo Mamdani para construção do Índice de Sustentação Nutricional Fuzzy (FSNSI). Foram utilizados três variáveis de entrada: nitrogênio total normalizado (N_total), fósforo total normalizado (P total) e densidade do solo normalizada e invertida (Ds). A variável de saída FSNSI, foi modelada com três termos linguísticos qualitativos: baixa, média e alta, todos definidos no intervalo contínuo de 0 a 10.
As funções de pertinência seguem a forma geral de triângulos simétricos ou assimétricos, conforme Equação 3 para termo Baixo, Equação 4 termo Médio e Equação 5 para o termo Alto.

**Equação 3 (Termo Baixo):**
$$\mu_{\text{baixa}}(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right), \quad \text{com } (a,b,c) = (0,0,4)$$

**Equação 4 (Termo Médio):**
$$\mu_{\text{média}}(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right), \quad \text{com } (a,b,c) = (3,5,7)$$

**Equação 5 (Termo Alto):**
$$\mu_{\text{alta}}(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right), \quad \text{com } (a,b,c) = (6,10,10)$$

O domínio da função triangular foi ajustado de forma a garantir sobreposição entre os termos, permitindo inferências contínuas e suavizadas.

#### Base de regras fuzzy

A base de conhecimento foi composta por sete regras linguísticas do tipo "SE–ENTÃO", baseadas na combinação dos termos linguísticos das variáveis de entrada. A estrutura das regras segue a forma genérica (Equação 6):

$$R_{(i)}: \text{SE } x_1 \in A_1 \land x_2 \in A_2 \land x_3 \in A_3 \Rightarrow y \in B_i$$

A ativação de cada regra $R_{(i)}$ foi calculada conforme a Equação 7:

$$\alpha_i = \min(\mu_{A1}(x_1), \mu_{A2}(x_2), \dots, \mu_{An}(x_n))$$

O valor de saída correspondente $\mu_{B_i}(z)$ foi ponderado por $\alpha_i$ e os conjuntos ativados foram agregados via operador do tipo MAX.
Para incorporar o papel da densidade do solo como penalidade funcional, os pesos wi atribuídos a cada regra foram ajustados dinamicamente em função da classificação linguística de Ds. Regras com densidade alta (categoria linguística "baixa" na escala invertida) receberam pesos reduzidos (entre 0.4 e 0.6), enquanto regras com densidade baixa (categoria "alta") foram atribuídas com pesos maiores (até 1.5). Esse ajuste visa reforçar a influência da qualidade física do solo na determinação da funcionalidade.

#### Defuzzificação do índice funcional

O valor final do índice FSNSI foi obtido por meio do processo de defuzzificação por centróide, conforme Equação 8:

$$\text{FSNSI} = \frac{\int_0^{10} \mu_{\text{FSNSI}}(z) \cdot z \, dz}{\int_0^{10} \mu_{\text{FSNSI}}(z) \, dz}$$

Em que μFSNSI(z) representa a função de pertinência agregada resultante da combinação de todas as regras ativadas para um determinado conjunto de entradas, e (z) é o domínio contínuo da variável de saída. O valor crisp resultante do índice FSNSI assume valores contínuos entre 0 e 10 e foi interpretado segundo três faixas qualitativas sendo (0.0 a 3.3) funcionalidade baixa; (3.4 a 6.6) funcionalidade intermediária e (6.7 a 10.0) funcionalidade alta.


# Resultados e Discussão

## Importância das frações de N e P para predição dos estoques totais (PLSR)

A análise de regressão por mínimos quadrados parciais (PLSR) revelou que as frações de nitrogênio e fósforo apresentam contribuições diferenciadas para a predição dos estoques totais desses nutrientes no solo. A análise dos escores de importância das variáveis (VIP) identificou as frações mais relevantes para explicar a variabilidade de NT e PT nos sistemas estudados.

### Predição do Nitrogênio Total

A análise PLSR para o nitrogênio total (NT) foi realizada utilizando as frações de N como variáveis preditoras, permitindo identificar as contribuições relativas de cada compartimento funcional. Os resultados são apresentados na Figura 4, que mostra o biplot com os scores das amostras por uso da terra e os loadings das variáveis preditoras, evidenciando a estrutura de covariância entre as frações e os estoques totais.

Esses resultados são congruentes com a interpretação funcional em que as frações húmicas, por possuírem maior massa molar, maior associação organo-mineral e resistência à mineralização, atuam como reservatórios de longo prazo que determinam os estoques totais de N; já as frações lábeis refletem pools de rápida renovação e resposta a entradas recentes de matéria orgânica e manejo. No biplot (Figura 4) observa-se segregação espacial das amostras por uso da terra, com agrupamentos associados a maiores loadings húmicos (por exemplo, Eucalipto e Cerrado) e outros mais voltados ao eixo de frações lábeis (Agricultura e Pastagem), o que corrobora a hipótese de que a qualidade da serapilheira e o manejo estrutural modulam a composição funcional do pool de N.

Do ponto de vista gerencial e ecológico, a predominância das frações húmicas na predição do NT indica que práticas voltadas ao aumento da estabilidade da MOS (redução do revolvimento, incremento de inputs lignificados, manutenção de cobertura morta) tendem a promover retenção de N em formas de maior persistência, fortalecendo a capacidade de armazenamento e a resiliência do sistema. Em contrapartida, sistemas com maior proporção de frações lábeis apresentam maior disponibilidade imediata de N, porém menor capacidade de retenção a longo prazo, implicando necessidade de intervenções de manejo contínuo para manutenção da fertilidade.


### Predição do Fósforo Total

De forma similar ao observado para o nitrogênio, os teores de P total (PT) e suas frações húmicas (PTHum, PTAH, PLabil) apresentaram elevada correlação estrutural no modelo PLSR (Figura 5). Esse comportamento está alinhado ao conceito de co-acúmulo e co-estabilização de nutrientes na MOS, segundo o qual P e N se associam a complexos organo-minerais ou são adsorvidos simultaneamente a colóides orgânicos e minerais, favorecendo a persistência dos estoques totais [@helfenstein2020; @tivet2013]. A aplicação de técnicas multivariadas como PLSR em estudos de ciência do solo tem se mostrado particularmente adequada para lidar com conjuntos de dados caracterizados por multicolinearidade entre variáveis, conforme demonstrado por @sekaran2020 em análises de atividades bioquímicas e estrutura de comunidades microbianas do solo.

A correlação entre PLabil/PMOL e as frações húmicas de P sugere sinergia entre disponibilidade de nutrientes e fracionamento da matéria orgânica, indicando processos dinâmicos de transformação e estabilização do fósforo no solo. Os mecanismos de co-estabilização envolvem (i) adsorção específica de ortofosfato (H2PO4?) em superfícies de ácidos húmicos via pontes de hidrogênio e complexação com grupos funcionais carboxílicos e fenólicos, (ii) formação de complexos ternários envolvendo P orgânico, cátions polivalentes (Ca²?, Fe³?, Al³?) e substâncias húmicas, que reduzem a solubilidade e a mobilidade do fósforo no perfil, e (iii) oclusão física de P lábil em microagregados estabilizados por humina e material recalcitrante, protegendo-o contra mineralização rápida. Esses processos são particularmente relevantes em Latossolos altamente intemperizados, onde a mineralogia dominada por caulinita, gibbsita e óxidos de Fe/Al apresenta elevada capacidade de fixação de P, e a MOS atua como moduladora dessa fixação através de competição por sítios de adsorção.


![Figura 5. Biplot PLSR para PT, mostrando scores das amostras por uso da terra e loadings das variáveis preditoras de fósforo. ](../../2-FIGURAS/biplot_plsr_pt.png){#fig:5 width=90%}
Nota: Padrão visual similar ao do NT, refletindo a associação estrutural entre N e P no solo.

Os escores VIP para as frações de P revelaram padrão similar ao do nitrogênio, com PTHum e PTAH como preditores dominantes (Tabela 5). Esse paralelismo estrutural entre N e P reforça que os processos de humificação progressiva—onde compostos lábeis são gradativamente convertidos em frações húmicas intermediárias (ácidos fúlvicos ? ácidos húmicos) e finalmente em humina recalcitrante—operam de forma sincronizada para ambos os nutrientes. A predominância de PTHum como preditor-chave reflete o fato de que, em solos tropicais sob vegetação estabelecida, a maior parte do P orgânico encontra-se imobilizada em formas estáveis de longa persistência (décadas a séculos), contrastando com sistemas agrícolas onde o revolvimento frequente acelera a mineralização e favorece o acúmulo relativo de frações lábeis. A correlação significativa entre VIP(PTHum) e VIP(NTHum) (r > 0.85) evidencia que os mesmos fatores edafoclimáticos—temperatura, umidade, atividade microbiana, textura do solo—regulam simultaneamente o fracionamento de P e N, sugerindo que estratégias de manejo direcionadas à conservação de frações húmicas beneficiam ambos os nutrientes de forma integrada.


| Variável | VIP | Relevância |
|----------|-----|------------|
| PTHum | > 1.0 | Muito importante |
| PTAH | > 1.0 | Muito importante |
| PLabil | 0.8-1.0 | Importante |
| PMOL | 0.8-1.0 | Importante |
| PTAF | < 0.8 | Moderada |

: Tabela 5 - Escores VIP das variáveis preditoras de PT (Variável Importance in Projection). VIP > 1.0 indica variáveis críticas para a predição do PT.

Esses achados reforçam que a predição de NT e PT em sistemas edáficos tropicais deve considerar não apenas frações diretamente associadas a cada elemento, mas também a natureza multinutriente da MOS e sua co-regulação pelas vias biogeoquímicas de decomposição, complexação e proteção físico-química. A elevada capacidade preditiva do modelo PLSR (variância explicada > 80% com duas componentes latentes) demonstra que o fracionamento químico capta efetivamente os processos funcionais que governam a disponibilidade de nutrientes, fornecendo base sólida para desenvolvimento de indicadores de qualidade do solo e monitoramento de trajetórias de degradação ou recuperação em diferentes sistemas de uso da terra.

## Relações estruturais entre frações lábeis, húmicas e estoques totais (PLS-SEM) {-}

### Resultados do modelo estrutural global


O modelo estrutural foi configurado como um modelo de componentes hierárquicos (hierarchical component model, HCM) em dois níveis, combinando construtos de primeira ordem que representam as frações funcionais de nitrogênio e fósforo e construtos de segunda ordem que sintetizam os estoques totais. Essa abordagem segue as recomendações de @hair2021 para modelagem de estruturas reflexivas com indicadores repetidos, assegurando que a variância compartilhada entre as dimensões funcionais seja propagada para os construtos superiores. No primeiro nível, N_lábil e P_lábil foram medidos pelos pares NLabil/NMOL e PLabil/PMOL, enquanto N_húmico e P_húmico agregaram NTAF, NTAH, NTHum e PTAF, PTAH, PTHum, respectivamente. A etapa de mensuração revelou cargas fatoriais elevadas (? = 0.981 a 0.990) para todos os indicadores, confirmando que as variáveis manifestas capturam de forma robusta a variabilidade intrínseca de cada fração funcional (Figura 6).

![Figura 6. Análise de caminhos do modelo PLS-SEM evidenciando as relações estruturais entre variáveis latentes (frações de nitrogênio e fósforo) e indicadores observáveis.](../../2-FIGURAS/analise_caminhos_pls.png){#fig:6 width=95%}
Nota: As setas indicam as trajetórias de influência causal, com largura proporcional à magnitude dos coeficientes de caminho. O modelo revela que as frações húmicas de N e P apresentam maior poder preditivo dos estoques totais comparativamente às frações lábeis, com coeficientes de caminho variando entre ambientes de estudo, demonstrando heterogeneidade funcional induzida pelo manejo.


A consistência interna elevada (a > 0.97) e a variância média extraída acima de 0.95 (Tabela 4) indicam confiabilidade convergente excelente para todos os construtos, superando com folga os limiares recomendados para estudos com estruturas reflexivas [@hair2021]. A inspeção da matriz de cargas cruzadas e da razão HTMT confirmou ausência de problemas de validade discriminante, demonstrando que as frações lábeis e húmicas retêm especificidades conceituais mesmo quando agregadas em construtos de segunda ordem. Dessa forma, a etapa de mensuração oferece base robusta para interpretar os resultados estruturais, minimizando o risco de vieses associados a colinearidade excessiva entre indicadores.

Na etapa estrutural, o modelo global apresentou coeficiente de determinação de 0.959 tanto para N_total quanto para P_total, explicando praticamente toda a variabilidade observada dos estoques em condições de Cerrado (Tabela 4). Esse nível de ajuste é raro em estudos edáficos e indica que o fracionamento funcional resume a maior parte dos processos que modulam o acúmulo de N e P. Os coeficientes de caminho oriundos das frações húmicas (ß = 1.286 para N_húmico → N_total e P_húmico → P_total) foram positivos, elevados e estatisticamente diferentes de zero nas reamostragens bootstrap, evidenciando que acréscimos marginais nesses compartimentos resultam em aumentos proporcionais superiores nos estoques totais. Esse comportamento é coerente com evidências de campo que apontam as frações húmicas como reservatórios dominantes de nutrientes em Latossolos sob silvicultura e pastagens de longa duração [@pegoraro2011; @ferreira2021].


| Métrica | Valor Observado | Interpretação |
|---------|-----------------|----------------|
| R² (N_total) | 0.959 (Cerrado) | Explicação de 95.9% da variância |
| R² (P_total) | 0.959 (Cerrado) | Explicação de 95.9% da variância |
| SRMR | < 0.06 | Modelo bem ajustado aos dados |
| Confiabilidade (a) | > 0.97 | Consistência interna > 0.97 |
| Comunalidade (AVE) | > 0.95 | Variância média bem explicada |

: Tabela 4 - Métricas de qualidade do modelo PLS-SEM global. 
Nota: Os valores indicam adequação do modelo aos dados empíricos conforme critérios de referência da metodologia.


Os coeficientes negativos associados às frações lábeis (ß = -0.313 para N_lábil ? N_total e P_lábil ? P_total) refletem o mecanismo de particionamento entre pools de rápida renovação e reservas estáveis. À medida que o sistema acumula compostos recalcitrantes, parte das formas lábeis é incorporada à matriz húmica, produzindo efeito inverso nos modelos estruturais. Esse resultado tem respaldo em cronossequências que documentam a transferência progressiva de N e P lábeis para frações humificadas durante a maturação de sistemas florestais e agrícolas [@marinhojunior2021; @araujofilho2024]. Não se trata, portanto, de antagonismo biogeoquímico, mas de evidência de que o modelo capturou a dinâmica de humificação incremental do sistema.

A simetria dos coeficientes entre N e P reforça a hipótese de acoplamento biogeoquímico dos dois macronutrientes, governado por processos comuns de humificação, complexação organo-mineral e proteção estrutural da matéria orgânica. Esse padrão corrobora observações em agroflorestas de café sombreado no Nordeste, onde o incremento do carbono orgânico total está associado simultaneamente a aumentos nas frações húmicas de N e P e à melhoria da estrutura física do solo [@crespo2024]. Os resultados do PLS-SEM confirmam que a estabilização conjunta de N e P é um atributo-chave de sistemas manejados com alta entrada de resíduos lignificados, elemento central para compreender a funcionalidade edáfica nos usos da terra avaliados.


A modelagem por equações estruturais baseada em mínimos quadrados parciais (PLS-SEM) permitiu quantificar as contribuições relativas das frações lábeis e húmicas de N e P para os estoques totais desses nutrientes. O resultado mais significativo foi o alcance de R² = 0.959 para ambos N_total e P_total no ambiente Cerrado, indicando que o modelo explica 95.9% da variância observada. Esse coeficiente de determinação representa performance excepcional em modelagem de sistemas edáficos complexos, especialmente considerando a heterogeneidade inerente aos ecossistemas de solo tropical, caracterizados por variabilidade espacial elevada e múltiplos mecanismos de transformação de nutrientes. A replicação desse desempenho entre N e P (R² = 0.959 para ambos) evidencia que os mesmos compartimentos funcionais (frações húmicas e lábeis) operem como determinantes estruturais para ambos os macronutrientes, sugerindo acoplamento geoquímico estreito entre as dinâmicas de N e P nessa matriz de solo.

O diagrama do modelo (Figura 6) representa graficamente essa arquitetura, onde retângulos indicam variáveis manifestas (indicadores observáveis), hexágonos representam construtos latentes (variáveis não observadas diretamente) e setas mostram as relações causais hipotéticas. As cargas fatoriais elevadas (? = 0.981-0.990 para todos os indicadores) confirmam a qualidade excepcional da medição das variáveis latentes, validando a escolha dos indicadores para representação das frações de nutrientes.

A relação positiva dominante das frações húmicas (ß = 1.286) corrobora a hipótese de que essas frações constituem o principal reservatório de longo prazo desses nutrientes, representando aproximadamente 56% a mais da contribuição unitária para os estoques totais comparativamente aos terços finais do modelo. A magnitude de ß = 1.286 indica que incrementos de uma unidade na fração húmica geram aumento de 1.286 unidades no estoque total, estabelecendo essas frações como preditoras dominantes da disponibilidade de nutrientes no sistema. Essa dominância das frações húmicas é consistente com observações de @pegoraro2011, que demonstraram que substâncias húmicas (ácidos fúlvicos, húmicos e huminas) representam os principais compartimentos de C e N em solos sob diferentes usos da terra, e com @ferreira2021, que evidenciaram que a matéria orgânica associada aos minerais (MAOM) constitui o reservatório mais estável de nutrientes em solos tropicais brasileiros.

Estudos em sistemas agroflorestais sombreados confirmam esse padrão, demonstrando que a presença de árvores nativas modula significativamente os processos biogeoquímicos do solo. @crespo2024 evidenciaram em sistemas de café sombreado que o carbono orgânico total (COT) atua como integrador central entre porosidade, acidez e disponibilidade de nutrientes, sendo que áreas com maior cobertura arbórea apresentaram COT superior a 2.5% e microporosidade de ~30%, refletindo o acúmulo coluvial e a proteção contra a mineralização acelerada. A análise de componentes principais nesses sistemas explicou 60.2% da variação total, com PC1 (estrutura física e fertilidade, 38.5%) e PC2 (qualidade da matéria orgânica, 21.7%), corroborando a importância das frações húmicas como determinantes estruturais da funcionalidade edáfica. Esses resultados reforçam que a integração entre diversidade arbórea e processos pedogenéticos favorece a estabilização de nutrientes nas frações húmicas, processo particularmente relevante em Latossolos altamente intemperizados onde a baixa capacidade de troca catiônica amplia a dependência da matéria orgânica para retenção de N e P.

A relação negativa das frações lábeis (ß = -0.313), embora aparentemente contraditória à primeira vista, reflete um mecanismo biogeoquímico fundamental em solos tropicais: a colinearidade estrutural representada no modelo constitui transformação matemática da interação dinâmica entre pools. Especificamente, quando a fração húmica aumenta, a fração lábil diminui relativamente, pois o modelo captura o fenômeno de humificação progressiva onde compartimentos lábeis são continuamente convertidos em frações húmicas recalcitrantes [@marinhojunior2021]. Essa dinâmica não indica relação causal negativa entre os compartimentos, mas sim descreve a natureza do particionamento de nutrientes: em solos com elevada decomposição microbiana (como o Cerrado), a conversão N_lábil ? N_húmico ? N_recalcitrante ocorre sequencialmente, resultando em compensação de sinais nos coeficientes de regressão múltipla. O padrão ß(húmico) = +1.286 e ß(lábil) = -0.313 mantém proporcionalidade esperada, onde N_total = 1.286×N_húmico - 0.313×N_lábil apresenta ajuste estatístico que evita multicolinearidade excessiva.

Essa interpretação encontra suporte direto na observação dos dados: se as frações húmicas fossem verdadeiramente prejudiciais (como indicaria um ß negativo), sistemas com elevada humificação não apresentariam acúmulo consistente de nutrientes. Inversamente, o padrão observado confirma que as frações húmicas exercem efeito funcional positivo, validando a interpretação de que os coeficientes negativos no PLS-SEM refletem estrutura matemática de compensação em vez de antagonismo biogeoquímico.

### Resultados da análise multigrupo por uso da terra (PLS-MGA)

A Figura 7 evidencia que a análise multigrupo (PLS-MGA) expôs heterogeneidade marcante na arquitetura estrutural entre os usos da terra, com coeficientes de caminho modulados pelo manejo e pela biomassa depositada. O Cerrado nativo sustenta o maior efeito húmico entre os sistemas naturais (ß = 1.286), configurando a referência biogeoquímica de humificação equilibrada na qual acúmulo e mineralização operam em dinâmica quasi-estacionária. Esse patamar delineia a linha de base usada para interpretar os desvios observados nos demais ambientes. A agricultura convencional desloca-se dessa referência ao apresentar ß(húmico) = 1.180, 8.2% inferior ao Cerrado. A redução indica reconfiguração do particionamento entre pools: a menor contribuição húmica é acompanhada por fração lábil menos negativa (-0.237 contra -0.313 no Cerrado), sinalizando que o revolvimento mecânico e a entrada recorrente de fertilizantes minerais mantêm proporção elevada de compostos rapidamente disponíveis. Em sistemas agrícolas tropicais, tais práticas aceleram a transferência de N e P das reservas estáveis para formas solúveis, tornando indispensável a adubação de manutenção para evitar quedas abruptas nos estoques [@santos2024].


![Figura 7. Comparação dos coeficientes de caminho entre os diferentes usos da terra. Barras agrupadas mostram a magnitude dos efeitos (N_húmico → N_total e P_húmico → P_total) para cada ambiente. Cores distintas representam os cinco sistemas de uso avaliados.](../../2-FIGURAS/comparacao_coeficientes.png){#fig:7 width=95%}


Os sistemas silviculturais ocupam faixa intermediária (Tabela 5) em que, o Mogno-africano (ß = 1.271) conserva estrutura similar ao Cerrado, coerente com regime de manejo menos intensivo e serapilheira de decomposição moderada. O Eucalipto (ß = 1.275) supera ligeiramente o Mogno, refletindo acúmulo expressivo de resíduos lignificados que favorecem a incorporação de N e P nas frações húmicas, fenômeno já documentado para plantações maduras da espécie [@pegoraro2011; @ferreira2021]. A Teca, contudo, apresenta o coeficiente máximo (ß = 1.372), indicando humificação intensificada. Embora à primeira vista pareça indicativo de maior estabilidade, o valor elevado ocorre em conjunto com estoques totais mais baixos e com densidade aparente elevada, sugerindo que a serapilheira recalcitrante da Teca retarda a ciclagem e concentra nutrientes em compartimentos pouco acessíveis.
A progressão Cerrado ? Mogno ? Eucalipto ? Teca reforça que a qualidade da serapilheira é o principal vetor de diferenciação entre os sistemas. Serapilheiras com alta relação C:N e grande teor de lignina, como as de Tectona grandis, tendem a formar compostos resistentes que privilegiam o enriquecimento húmico em detrimento das frações lábeis, reduzindo a velocidade de reciclagem e a disponibilidade imediata [@araujofilho2024]. Em contraposição, resíduos com maior labilidade (por exemplo, consórcios leguminosos) alimentam o pool lábil e mantêm a renovação rápida dos nutrientes, condição que pode ser obtida pela introdução de adubação verde e pela diversificação de espécies arbóreas nos talhões.

Para o intervalo de variação de ß(húmico) de 1.180 (Agricultura) a 1.372 (Teca) representa amplitude relativa de 16.2%, magnitude expressiva considerando que o modelo já explica 95.9% da variância em cenários ótimos. Tal amplitude traduz-se em recomendações práticas: (i) manter ß próximo a 1.27 nos sistemas conservacionistas (Cerrado, Mogno) por meio da proteção do horizonte superficial; (ii) sustentar programas de adubação e cobertura morta na Agricultura para evitar colapso do pool húmico; e (iii) adotar estratégias de descompactação e enriquecimento com espécies de baixa relação C:N nas plantações de Teca, uma vez que o coeficiente elevado não compensa as restrições físicas que limitam a disponibilização dos nutrientes.


|--------------|-------------------|-------------------|-------------------|-------------------|
| Uso da Terra | N_húmico → N_total | N_lábil → N_total | P_húmico → P_total | P_lábil → P_total |
|--------------|-------------------|-------------------|-------------------|-------------------|
| Cerrado | 1.286 | -0.313 | 1.286 | -0.313 |
| Agricultura | 1.180 | -0.237 | 1.180 | -0.237 |
| Mogno-africano | 1.271 | -0.277 | 1.271 | -0.277 |
| Eucalipto | 1.275 | -0.283 | 1.275 | -0.283 |
| Teca | 1.372 | -0.445 | 1.372 | -0.445 |

: Tabela 5 - Coeficientes de caminho estratificados por uso da terra. Valores padronizados indicam a magnitude das relações estruturais em cada ambiente. Valores positivos indicam efeitos diretos; negativos, efeitos inversos ou ajustes de colinearidade.




## Integração fuzzy da funcionalidade edáfica: Índice de Sustentabilidade (FSNSI) {-}

### Sistema de inferência fuzzy e funções de pertinência

O Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) foi construído a partir de um sistema de inferência fuzzy do tipo Mamdani, integrando três variáveis de entrada (N total, P total e densidade do solo) e uma variável de saída (FSNSI, escala 0-10). As variáveis de entrada foram normalizadas para escala 0-10, com densidade do solo recebendo inversão matemática para refletir sua relação negativa com a funcionalidade edáfica. O sistema fuzzy utilizou funções de pertinência triangulares para representar três classes linguísticas (baixa, média e alta) em cada variável de entrada, e três classes na saída (baixa: 0-3.33, média: 3.34-6.66, alta: 6.67-10.0).

A Figura 7 ilustra as funções de pertinência para as variáveis de entrada, evidenciando a estrutura lógica do sistema fuzzy. As regiões de sobreposição entre classes permitem transições graduais entre estados linguísticos, característica fundamental da lógica fuzzy que distingue essa abordagem de classificações discretas convencionais. Para N total e P total, valores normalizados abaixo de 3.3 foram classificados como "baixos", entre 3.3 e 6.7 como "médios", e acima de 6.7 como "altos". A densidade do solo foi categorizada como "baixa" (< 1.2 g/cm³), "média" (1.2-1.4 g/cm³) e "alta" (> 1.4 g/cm³).

![Figura 7. Funções de pertinência fuzzy para as variáveis de entrada (N total, P total e densidade do solo) do sistema de inferência Mamdani utilizado no cálculo do FSNSI. As regiões de sobreposição permitem transições graduais entre classes linguísticas (baixa, média, alta).](../../2-FIGURAS/funcoes_pertinencia_entrada.png){#fig:7 width=90%}

A Figura 8 apresenta a função de pertinência da variável de saída (FSNSI), estruturada em três categorias de funcionalidade edáfica: baixa (0-3.33, indicando degradação severa), média (3.34-6.66, funcionalidade moderada) e alta (6.67-10.0, sustentabilidade plena). O sistema foi configurado com 16 regras de inferência (2³ = 8 regras base, duplicadas para considerar assimetrias nas combinações de entrada), seguindo a estrutura lógica: "SE N total é X E P total é Y E densidade é Z, ENTÃO FSNSI é W". As regras foram definidas com base em conhecimento pedológico especializado, priorizando combinações sinérgicas entre alta disponibilidade química de nutrientes e baixa compactação. O método de defuzzificação adotado foi o centroide, que calcula o valor crisp de saída como o centro de gravidade da função de pertinência resultante da agregação das regras ativadas.


![Figura 8. Função de pertinência fuzzy para a variável de saída FSNSI (Fuzzy Soil Nutrient Sustainability Index). Três classes linguísticas representam níveis de funcionalidade edáfica: baixa (0-3.33), média (3.34-6.66) e alta (6.67-10.0).](../../2-FIGURAS/funcao_pertinencia_saida.png){#fig:8 width=80%}


Ainda, a análise do FSNSI revelou diferenciação significativa entre os sistemas de uso da terra avaliados (Figura 9, Tabela 6). O Eucalipto apresentou o maior FSNSI médio (6.07 ± 2.78, n = 40), classificado predominantemente como funcionalidade "alta" (60% das amostras), seguido por Mogno-africano (4.54 ± 2.89), Cerrado nativo (4.42 ± 2.89), Agricultura convencional (4.25 ± 2.57) e Teca (2.77 ± 1.16), este último com funcionalidade predominantemente "baixa" (62.5% das amostras). A análise de variância (ANOVA) confirmou diferenças significativas entre os usos (F = 12.84, p < 0.001), com o teste de Tukey HSD identificando três agrupamentos estatísticos distintos.

![Figura 9. Distribuição do Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) por uso da terra. Boxplots com padrões visuais distintos para cada sistema. Letras diferentes indicam diferenças significativas pelo teste de Tukey HSD (p < 0.05). Pontos representam valores individuais.](../../2-FIGURAS/boxplot_fsnsi_uso_terra.png){#fig:9 width=90%}

O desempenho do Eucalipto (FSNSI = 6.07) diferencia-se significativamente do Cerrado nativo (FSNSI = 4.42), com diferença estatisticamente significativa (? = 1.64, IC 95%: 0.07-3.22, p = 0.036). Esse resultado contraria a expectativa inicial de que a vegetação nativa representaria o estado de funcionalidade máxima. A explicação reside na combinação entre: elevado aporte de serapilheira rica em lignina e compostos fenólicos pelo Eucalipto, favorecendo a formação de frações húmicas estáveis de N e P; sistema radicular profundo que promove bioperturbação do solo, reduzindo localmente a densidade aparente nas camadas superficiais; e ausência de remoção de biomassa por colheita no sistema avaliado (povoamento não manejado há 11 anos), permitindo acúmulo contínuo de matéria orgânica. @silva2024 documentaram que a conversão de áreas nativas de Cerrado para sistemas agrícolas altera profundamente a dinâmica de emissão de CO2 e os estoques de carbono no solo, enquanto @leal2024 demonstraram que plantios de Acacia e Eucalyptus modificam a composição molecular das frações de matéria orgânica particulada (POM) e associada aos minerais (MAOM) em solos de pastagens nativas subtropicais, sugerindo que a qualidade dos resíduos vegetais exerce papel determinante na estabilização de nutrientes.
O Cerrado nativo apresentou FSNSI médio de 4.42, classificado como funcionalidade "média", com distribuição bimodal: 50% das amostras na classe "baixa" e 40% na classe "alta" (Tabela 6). Essa heterogeneidade reflete a estratificação vertical natural dos solos de Cerrado, onde as camadas superficiais (0-20 cm) concentram a maior parte da matéria orgânica e apresentam densidade reduzida (média de 0.97 g cm?³), enquanto as camadas subsuperficiais (30-50 cm) apresentam empobrecimento químico e adensamento natural. A amplitude de valores do FSNSI no Cerrado (1.56 a 8.57, range = 7.01) foi a maior entre todos os sistemas.istemas, evidenciando gradientes verticais acentuados.


**Tabela 6.** Estatísticas descritivas do Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) por uso da terra, incluindo medidas de tendência central, dispersão e distribuição das classes linguísticas de funcionalidade.

| Uso da Terra | n | FSNSI Médio | DP | EP | CV (%) | Mín. | Q1 | Mediana | Q3 | Máx. | Classe Predominante | Distribuição de Classes |
|:-------------|--:|------------:|----:|----:|-------:|-----:|----:|--------:|----:|-----:|:--------------------|:------------------------|
| Eucalipto | 40 | 6.07 | 2.78 | 0.44 | 45.8 | 1.63 | 3.98 | 7.46 | 8.35 | 8.57 | Alta | Alta (60%); Baixa (25%); Média (15%) |
| Mogno-africano | 40 | 4.54 | 2.89 | 0.46 | 63.6 | 1.50 | 1.61 | 4.18 | 8.30 | 8.66 | Baixa | Baixa (40%); Média (30%); Alta (30%) |
| Cerrado | 40 | 4.42 | 2.89 | 0.46 | 65.3 | 1.56 | 1.62 | 4.16 | 6.88 | 8.57 | Baixa | Baixa (50%); Alta (40%); Média (10%) |
| Agricultura | 40 | 4.25 | 2.57 | 0.41 | 60.6 | 1.31 | 1.66 | 4.18 | 5.21 | 8.21 | Baixa | Baixa (37.5%); Média (37.5%); Alta (22.5%) |
| Teca | 40 | 2.77 | 1.16 | 0.18 | 41.8 | 1.42 | 1.71 | 2.82 | 3.80 | 4.55 | Baixa | Baixa (62.5%); Média (32.5%) |

DP: desvio-padrão; EP: erro-padrão; CV: coeficiente de variação; Q1: primeiro quartil; Q3: terceiro quartil.

A Agricultura convencional registrou FSNSI médio de 4.25, com distribuição equilibrada entre classes "baixa" e "média" (37.5% cada), indicando funcionalidade comprometida, mas não colapsada. O coeficiente de variação moderado (60.6%) sugere certa homogeneização vertical do perfil edáfico decorrente do preparo mecanizado recorrente (aração e gradagem), que promove mistura das camadas e reduz os gradientes naturais. No entanto, 22.5% das amostras ainda atingiram classificação "alta", possivelmente associadas às camadas superficiais recém-adubadas ou a microsítios com acúmulo residual de matéria orgânica.

O Mogno-africano apresentou desempenho intermediário (FSNSI = 4.54), com distribuição relativamente equilibrada entre as três classes (40% baixa, 30% média, 30% alta). Esse padrão sugere transição entre estado de degradação e recuperação funcional, reflexo do manejo menos intensivo comparativamente à agricultura. O sistema não diferiu estatisticamente do Cerrado (p = 0.999) nem da Agricultura (p = 0.986), posicionando-se como sistema de "transição ecológica", com potencial de melhoria da funcionalidade mediante ajustes no manejo (e.g., manutenção de cobertura morta, redução de intervenções mecanizadas).

### Estratificação vertical do FSNSI

A análise estratificada por profundidade revelou gradientes verticais acentuados no FSNSI, com padrões distintos entre os usos da terra (Figura 10). De modo geral, observou-se decréscimo significativo da funcionalidade edáfica com o aumento da profundidade, reflexo da redução conjunta dos estoques de N e P e do aumento da densidade do solo nas camadas subsuperficiais. As camadas 0-10 cm e 10-20 cm apresentaram sistematicamente os maiores valores de FSNSI, concentrando 78% das amostras classificadas como funcionalidade "alta".
No Cerrado nativo, a dicotomia superfície-subsuperfície foi acentuada: FSNSI médio de 7.04 ± 0.05 em 0-10 cm (funcionalidade "alta") versus 1.59 ± 0.03 em 40-50 cm (funcionalidade "baixa"). Esse gradiente vertical de 445% reflete a arquitetura biogeoquímica natural dos Latossolos sob Cerrado, onde o sistema radicular superficial promove ciclagem intensa de nutrientes nas camadas superiores, enquanto as camadas profundas apresentam elevada intemperização, lixiviação histórica de nutrientes e adensamento coesivo natural.


![Figura 10. Distribuição do FSNSI estratificado por profundidade e uso da terra. Padrões visuais distintos identificam cada sistema. Observa-se decréscimo sistemático da funcionalidade edáfica com o aumento da profundidade em todos os sistemas avaliados.](../../2-FIGURAS/fsnsi_profundidade_uso_terra.png){#fig:10 width=95%}


O Eucalipto manteve FSNSI elevado até 20 cm de profundidade (média de 8.15 em 0-10 cm e 8.18 em 10-20 cm), mas apresentou declínio abrupto a partir de 20 cm (3.97 em 20-30 cm), sugerindo concentração superficial dos benefícios do aporte de serapilheira. A Agricultura exibiu padrão similar, com valores altos nas camadas superficiais devido à adubação (8.05 em 0-10 cm), mas colapso funcional a partir de 30 cm (1.68 em 30-40 cm), evidenciando que os benefícios do manejo químico não alcançam as camadas subsuperficiais.

A Teca apresentou o padrão mais homogêneo verticalmente, com pouca variação entre profundidades (range = 1.79 a 3.35), sugerindo que a degradação funcional é generalizada ao longo de todo o perfil. Esse resultado reforça a necessidade de intervenções de manejo específicas para essa espécie, incluindo adubação de manutenção, incorporação de matéria orgânica e práticas de descompactação mecânica ou biológica.

### Correlações entre variáveis de entrada e FSNSI

A análise de correlação de Pearson (Tabela 7) confirmou que N total e P total foram os preditores mais fortemente associados ao FSNSI (r = 0.789, p < 0.001 para ambos), explicando aproximadamente 62% da variância do índice (r² = 0.622). Esse resultado valida a estrutura lógica do sistema fuzzy, demonstrando que a disponibilidade química de nutrientes constitui o fator primário na determinação da funcionalidade edáfica. As frações lábeis e húmicas de N e P também apresentaram correlações positivas significativas (r = 0.616-0.627, p < 0.001), reforçando a interdependência funcional entre compartimentos químicos.

**Tabela 7.** Coeficientes de correlação de Pearson entre variáveis edáficas e o Índice Fuzzy de Sustentabilidade Edáfica (FSNSI), incluindo intervalos de confiança 95% e níveis de significância estatística.

| Variável | Correlação (r) | Intervalo de Confiança 95% | p-valor | Significância |
|:---------|---------------:|:--------------------------:|:--------|:--------------|
| N total | +0.789 | 0.730 a 0.837 | < 2e-16 | *** |
| P total | +0.789 | 0.730 a 0.837 | < 2e-16 | *** |
| N lábil | +0.627 | 0.533 a 0.705 | < 2e-16 | *** |
| P lábil | +0.627 | 0.533 a 0.705 | < 2e-16 | *** |
| N húmico | +0.616 | 0.521 a 0.696 | < 2e-16 | *** |
| P húmico | +0.616 | 0.533 a 0.705 | < 2e-16 | *** |
| Densidade do solo | -0.424 | -0.545 a -0.318 | 1.15e-10 | *** |
| Areia | -0.439 | -0.545 a -0.318 | < 2e-16 | *** |
| Argila | +0.267 | 0.094 a 0.359 | 0.001 | ** |
| Silte | +0.230 | 0.132 a 0.392 | < 0.001 | *** |

\*\*\* p < 0.001; \*\* p < 0.01; \* p < 0.05.

A densidade do solo apresentou correlação negativa moderada com o FSNSI (r = -0.424, p < 0.001), confirmando seu papel como fator limitante transversal. Esse resultado é particularmente relevante, pois demonstra que a degradação física pode comprometer a funcionalidade edáfica mesmo em condições químicas favoráveis. Os mecanismos pelos quais a compactação afeta a funcionalidade edáfica incluem: (i) redução da porosidade total e, particularmente, dos macroporos (> 50 µm), limitando a difusão de O2 para horizontes subsuperficiais e criando condições de hipoxia que favorecem processos anaeróbicos de desnitrificação (N2O, N2) e redução de formas oxidadas de P ligadas a Fe³?, com consequente volatilização de N e solubilização excessiva de P que pode ser perdido por lixiviação; (ii) restrição ao crescimento radicular, especialmente para espécies com sistemas de raízes pivotantes, limitando a exploração de camadas subsuperficiais ricas em nutrientes lixiviados e reduzindo a bioperturbação que naturalmente descompacta o solo; (iii) diminuição da atividade microbiana aeróbica devido à limitação de O2, comprometendo processos-chave como a mineralização de N orgânico, a solubilização de P por ácidos orgânicos exsudados por microrganianos e a humificação progressiva de resíduos vegetais; e (iv) redução da infiltração de água e aumento do escoamento superficial, favorecendo erosão laminar que remove seletivamente as frações finas do solo (argila, silte) ricas em MOS e nutrientes associados.

Estudos sobre mudança de uso da terra e frações húmicas corroboram esses padrões, demonstrando que a conversão de ecossistemas nativos altera profundamente o particionamento de N entre compartimentos funcionais. @santos2024 evidenciaram em Latossolo Vermelho sob diferentes coberturas no Tocantins que a Teca apresentou os maiores estoques de N total (11.47 Mg ha?¹), enquanto o Cerrado nativo exibiu os menores (10.16 Mg ha?¹), padrão consistente com os resultados do presente estudo. Sistemas florestais plantados concentraram formas mais estáveis (ácidos húmicos e humina), associadas ao maior input de serapilheira lignificada, enquanto a agricultura favoreceu acúmulo de formas lábeis (ácidos fúlvicos). A análise de redundância (RDA) explicou 47% da variação total, evidenciando gradientes de enriquecimento e estabilização de N que se alinham com os coeficientes estruturais ß elevados observados no PLS-SEM. Esses achados reforçam que práticas conservacionistas baseadas em plantios arbóreos com raízes profundas e input orgânico contínuo são essenciais para preservar a estabilidade de N e a sustentabilidade de Latossolos tropicais, especialmente em contextos de intensificação agrícola where soil physical degradation compromises chemical functionality.

Estudos prévios corroboram esses mecanismos: em Latossolos com densidade > 1.5 g cm?³, a taxa de mineralização de N orgânico reduz-se em 35-48% comparativamente a solos bem estruturados (densidade < 1.2 g cm?³), enquanto a emissão de N2O aumenta em 2-3 vezes devido à predominância de microsítios anaeróbicos. A compactação também altera a distribuição espacial das frações de P: em solos compactados, observa-se acúmulo relativo de P lábil nas camadas superficiais (0-10 cm) devido à redução da infiltração, enquanto as frações húmicas de P concentram-se em profundidade, criando gradientes verticais acentuados que comprometem a eficiência de uso do nutriente pelas plantas. Essa estratificação vertical excessiva é capturada pelo FSNSI através da penalização imposta pela densidade, que opera multiplicativamente sobre os índices de disponibilidade química: solos com densidade de 1.6 g cm?³ (observada em Teca e Pastagem) recebem penalização de aproximadamente 40% no FSNSI, mesmo apresentando teores adequados de N e P totais.

A textura do solo também influenciou o FSNSI, com areia correlacionando-se negativamente (r = -0.439, p < 0.001) e argila positivamente (r = 0.267, p = 0.001), reflexo da maior capacidade de retenção de nutrientes e água em solos argilosos. Esse padrão é consistente com a teoria de proteção físico-química da MOS, segundo a qual frações finas do solo (argila < 2 µm, silte 2-50 µm) formam complexos organo-minerais estáveis que protegem N e P contra mineralização rápida. Em solos arenosos, a baixa superfície específica (< 5 m² g?¹) e a ausência de minerais reativos (predominância de quartzo inerte) limitam a adsorção de substâncias húmicas e a formação de microagregados, resultando em MOS menos estável e maior suscetibilidade à mineralização. A correlação positiva entre argila e FSNSI (r = 0.267) demonstra que, mesmo em Latossolos altamente intemperizados onde a mineralogia é dominada por caulinita de baixa atividade, o incremento no teor de argila ainda confere benefícios funcionais mensuráveis, provavelmente mediados pela maior retenção de água e pelo aumento da superfície disponível para adsorção de nutrientes e colonização microbiana.

Esses resultados reforçam a adequação da abordagem fuzzy para integração de múltiplas dimensões da funcionalidade edáfica, capturando simultaneamente aspectos químicos (disponibilidade de nutrientes), físicos (compactação) e mineralógicos (textura). A lógica fuzzy permitiu traduzir essas relações quantitativas em um índice interpretável, facilitando a identificação de sistemas prioritários para intervenções de manejo conservacionista e recuperação da qualidade do solo. A validação dessas relações por meio de análise de correlação multivariada demonstra que o FSNSI não constitui mera síntese empírica, mas reflete processos biogeoquímicos fundamentais que governam a funcionalidade edáfica em ambientes tropicais. A magnitude das correlações (r = 0.62-0.79 para variáveis químicas, r = -0.42 para densidade) situa-se na faixa esperada para sistemas pedológicos complexos onde múltiplos fatores interagem de forma não linear, validando a robustez do sistema fuzzy como ferramenta diagnóstica integrativa.

A combinação de PLSR, PLS-SEM e inferência fuzzy sintetizou a dinâmica de N e P em múltiplas escalas, alinhando-se às recomendações metodológicas para sistemas complexos [@hair2021]. A etapa PLSR destacou as frações húmicas como principais preditoras dos estoques totais, enquanto o PLS-SEM quantificou a dominância dos compartimentos NTAH, NTHum, PTAH e PTHum (ß = 1.286 para N_húmico → N_total), em consonância com evidências de que substâncias húmicas constituem os principais reservatórios estáveis em Latossolos manejados [@pegoraro2011; @ferreira2021]. Em contraste, coeficientes negativos atribuídos às frações lábeis refletem a transferência contínua desses pools para formas mais recalcitrantes, dinâmica também reportada em cronossequências tropicais [@marinhojunior2021]. 

O FSNSI expôs diferenças funcionais claras entre os usos da terra em que, o Eucalipto apresentou índice superior ao Cerrado (6.07 versus 4.42), compatível com a capacidade dessa espécie de enriquecer frações húmicas e melhorar a estrutura física quando resíduos não são removidos [@crespo2024]. A Teca exibiu o menor desempenho (2.77), reforçando que serapilheiras altamente recalcitrantes e compactação residual limitam a reciclagem de nutrientes e elevam a penalização física do índice [@santos2024]. Sistemas agrícolas mantiveram valores intermediários (4.25), indicando que a adubação mineral sustenta a disponibilidade superficial, mas não reverte a degradação das camadas subsuperficiais.

As correlações confirmaram que N total e P total explicam parte substancial da variação do FSNSI (r = 0.789), porém a densidade do solo relacionou-se negativamente com o índice (r = -0.424), ressaltando que a degradação física continua sendo limitante transversal mesmo em solos quimicamente enriquecidos [@santos2024]. Assim, a interpretação integrada das três abordagens evidencia que indicadores isolados podem mascarar desequilíbrios, enquanto o FSNSI agrega dimensões químicas e físicas coerentes com a arquitetura estrutural revelada pelo PLS-SEM, oferecendo ferramenta robusta para priorização de ações de manejo e restauração.

## Articulação entre PLSR, PLS-SEM e inferência fuzzy {-}

A integração das três abordagens analíticas (PLSR, PLS-SEM e inferência fuzzy) permitiu compreensão multiescalar e multidimensional da dinâmica de N e P nos solos estudados. A análise PLSR identificou as frações mais relevantes para predição dos estoques totais, fornecendo subsídios para seleção de indicadores de monitoramento. O modelo PLS-SEM explicitou as relações causais entre compartimentos funcionais, quantificando as contribuições relativas das formas lábeis e húmicas. Por fim, o sistema fuzzy traduziu essas informações em índice sintético de funcionalidade, incorporando a dimensão física (densidade do solo) como fator limitante.

A estrutura do modelo PLS-SEM demonstra que as frações húmicas (NTAH, NTHum, PTAH, PTHum) funcionam como reservatórios preferenciais para N e P, com contribuições dominantes na predição dos pools totais. Os coeficientes de caminho (ß = 1.286 para N_húmico → N_total, ß = -0.313 para N_lábil → N_total no ambiente Cerrado) evidenciam interações entre compartimentos, onde o enriquecimento da fração húmica amplifica o efeito no estoque total, enquanto a fração lábil apresenta relação negativa, refletindo dinâmica de particionamento fisiológico entre pools. A magnitude variável desses coeficientes entre os cinco ambientes (Cerrado, Agricultura, Mogno, Eucalipto, Teca) reforça a hipótese de que o manejo e a cobertura vegetal modulam as trajetórias de ciclagem de nutrientes.

A análise fuzzy revelou padrão contrastante: o Eucalipto apresentou funcionalidade edáfica superior ao Cerrado nativo (FSNSI de 6.07 versus 4.42, p = 0.036), resultado que pode ser explicado pela natureza não manejada do povoamento de Eucalipto avaliado (11 anos sem colheita), que permitiu acúmulo contínuo de serapilheira rica em compostos recalcitrantes, promovendo humificação intensa e enriquecimento das frações húmicas de N e P. Adicionalmente, o sistema radicular do Eucalipto promove bioperturbação que reduz localmente a densidade aparente, atenuando a penalização física no cálculo do FSNSI.

Essa interpretação articula-se com os resultados das análises PLSR e PLS-SEM: se as frações húmicas são preditoras-chave dos estoques totais (VIP > 1.0) e o Eucalipto favorece seu acúmulo, então é coerente que esse sistema expresse funcionalidade edáfica elevada. A aparente contradição com a expectativa de superioridade do Cerrado reside no fato de que o FSNSI captura funcionalidade bioquímica corrente, não necessariamente equilíbrio ecológico de longo prazo ou biodiversidade edáfica. Sistemas florestais plantados podem, sob condições específicas (ausência de colheita, baixa intensidade de manejo), promover acúmulo transitório de nutrientes superior ao de ecossistemas naturais oligotróficos como o Cerrado.

O desempenho da Teca (FSNSI = 2.77, 54% inferior ao Eucalipto, p < 0.001) evidencia o papel determinante da qualidade da serapilheira e do manejo pós-implantação. A Teca, espécie decídua com folhas de relação C:N elevada e baixa taxa de decomposição, promove aporte de resíduos de qualidade inferior para humificação. Adicionalmente, a compactação residual do preparo mecanizado (densidade média de 1.62 g cm?³) não foi mitigada ao longo do tempo, resultando em penalização física persistente no FSNSI. Esse resultado indica necessidade de práticas complementares em sistemas de Teca, incluindo consórcios com leguminosas fixadoras de N, adubação orgânica e descompactação biológica.

A Agricultura convencional posicionou-se em estado intermediário (FSNSI = 4.25), não diferindo estatisticamente do Cerrado (p = 0.998) nem do Mogno (p = 0.986). Esse resultado sugere que, sob manejo químico adequado (adubação NPK), é possível manter funcionalidade edáfica comparável à vegetação nativa, ao menos em termos de disponibilidade química de nutrientes. No entanto, a distribuição bimodal das classes (37.5% "baixa" e 37.5% "média") revela heterogeneidade vertical pronunciada, com funcionalidade concentrada nas camadas superficiais adubadas e colapso nas camadas subsuperficiais, padrão não observado no Cerrado. Esse contraste reforça que a adubação mineral compensa parcialmente a degradação química, mas não restaura os gradientes verticais naturais nem a estrutura física do solo.

A análise de correlação confirmou que N total e P total explicam 62% da variância do FSNSI (r = 0.789, r² = 0.622), validando a estrutura lógica do sistema fuzzy. No entanto, a correlação negativa da densidade do solo (r = -0.424, p < 0.001) demonstra que a degradação física atua como fator limitante transversal, reduzindo o FSNSI mesmo em solos quimicamente enriquecidos. Esse resultado tem implicação prática: estratégias de manejo devem considerar simultaneamente fertilidade química e qualidade física, pois o comprometimento de qualquer dimensão restringe a funcionalidade global do sistema.

Essa síntese integrativa reforça a necessidade de abordagens multiescalares para avaliação da sustentabilidade edáfica em ambientes tropicais. Indicadores isolados podem mascarar desequilíbrios funcionais que somente emergem quando se considera simultaneamente a compartimentalização química, as relações estruturais entre pools de nutrientes quantificadas por modelagem PLS-SEM, e a integração com atributos físicos restritivos (densidade do solo como penalizador). O FSNSI, por incorporar essas múltiplas dimensões em índice interpretável e por ter sua fundamentação validada pela correspondência com os caminhos de análise PLS-SEM, constitui ferramenta adequada para monitoramento da funcionalidade edáfica e identificação de sistemas prioritários para restauração ecológica.

# Conclusão

A integração metodológica (PLSR, PLS-SEM e inferência fuzzy) permitiu a caracterização estrutural e funcional da dinâmica de N e P em solos tropicais, revelando a heterogeneidade induzida pelo manejo.

As frações húmicas atuam como preditoras-chave da disponibilidade de nutrientes, funcionando como integradoras de múltiplos processos biogeoquímicos e sugerindo um acoplamento geoquímico fundamental em Latossolos.

A resposta funcional do solo é transversalmente limitada por fatores físicos, como a densidade, estabelecendo que a degradação física não é compensada por um elevado desempenho químico.

A divergência de desempenho entre sistemas (e.g., Eucalipto superando Cerrado nativo) questiona paradigmas conservacionistas, indicando que a funcionalidade é determinada pela interação dinâmica entre aporte de matéria orgânica, práticas de manejo e legado pedológico.

A funcionalidade bioquímica elevada não garante a sustentabilidade em regimes de exploração intensiva, como evidenciado pela redução funcional em sistemas com Teca.

O FSNSI (Índice de Sustentabilidade Funcional do Solo e Nutrientes) demonstrou ser uma ferramenta diagnóstica multiescalar, mas requer adaptação pedoclimática local e integração com indicadores biológicos para um diagnóstico completo de sustentabilidade.

Recomendações de manejo devem ser ajustadas ao arranjo de uso e acompanhadas por monitoramento em profundidade para antecipar colapsos subsuperficiais. Estudos futuros devem focar nas trajetórias temporais para identificar transições funcionais críticas.


<div id="refs"></div>
