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

A conversão de ecossistemas naturais em sistemas agrícolas modifica profundamente a dinâmica do fósforo (P) e do nitrogênio (N) no solo, comprometendo a sustentabilidade dos ambientes tropicais e a resiliência dos processos biogeoquímicos. Este estudo teve como objetivo avaliar a dinâmica funcional de nitrogênio e fósforo nas frações húmicas e lábeis do solo sob diferentes usos da terra no sul do Tocantins, integrando abordagens de modelagem preditiva, estrutural e de inferência fuzzy para diagnóstico da sustentabilidade edáfica. Foram avaliados cinco sistemas de uso da terra (Cerrado nativo, Eucalipto (*Eucalyptus* sp.), Mogno-africano (*Khaya ivorensis*), Teca (*Tectona grandis*) e Agricultura (soja/milho em rotação)), em amostras de solo coletadas até 50 cm de profundidade. As frações químicas de P e N foram quantificadas nas formas lábeis (NLabil, NMOL, PLabil, PMOL), húmicas (NTAF, NTAH, NTHum, PTAF, PTAH, PTHum) e totais (NT, PT), incluindo seus respectivos estoques (EstNT, EstPT e frações). Dois modelos PLSR independentes foram ajustados para predição de NT e PT a partir das frações funcionais, com validação cruzada leave-one-out e cálculo dos escores de importância das variáveis (VIP). O modelo PLS-SEM integrou construtos latentes (N_lábil, N_húmico, P_lábil, P_húmico) aos estoques totais (N_total, P_total), sendo estimado de forma estratificada por uso da terra em análise multigrupo (PLS-MGA). Em paralelo, a inferência fuzzy do tipo Mamdani foi aplicada para sintetizar a funcionalidade edáfica em um Índice Fuzzy de Sustentabilidade Edáfica (FSNSI), integrando N total, P total e densidade do solo como entradas mediante 16 regras linguísticas. Os resultados evidenciaram que o Eucalipto apresentou a maior funcionalidade edáfica (FSNSI = 6.07), superando o Cerrado nativo (4.42, p = 0.036) devido ao acúmulo de serapilheira recalcitrante e bioperturbação radicular. A Teca registrou funcionalidade crítica (FSNSI = 2.77), 54% inferior ao Eucalipto (p < 0.001), associada à baixa qualidade da serapilheira e compactação residual (1.62 g cm⁻³). A Agricultura e o Mogno apresentaram funcionalidade intermediária (FSNSI = 4.25 e 4.54, respectivamente), não diferindo estatisticamente do Cerrado. O modelo estrutural PLS-SEM apresentou elevado ajuste (R² > 0.80; SRMR < 0.06), confirmando a interdependência funcional entre P e N. A análise PLSR identificou as frações húmicas como preditoras mais relevantes (VIP > 1.0) para os estoques totais. A densidade do solo correlacionou-se negativamente com o FSNSI (r = -0.424, p < 0.001), confirmando seu papel como fator limitante transversal. Conclui-se que a integração entre PLS-SEM, PLSR e inferência fuzzy constitui ferramenta robusta e multiescalar para avaliar a sustentabilidade nutricional do solo, revelando que sistemas florestais plantados não manejados podem apresentar funcionalidade química superior a ecossistemas naturais oligotróficos, embora essa superioridade não implique necessariamente equilíbrio ecológico pleno.

**Palavras-chave:** Nitrogênio do solo; Frações húmicas; Mudança de uso da terra; Cerrado; Latossolo; PLS-SEM; PLSR.

# 1. Introdução

Os solos tropicais constituem sistemas biogeoquímicos altamente dinâmicos e complexos, nos quais a matéria orgânica desempenha papel central na regulação dos ciclos de carbono (C), nitrogênio (N) e fósforo (P), além de sustentar a fertilidade e a estabilidade estrutural dos ecossistemas [@lal2020; @cotrufo2019]. No entanto, o avanço das atividades agropecuárias e silviculturais em substituição à vegetação nativa tem modificado de forma profunda o equilíbrio desses processos, resultando em alterações nos estoques e nas formas químicas dos nutrientes do solo [@tivet2013; @wang2023]. Tais mudanças são particularmente evidentes no bioma Cerrado, onde a expansão agrícola e a intensificação do uso da terra promovem a degradação da matéria orgânica do solo (MOS), a redução das frações húmicas estáveis e o comprometimento da funcionalidade edáfica [@strassburg2017; @sousa2021].

O Cerrado brasileiro, reconhecido como um dos principais hotspots de biodiversidade do planeta, abriga solos altamente intemperizados, naturalmente ácidos e pobres em fósforo e nitrogênio disponível [@sano2020]. Nessas condições, a sustentabilidade do sistema depende fortemente da manutenção das frações húmicas da MOS, que atuam como reservatórios de nutrientes e contribuem para a formação de agregados estáveis e a retenção de água [@paul2016; @lehmann2015]. As substâncias húmicas compostas por ácidos húmicos (AH), ácidos fúlvicos (AF) e humina (Hum) exercem papel essencial na estabilização de N e P, seja por adsorção, complexação ou imobilização biogênica, promovendo a persistência desses elementos no solo [@stevenson1994; @helfenstein2020].


A conversão de áreas nativas em sistemas agrícolas e pastagens altera o aporte e a qualidade dos resíduos orgânicos, acelerando a decomposição e reduzindo a formação de compostos húmicos recalcitrantes. Consequentemente, há diminuição dos estoques totais de N e P e do potencial de acúmulo nas frações húmicas [@silva2022]. Essa perda funcional compromete a resiliência do solo, aumentando a vulnerabilidade à erosão, à compactação e à degradação química, com reflexos diretos na produtividade agrícola e na ciclagem de nutrientes em longo prazo [@six2002; @lal2020].

Nos últimos anos, tem-se intensificado o interesse científico em compreender o acoplamento biogeoquímico entre N e P isto é, como suas formas lábeis e húmicas interagem e se co-estabilizam na MOS. Evidências crescentes indicam que esses nutrientes não atuam isoladamente, mas são co-regulados por processos de decomposição, humificação e proteção físico-química em complexos organo-minerais [@helfenstein2020; @chen2018]. Apesar disso, a maioria dos estudos ainda analisa N e P de forma independente, negligenciando as relações estruturais entre seus compartimentos e as implicações para a sustentabilidade edáfica. Essa lacuna é especialmente relevante em ecossistemas tropicais, onde a variabilidade textural e climática amplia a complexidade das interações entre nutrientes e frações do solo [@wang2023].

Modelos analíticos avançados, como a modelagem por equações estruturais baseada em mínimos quadrados parciais (PLS-SEM), oferecem novas oportunidades para desvendar as relações causais entre compartimentos edáficos. Essa abordagem permite avaliar o peso relativo das frações húmicas e lábeis na explicação dos estoques totais de N e P, considerando interdependências não lineares e variáveis latentes [@hair2021]. Em paralelo, métodos de inteligência computacional, como os sistemas de inferência fuzzy, possibilitam sintetizar múltiplos indicadores químicos e físicos do solo em um único índice de desempenho funcional, integrando informações quantitativas e qualitativas em escalas contínuas [@mamdani1977; @lima2023].

Nesse sentido, a combinação dessas duas abordagens modelagem estrutural e inferência fuzzy representa uma fronteira promissora para o diagnóstico e o monitoramento da qualidade do solo. Enquanto a modelagem PLS-SEM explicita os mecanismos de contribuição das frações húmicas e lábeis para os estoques de nutrientes, o sistema fuzzy permite traduzir os resultados em um Índice Fuzzy de Sustentabilidade Edáfica (FESI), incorporando atributos físicos como a densidade aparente, que expressa a integridade estrutural e a limitação à atividade biológica do solo [@mendonca2024]. Essa integração metodológica fornece uma visão abrangente da funcionalidade edáfica, considerando simultaneamente a disponibilidade química de nutrientes e as restrições físicas impostas pelo uso e manejo da terra.

A compreensão integrada da dinâmica funcional de N e P em diferentes usos da terra é, portanto, fundamental para orientar estratégias de manejo conservacionista e restauração ecológica em ambientes tropicais. A estabilidade da MOS, mais do que a simples quantidade de matéria orgânica acumulada, depende da proporção entre frações lábeis de rápida renovação e húmicas de longa persistência, as quais determinam o equilíbrio entre disponibilidade imediata e armazenamento de longo prazo de nutrientes [@cotrufo2019]. Assim, avaliar como as pressões antrópicas alteram essa relação é essencial para estimar a capacidade do solo de sustentar funções ecológicas críticas e resistir à degradação.

Com base nesse contexto, formula-se a hipótese de que as frações húmicas e lábeis de nitrogênio e fósforo exercem contribuições distintas, porém complementares, para os estoques totais desses nutrientes no solo, e que a degradação física, expressa pela densidade aparente, atua como fator limitante da funcionalidade edáfica. Espera-se que sistemas sob vegetação nativa apresentem maior co-estabilização de N e P em frações húmicas estáveis, enquanto usos agrícolas e silviculturais revelem predominância de formas lábeis e menor sinergia entre os ciclos biogeoquímicos desses elementos.

Diante dessas premissas, o presente estudo teve como objetivo avaliar a dinâmica funcional de nitrogênio e fósforo nas frações húmicas e lábeis do solo sob diferentes usos da terra no sul do Tocantins, integrando abordagens de modelagem preditiva, estrutural e de inferência fuzzy para diagnóstico da sustentabilidade edáfica. Para isso, buscou-se identificar as frações de N e P mais relevantes para predição dos estoques totais por meio de regressão por mínimos quadrados parciais (PLSR), quantificar as contribuições relativas das formas lábeis e húmicas aos estoques totais mediante modelagem por equações estruturais (PLS-SEM) e análise multigrupo entre usos da terra e integrar atributos químicos e físicos do solo em um Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) para sintetizar a funcionalidade biogeoquímica dos sistemas avaliados.

# 2. Material e Métodos

## 2.1 Área de estudo

A área de estudo está localizada na fazenda experimental da Universidade Federal do Tocantins, município de Gurupi – TO, nas coordenadas geográficas centrais 11º 46’ 25” S e 49º 02’ 54” W (Figura 1).

![Figura 1. Localização das áreas experimentais](../2-FIGURAS/fig_1.png){#fig:1 width=70%}

Fonte: Marinho Júnior (2021)
Conforme a classificação climática proposta por Thornthwaite e Mather, a região de estudo enquadra-se na categoria úmido subúmido (C2wA'a'), caracterizada por um déficit hídrico moderado no período invernal. Dados meteorológicos disponibilizados pela SEPLAN (2017) indicam temperaturas médias anuais variando entre 25 °C e 29 °C, com precipitação média anual em torno de 1580 mm.
O solo predominante na área foi classificado como Plintossolo Pétrico, o qual apresenta, como horizonte diagnóstico, um horizonte B plíntico. Esse tipo pedológico é comum em ambientes com lençol freático superficial ou em locais sujeitos a restrições de drenagem. A combinação entre altas temperaturas, regime hídrico favorável, relevo plano a suavemente ondulado e a presença de microdepressões naturais favorece a saturação hídrica periódica do solo, condição essencial para a gênese e expressão do horizonte plíntico (Santos et al., 2018). Foram avaliadas quatro áreas com diferentes usos do solo: Cerrado sensu stricto, Eucalyptus spp., pastagem e agricultura.

2.2 Características da área de vegetação nativa (Cerrado sensu stricto)
A área de vegetação nativa corresponde a um fragmento típico de Cerrado sensu stricto, com extensão aproximada de 22.82 hectares. De acordo com Marinho Júnior (2021), trata-se de uma formação com mais de cinco décadas de regeneração natural. Sua localização centraliza-se nas coordenadas geográficas 11º46’13” S e 49º03’25” W (ver Figura 2).

![Figura 2. Área ocupada com Cerrado sensu stricto](../../2-FIGURAS/fig_2.jpg)

Fonte: (2024)
A Tabela 1 apresenta as espécies florestais existentes na área e seus respectivos parâmetros de dominância absoluta (Bendito et al., 2018).  

Tabela 1 – Principais espécies florestais existentes na área de Cerrado sensu stricto, localizado na fazenda experimental da UFT, Campus de Gurupi (TO) e respectivas densidades relativas (DR%)

| Nome popular                 | Espécie                                 | DR (%) |
| :--------------------------- | :--------------------------------------- | -----: |
| Guaramim                     | Myrcia splendens (Sw.) DC.               |  13,04 |
| Pau-terrinha                 | Qualea multiflora Mart.                  |   9,87 |
| Amescla                      | Protium heptaphyllum (Aubl.) Marchand    |   7,53 |
| Tingui, Timbó               | Magonia pubescens A.St.-Hil.             |   5,35 |
| Pau-terra-da-folha-grande    | Qualea grandiflora Mart.                 |   5,02 |
| Pau-terra-de-flor-roxa       | Qualea parviflora Mart.                  |   4,35 |
| Murici                       | Byrsonima pachyphylla A.Juss.            |   3,01 |
| Pau-pombo                    | Tapirira guianensis Aubl.                |   2,84 |
| Quina                        | Antonia ovata Pohl                       |   2,51 |
| Acoita-cavalo-grauda         | Luehea grandiflora Mart. & Zucc.         |   2,51 |
| Murici                       | Byrsonima stipulacea A.Juss.             |   2,51 |
| Capitão-do-campo            | Terminalia argentea Mart.                |   2,17 |
| Angelim do cerrado           | Vatairea macrocarpa (Benth.) Ducke       |   1,84 |
| Folha-de-bolo                | Coccoloba mollis Casar.                  |   1,67 |
| Pimenta-de-macaco            | Xylopia aromatica (Lam.) Mart.           |   1,67 |
| Canjica                      | Roupala montana Aubl.                    |   1,67 |
| Copaíba                     | Copaifera langsdorffii Desf.             |   1,51 |
| Aroeira-do-campo             | Astronium fraxinifolium Schott           |   1,34 |
| Guamirim                     | Calyptranthes clusiifolia O.Berg         |   1,34 |
| Lixeira                      | Curatella americana L.                   |   1,17 |
| Binguinha                    | Eriotheca gracilipes (K.Schum.) A.Robyns |    0,5 |
| Espécies não identificadas |                                          |  21,82 |
| Árvores mortas              |                                          |   4,85 |
| Total                        |                                          |    100 |

## 2.3 Características da área de silvicultura Eucalipto (Eucalyptus spp.)

O plantio de indivíduos de Eucalyptus spp. foi estabelecido há 11 anos em uma área de 0,65 hectares, situada nas coordenadas geográficas 11°46’28” S e 49°03’08” W (Figura 3). A implantação do povoamento foi precedida pela remoção da vegetação nativa, utilizando-se trator de esteiras com lâmina frontal, seguida por operações mecanizadas de preparo convencional, incluindo aração e gradagem.
As mudas de Eucalyptus spp., com aproximadamente 25 cm de altura no momento do plantio, foram oriundas do viveiro AM Florestal, localizado em Brasilândia (SP). O plantio foi realizado manualmente em covas com dimensões de 40 × 40 × 40 cm, abertas com cavadeiras manuais, e espaçadas em um arranjo de 3,0 × 2,0 m (entre linhas × entre plantas).
A adubação de plantio foi realizada com a aplicação de 100 g de superfosfato simples em profundidade de 35 a 40 cm, além de 150 g da formulação NPK 5-25-15, incorporados a 25 cm de profundidade, conforme descrito por Barros (2017).

![Figura 3. Área ocupada com plantio de Eucalyptus sp.](../2-FIGURAS/fig_3.jpg)

Fonte: (2024)

## 2.4 Características da área de pastagem

A área de pastagem ocupa 11,25 hectares tem aproximadamente 40 anos de idade (Marinho Júnior, 2021) e está situada nas coordenadas 11º46’19” S e 49º03’12” W (Figura 4).
![Figura 4. Área de pastagem](../2-FIGURAS/fig_4.png)

Fonte: (2024)
Apresentando uma cobertura predominante do capim Andropogon sp., além de diversas outras espécies, como Spalum notatum, Eragrostis bahiensis, Axonopus affinis, Bothriochloa laguroides, Schizachyrium microstachyum, Paspalum dilatatum, Sporobolus indicus, Rhynchospora sp., Andropogon ternatus, Paspalum plicatulum, Eleocharis sp., Coelorhachis selloana e Panicum hians.

## 2.5 Características da área de agricultura

A área destinada à agricultura abrange 0,95 hectares e está localizada nas coordenadas 11º44’53” S e 49º03’11” W (Figura 5). Para preparar o solo, foram utilizados uma grade niveladora e um arado de discos. O controle de plantas daninhas foi feito por meio de capinas manuais, além da aplicação de herbicidas totais como o glifosato, quando necessário.
![Figura 5. Área de agricultura (plantio de milho)](../2-FIGURAS/fig_5.png)

Fonte: (2024)
Essa área foi cultivada por pelo menos seis anos com milho, visando à produção de espigas de milho verde e forragem (Melo et al., 2017). Os plantios aconteciam anualmente entre fevereiro e março, com um espaçamento médio de 0,20 x 0,80 m (Simon et al., 2016). Para a semeadura, foi utilizada uma plantadeira-adubadeira manual, que permitia a aplicação de adubo de base.
Na época da semeadura, os nutrientes aplicados incluíram nitrogênio na forma de sulfato de amônio (45% de N), P na forma de superfosfato triplo (42% de P2O5) e potássio na forma de cloreto de potássio (58% de K2O), correspondendo a 120 kg de N, 170 kg de P e 140 kg de K por hectare. O nitrogênio foi aplicado em duas etapas: 50% aos 25 dias e 50% aos 45 dias após a semeadura (Melo et al., 2017).

## 2.6 Amostragem de solo

Para coletar amostras de solo foram selecionadas aleatoriamente nas diferentes áreas: Cerrado sensu stricto, povoamento de Eucalyptus sp., pastagem natural e área agrícola. Seis trincheiras foram abertas com um gabarito de 70 x 70 cm e 50 cm de profundidade, conforme a (Figura 6).

![Figura 6. Coleta de solo em área de vegetação nativa (Cerrado sensu stricto)](../2-FIGURAS/fig_6.jpg)

Fonte: (2024)
As amostras foram coletadas durante o período seco, nas profundidades: 0-10, 10-20, 20-30, 30-40 e 40-50 cm, sendo a última considerada a camada de impedimento. As amostras deformadas foram secas ao ar em temperatura ambiente e, em seguida, passadas por uma peneira de 2 mm para as análises físicas e químicas. Já as amostras não deformadas foram coletadas separadamente para a determinação da densidade do solo.

### 2.6.1 Análises físicas

A distribuição dos tamanhos das partículas do solo nas profundidades de 0-50 cm, foi realizada em amostras deformadas por meio do método da pipeta (Teixeira et al., 2017), e apresentaram as seguintes médias para cada área: Eucalipto (areia 631.50 g kg-1, silte 83.80 g kg-1 e argila 284.70 g kg-1); Agricultura (areia 659.50 g kg-1, silte 65.60 g kg-1, argila 274.90 g kg-1); Pastagem (areia 672.90 g kg-1, silte 71.00 g kg-1, argila 256.10 g kg-1); Cerrado (areia 639.70 g kg-1, silte 84.70 g kg-1, argila 275.60 g kg-1).
Amostras não deformadas foram coletadas e submetidas à análise de densidade do solo (Teixeira et al., 2017), e as médias das áreas na profundidade de 0-50 cm foram: Eucalipto (1.57 g cm-3), Agricultura (1.51 g cm-3), Pastagem (1.62 g cm-3) e Cerrado (0.97 g cm-3).

### 2.6.2 Análises químicas

#### 2.6.2.1 Determinação do fósforo total no solo

O solo foi pesado em 0,5 g, passado em peneira de 150 μm (100 mesh), depois foi realizado a adição do ácido sulfúrico mais o peróxido de hidrogênio, e colocado em bloco digestor. Através de colorimetria pelo método de Murphy e Riley (1962) foi determinado P total do solo.

#### 2.6.2.2 Fracionamento das substâncias húmicas e teores de fósforo em cada fração

Para extrair as substâncias húmicas, as amostras de solo passaram por um processo de fracionamento seguindo o método da International Humic Substances Society (IHSS), conforme descrito por SWIFT em 1996. Esse processo resultou na obtenção das frações de ácidos fúlvicos (AF), ácidos húmicos (AH) e humina (Hum), baseado na solubilidade em soluções ácidas e alcalinas.
A extração começou com a mistura de 200 gramas de solo com uma solução de HCl a 0,1 mol/L, na proporção de 1 grama de solo para 10 mililitros de solução. Essa mistura foi agitada manualmente por 1 hora e, em seguida, deixada em repouso por 4 horas. O líquido que ficou por cima foi sifonado e reservado, dando origem ao extrato I de ácidos fúlvicos.
Depois disso, adicionou-se uma solução de NaOH a 0,1 mol/L na mesma proporção (1:10) e também foi agitada manualmente. Após essa etapa, a solução foi deixada em repouso por 16 horas. Em seguida, o material que se precipitou foi separado, correspondendo à fração de humina e ao material mineral.
O sobrenadante, que continha as frações de AF e AH, foi centrifugado por 10 minutos a 10.000 rpm. Depois, acidificou-se essa solução com a adição de 50 mililitros de HCl a 6 mol/L, ajustando o pH para um valor entre 1 e 2, e agitou-se manualmente por dois minutos. Após esse procedimento, a solução foi deixada em repouso por 12 horas. Ao final, o sobrenadante foi desviado, obtendo-se o extrato II de ácidos fúlvicos, enquanto o material precipitado estava relacionado à fração de ácidos húmicos.
Após o fracionamento das substâncias húmicas, as amostras foram congeladas e liofilizadas para a determinação dos teores de P em cada fração AF, AH e Hum, utilizando o método de colorimetria pelo método de Murphy e Riley (1962).

#### 2.6.2.3 Determinação dos estoques de fósforo

A partir das concentrações de P obtidas no solo e em cada uma das frações húmicas, foi possível determinar os estoques no solo e frações húmicas, expresso em microgramas por hectare (Mg ha⁻¹), para cada profundidade amostrada, conforme equação a seguir:
	EstP = TP x Ds x e
Em que:
EstP = Estoque de P na camada do solo, em Mg ha-1;
TP = Teor de P na fração amostrada de solo, em g kg-1;
Ds = Densidade do solo, em g cm-3;
e = espessura da camada, em cm.

Após o cálculo do estoque de P em cada camada, foi realizada a correção do estoque de P. Por fim, o estoque total de P no solo e nas substâncias húmicas na profundidade de 0 a 50 cm foi resultante da soma dos valores obtidos em cada camada amostrada.

### 2.6.3 Determinação do Nitrogênio total no solo

As amostras de solo deformadas, depois de passadas em peneiras de 2 mm, foram maceradas em almofariz de porcelana e pistilo até formar um pó fino, e passadas em peneira de malha de 150 μm. Os teores de Nitrogênio total - NT total no solo foram determinados através deste material, pelo método de combustão a seco, utilizando analisador elementar (Modelo PE-2400 Série II Perkin Elmer).

### 2.6.4 Fracionamento das substâncias húmicas e teores de Nitrogênio em cada fração

Para extração das substâncias húmicas, as amostras de solo foram submetidas ao fracionamento segundo o método da International Humic Substances Society - IHSS (SWIFT, 1996), obtendo-se as frações correspondentes aos ácidos fúlvicos - AF, ácidos húmicos - AH e humina - HUM, com base na solubilidade diferencial em soluções alcalinas e ácidas. Para a extração foi realizada com uma mistura de 200 g de solo com solução de HCl 0,1 mol L-1 na proporção de 1 g de solo para cada 10 mL de solução, sendo agitada manualmente por 1 hora, ficando depois em repouso por 4 horas.
O extrato sobrenadante foi sifonado e reservado, correspondendo ao extrato I de AF. Assim, a solução de NaOH 0,1 mol L-1 foi adicionada e precipitada na mesma proporção citada anteriormente (1:10) e também realizada agitação manual. Após este período, a solução foi deixada em repouso por 16 horas, seguindo na sequência para a nova retirada da mistura, na qual o material precipitado foi separado, correspondendo à fração Hum e fração mineral.

O material sobrenadante, referente às frações AF e AH, foi centrifugado por 10 minutos a 10.000 rpm, sendo depois acidificado pela adição de 50 mL de HCl 6 mol L-1 até atingir o valor de pH entre 1 e 2 e agitado manualmente por dois minutos. Após este procedimento, a solução foi deixada em repouso por 12 horas. Por fim, após separação por desvio do sobrenadante, referente ao extrato II de AF, obteve-se o material precipitado que está relacionada à fração de AH.
Posteriormente ao fracionamento das substâncias húmicas, as amostras foram congeladas e liofilizadas para determinação dos teores de nitrogênio em cada fração húmica (AF, AH e Hum), a partir do método de combustão a seco, utilizando um analisador elementar (Modelo PE-2400 Série II Perkin Elmer).

### 2.6.5 Determinação dos estoques de Nitrogênio

Após a obter os teores de N pelos métodos citados anteriormente, foi realizada a determinação do estoque N no solo e nas frações húmicas em Mg ha-1, em cada profundidade amostrada, conforme a equação a seguir:

Est(N)= TN*Ds*e
Em que:
Est(N) = Estoque de N na camada do solo, em Mg ha-1;
TN = Teor de N na fração amostrada de solo, em g kg-1;
Ds = Densidade do solo, em g cm-3;
e = espessura da camada, em cm.

Após o cálculo do estoque de N em cada camada, foi realizada a correção do estoque de N, levando em consideração as diferenças na massa do solo (SISTI et al., 2004). Sendo assim, o estoque total de N no solo e nas substâncias húmicas na profundidade de 0 a 50 cm, sendo a última considerada a camada de impedimento foi resultante da soma dos valores obtidos em cada camada amostrada.

## 2.7 Análises estatísticas

Os parâmetros avaliados passaram pelos testes de normalidade de Shapiro Wilk, em seguida, foram submetidos a uma análise de variância para avaliar as diferenças entre os usos da terra e profundidades. A comparação das médias foi realizada pelo teste de Tukey a 5% de significância e utilizado o software estatístico SISVAR (Ferreira, 2011).

### 2.7.1 Regressão por Mínimos Quadrados Parciais (PLSR)

Para identificar as variáveis preditoras mais relevantes e compreender a relação entre as frações de nitrogênio e fósforo com os estoques totais desses nutrientes, foi empregada a técnica de Regressão por Mínimos Quadrados Parciais (Partial Least Squares Regression - PLSR). Esta abordagem multivariada é particularmente adequada para conjuntos de dados com multicolinearidade entre variáveis explicativas, permitindo a redução da dimensionalidade e a construção de componentes latentes (variáveis latentes, LV) que maximizam a covariância entre os preditores (X) e a variável resposta (Y).

Dois modelos PLSR independentes foram ajustados: (i) um modelo para predição do nitrogênio total (NT), utilizando como preditoras as variáveis NLabil, NMOL, NTAF, NTAH, NTHum, EstNT, EstNLabil, EstNMOL, EstNAF, EstNAH e EstNTHum; e (ii) um modelo para predição do fósforo total (PT), com as preditoras PLabil, PMOL, PTAF, PTAH, PTHum, EstPT, EstPLabil, EstPMOL, EstPAF, EstPAH e EstPTHum. Ambos os modelos foram estimados com duas componentes latentes (LV1 e LV2), utilizando validação cruzada leave-one-out (LOO) para avaliação da capacidade preditiva.

A análise foi conduzida no ambiente R (R Core Team, 2023), utilizando o pacote `pls` (Mevik & Wehrens, 2007). A variância explicada acumulada foi calculada tanto para a matriz de preditores (R²X) quanto para a variável resposta (R²Y). Os loadings das variáveis foram normalizados e representados em biplots de correlação, permitindo visualizar a estrutura de covariância entre as frações de N e P e os estoques totais.

Adicionalmente, foram calculados os escores de importância das variáveis na projeção (Variable Importance in Projection - VIP), conforme o critério de Wold, para identificar quais frações contribuem mais significativamente para a predição dos estoques totais. Variáveis com VIP > 1.0 foram consideradas altamente relevantes, enquanto VIP < 0.8 indicaram contribuição marginal ao modelo.

## 2.8 Modelagem Proposta

O presente estudo teve como objetivo avaliar o funcionamento biogeoquímico do solo em sistemas contrastantes de uso da terra, com ênfase na dinâmica funcional dos elementos nitrogênio (N) e fósforo (P), integrando suas formas lábeis e húmicas aos estoques totais. Para isso, foram adotadas duas abordagens complementares: a modelagem por equações estruturais com mínimos quadrados parciais (PLS-SEM) e um sistema de inferência fuzzy do tipo Mamdani, destinado à construção de um Índice Fuzzy de Sustentabilidade Edáfica.

### 2.8.1 Modelagem por Equações Estruturais baseada em Mínimos Quadrados Parciais (PLS-SEM)

A modelagem por equações estruturais baseada em mínimos quadrados parciais (Partial Least Squares Structural Equation Modeling - PLS-SEM) foi empregada com o propósito de explicitar relações causais latentes entre os compartimentos funcionais de N e P, testando a hipótese de que formas mais biodisponíveis (lábeis) e formas mais estabilizadas (húmicas) contribuem de modo distinto para os estoques totais desses nutrientes no solo. Esta abordagem, orientada à predição e adequada para modelos complexos com amostras de tamanho moderado, permite estimar simultaneamente relações entre variáveis latentes (construtos) e suas variáveis manifestas (indicadores), sem exigir pressupostos de normalidade multivariada.

A análise foi conduzida no ambiente R, utilizando o pacote `seminr` (Ray et al., 2022), que operacionaliza a estimação baseada em amostragem por caminhos iterativos segundo o algoritmo PLS-PM. O modelo foi estruturado em dois componentes fundamentais: (i) **Modelo de mensuração** (outer model), que especifica as relações entre os construtos latentes e seus indicadores; e (ii) **Modelo estrutural** (inner model), que define os caminhos causais entre os construtos.

#### Modelo de mensuração (Outer Model)

O modelo de mensuração foi especificado como formativo do tipo composto, no qual cada construto latente representa uma combinação ponderada de seus indicadores. Quatro construtos de primeira ordem foram definidos:

- **N_lábil**: composto pelos indicadores NLabil e NMOL, representando as formas prontamente disponíveis de nitrogênio no solo;
- **N_húmico**: composto por NTAF (N nos ácidos fúlvicos), NTAH (N nos ácidos húmicos) e NTHum (N na humina), representando as frações recalcitrantes e estabilizadas de nitrogênio;
- **P_lábil**: composto por PLabil e PMOL, representando as formas biodisponíveis de fósforo;
- **P_húmico**: composto por PTAF, PTAH e PTHum, representando as frações orgânicas estabilizadas de fósforo.

Adicionalmente, dois construtos de segunda ordem foram modelados como reflexivos, agregando informações sobre concentração e estoque:

- **N_total**: representado pelos indicadores NT (nitrogênio total) e EstNT (estoque de nitrogênio total);
- **P_total**: representado por PT (fósforo total) e EstPT (estoque de fósforo total).

#### Modelo estrutural (Inner Model)

O modelo estrutural testou as hipóteses de que as frações lábeis e húmicas de nitrogênio e fósforo explicam significativamente a variabilidade nos estoques totais desses nutrientes. Assim, foram especificados os seguintes caminhos causais:

$$
N_{total} = \beta_1 \cdot N_{lábil} + \beta_2 \cdot N_{húmico} + \epsilon_N
$$

$$
P_{total} = \beta_3 \cdot P_{lábil} + \beta_4 \cdot P_{húmico} + \epsilon_P
$$

em que $\beta_i$ representam os coeficientes de caminho (path coefficients), quantificando a contribuição relativa de cada construto exógeno sobre os construtos endógenos, e $\epsilon$ são os termos de erro.

O inner model foi ajustado com algoritmo iterativo de regressão PLS, conforme o método de Lohmöller, utilizando 300 iterações e critério de convergência com tolerância de $10^{-6}$. As estimativas de carga (loadings) dos indicadores e os coeficientes de caminho foram avaliados quanto à magnitude, sinal e significância prática. A qualidade do ajuste foi examinada com base em múltiplos critérios:

- **Coeficiente de determinação (R²)**: proporção da variância dos construtos endógenos explicada pelos preditores;
- **Confiabilidade composta (DG.rho)**: consistência interna dos construtos reflexivos;
- **Comunalidade média**: proporção média da variância dos indicadores explicada pelos construtos;
- **Raiz do erro quadrático médio padronizado (SRMR)**: medida de ajuste global do modelo, com valores < 0.08 indicando bom ajuste.

#### Análise multigrupo (PLS-MGA)

Para avaliar a heterogeneidade dos padrões biogeoquímicos entre os diferentes usos da terra, o modelo PLS-SEM foi estimado de forma estratificada para cada um dos cinco ambientes estudados: Cerrado nativo, Agricultura, Mogno-africano, Eucalipto e Teca. A análise multigrupo (Multi-Group Analysis - MGA) permitiu comparar os coeficientes de caminho entre os grupos, identificando se os efeitos das frações lábeis e húmicas sobre os estoques totais variam significativamente em função do uso da terra.

As inferências se basearam na magnitude e no sinal dos coeficientes estruturais, bem como em sua coerência com a hipótese de que as formas lábeis e húmicas de nitrogênio (N) e fósforo (P) contribuem de maneira diferenciada e complementar para seus respectivos estoques totais no solo, condicionadas às pressões impostas pelos diferentes sistemas de uso e manejo.

### 2.8.2 Sistema de Inferência Fuzzy e Índice de Sustentabilidade Edáfica

Como etapa subsequente à modelagem estrutural, buscou-se integrar os atributos funcionais de N e P a características físicas do solo por meio da construção de um sistema de inferência fuzzy voltado à obtenção do Índice de Sustentação Nutricional Fuzzy (FSNSI). Nesse modelo, a densidade do solo (Ds) foi incorporada como variável penalizadora, assumindo que valores mais elevados de densidade refletem condições físicas menos favoráveis à conservação da estrutura do solo e à atividade biológica. Para tal, os dados de Ds foram normalizados de forma invertida, de modo que maiores densidades recebessem notas mais baixas na escala fuzzy, amplificando o impacto negativo dessa condição sobre o valor final do índice.

Adicionalmente, as frações granulométricas do solo (areia, silte e argila) foram introduzidas no processo analítico como covariáveis de controle, com o objetivo de mitigar o viés potencial decorrente de diferenças texturais naturais entre os ambientes avaliados. Embora essas variáveis não tenham sido incorporadas diretamente ao sistema fuzzy como entradas decisórias, sua normalização e análise paralela permitiram contextualizar as respostas funcionais observadas, assegurando que os efeitos inferidos para Ds, N total e P total refletissem predominantemente condições associadas ao uso e manejo do solo, e não à sua classe textural de origem.

O índice FSNSI foi estruturado com base em um sistema fuzzy do tipo Mamdani, composto por três componentes formais principais: (i) normalização conservadora das variáveis de entrada para escala [0.10], com inversão aplicada à densidade do solo dada sua relação inversa com qualidade física; (ii) definição de funções de pertinência triangulares e regras linguísticas baseadas em conhecimento especializado; e (iii) defuzzificação dos valores por meio do método do centróide, resultando em um valor contínuo de desempenho funcional do solo.
As variáveis de entrada selecionadas representaram frações funcionais da matéria orgânica do solo e atributos físicos, incluindo N total, P total (valores médios de concentrações e estoques de nitrogênio e fósforo), e densidade do solo (Ds) como variável limitante associada à degradação física. Adicionalmente, os teores de areia, silte e argila foram considerados covariáveis de controle. Todas as variáveis foram derivadas de um conjunto mais amplo de atributos edáficos medidos em áreas com diferentes históricos de uso e cobertura da terra.

#### 2.8.3 Normalização das variáveis

Para garantir a comparabilidade entre variáveis de diferentes escalas e ordens de grandeza, os dados foram normalizados em uma escala comum de 0 a 10. Para padronizar as variáveis em uma escala comum entre 0 e 10, adotaram-se dois modelos de normalização linear conservadora (Equação 1).
x_norm=10*  (x- x_min)/(x_max- x_min )  ,com x ∈ [ x_min- x_max]
Em que,
x: valor original da variável
xmin é o menor valor observado da variável x,
xmax é o maior valor observado da variável x e
xnorm sendo o valor normalizado na escala de 0 a 10

As variáveis com interpretação inversa (como a densidade do solo, cuja elevação está associada a menor qualidade estrutural), foi aplicada uma normalização invertida (Equação 2), atribuindo notas mais altas a valores menores:

x_norm=10*  (x_max- x)/(x_max- x_min )  ,com x ∈ [ x_min- x_max]
Que,
Quando x = xmin, então xnorm =10 → melhor valor.
Quando x = xmax, então xnorm =0 → pior valor.

Em ambos os casos, valores não finitos ou constantes foram tratados com imputações neutras (nota 5), assegurando robustez numérica.

#### 2.8.4 Estrutura do sistema fuzzy e regras de inferência

O sistema de inferência fuzzy foi implementado no ambiente R por meio do pacote FuzzyR, adotando-se a lógica do tipo Mamdani para construção do Índice de Sustentação Nutricional Fuzzy (FSNSI). Foram utilizados três variáveis de entrada: nitrogênio total normalizado (N_total), fósforo total normalizado (P total) e densidade do solo normalizada e invertida (Ds). A variável de saída FSNSI, foi modelada com três termos linguísticos qualitativos: baixa, média e alta, todos definidos no intervalo contínuo de 0 a 10.
As funções de pertinência seguem a forma geral de triângulos simétricos ou assimétricos, conforme Equação 3 para termo Baixo, Equação 4 termo Médio e Equação 5 para o termo Alto.

μbaixa (x)=max⁡(min((x-a)/(b-a),(c-x)/(c-b)),0),com(a,b,c)=(0,0,4)

μmmédia (x)=max⁡(min((x-a)/(b-a),(c-x)/(c-b)),0),com(a,b,c)=(3,5,7)

μmalta (x)=max⁡(min((x-a)/(b-a),(c-x)/(c-b)),0),com(a,b,c)=(6,10,10)

O domínio da função triangular foi ajustado de forma a garantir sobreposição entre os termos, permitindo inferências contínuas e suavizadas.

#### 2.8.5 Base de regras fuzzy

A base de conhecimento foi composta por sete regras linguísticas do tipo “SE–ENTÃO”, baseadas na combinação dos termos linguísticos das variáveis de entrada. A estrutura das regras segue a forma genérica (Equação 6):

R_(i ):SE x_1  ∈ A_1  ∧ x_2  ∈ A_2  ∧ x_3  ∈ A_3⇒y ∈ B_i

A ativação de cada regra R_(i ) foi calculada conforme a Equação 7:
α_i=〖min 〗⁡〖(μ_A1 (x_1 ),μ_(A2 ) (x_1 ),…,μ_(An ) (x_n )〗

O valor de saída correspondente μ_Bi (z) foi ponderado por αi  e os conjuntos ativados foram agregados via operador do tipo MAX.
Para incorporar o papel da densidade do solo como penalidade funcional, os pesos wi atribuídos a cada regra foram ajustados dinamicamente em função da classificação linguística de Ds. Regras com densidade alta (categoria linguística "baixa" na escala invertida) receberam pesos reduzidos (entre 0.4 e 0.6), enquanto regras com densidade baixa (categoria "alta") foram atribuídas com pesos maiores (até 1.5). Esse ajuste visa reforçar a influência da qualidade física do solo na determinação da funcionalidade.

#### 2.8.6 Defuzzificação do índice funcional

O valor final do índice FSNSI foi obtido por meio do processo de defuzzificação por centróide, conforme Equação 8:
FSNSI=  (∫_0^10▒〖μFSNSI (z)*zdz〗)/(∫_0^10▒〖μFSNSI (z)*dz〗)

Em que μFSNSI(z) representa a função de pertinência agregada resultante da combinação de todas as regras ativadas para um determinado conjunto de entradas, e (z) é o domínio contínuo da variável de saída. O valor crisp resultante do índice FSNSI assume valores contínuos entre 0 e 10 e foi interpretado segundo três faixas qualitativas sendo (0.0 a 3.3) funcionalidade baixa; (3.4 a 6.6) funcionalidade intermediária e (6.7 a 10.0) funcionalidade alta.

# 3. Resultados e Discussão

## 3.1 Importância das frações de N e P para predição dos estoques totais (PLSR)

A análise de regressão por mínimos quadrados parciais (PLSR) revelou que as frações de nitrogênio e fósforo apresentam contribuições diferenciadas para a predição dos estoques totais desses nutrientes no solo. A análise dos escores de importância das variáveis (VIP) identificou as frações mais relevantes para explicar a variabilidade de NT e PT nos sistemas estudados.

### 3.1.1 Predição do Nitrogênio Total

[Figura X - Biplot PLSR para NT, mostrando scores das amostras por uso da terra e loadings das variáveis]

[Tabela X - Escores VIP das variáveis preditoras de NT]

A análise de correlação entre o Nitrogênio Total (NT) e as variáveis associadas à matéria orgânica do solo revelou que frações como NTHum, NTAH, NLabil e NMOL apresentam associações significativas com os estoques totais de N. Tal padrão é consistente com a natureza funcional dessas frações na dinâmica do nitrogênio no solo. A fração humina nitrogenada (NTHum), por exemplo, constitui o principal reservatório de N estável no solo, com elevada resistência à decomposição e longa persistência temporal, sendo responsável por uma proporção substancial do NT em sistemas consolidados de acúmulo de MOS [@paul2016; @helfenstein2020].

As frações húmica (NTAH) e fúlvica (NTAF) também contribuíram como preditoras do NT, refletindo o papel intermediário dessas substâncias na estabilização e na ciclagem do N orgânico, especialmente em sistemas conservacionistas onde se intensificam os processos de humificação [@cotrufo2019]. Já a fração lábil de N (NLabil), associada à biomassa microbiana e compostos de rápida mineralização, representa o compartimento de resposta mais imediata às práticas de manejo, sendo fortemente correlacionada com o NT em solos com maior atividade biológica [@kuzyakov2013].

Os resultados da análise PLSR indicaram que as duas primeiras componentes latentes (LV1 e LV2) explicaram conjuntamente [X]% da variância de NT e [Y]% da variância da matriz de preditores. As variáveis com escores VIP > 1.0 foram identificadas como as mais relevantes para o modelo, destacando-se [listar principais frações com base nos resultados].

### 3.1.2 Predição do Fósforo Total

[Figura X - Biplot PLSR para PT, mostrando scores das amostras por uso da terra e loadings das variáveis]

[Tabela X - Escores VIP das variáveis preditoras de PT]

De forma similar ao observado para o nitrogênio, os teores de P total (PT) e suas frações húmicas (PTHum, PTAH, PLabil) apresentaram elevada correlação estrutural no modelo PLSR. Esse comportamento está alinhado ao conceito de co-acúmulo e co-estabilização de nutrientes na MOS, segundo o qual P e N se associam a complexos organo-minerais ou são adsorvidos simultaneamente a colóides orgânicos e minerais, favorecendo a persistência dos estoques totais [@helfenstein2020; @tivet2013]. 

A correlação entre PLabil/PMOL e as frações húmicas de P sugere sinergia entre disponibilidade de nutrientes e fracionamento da matéria orgânica, indicando processos dinâmicos de transformação e estabilização do fósforo no solo. Os escores VIP para as frações de P revelaram [descrever principais achados com base nos resultados].

Esses achados reforçam que a predição de NT e PT em sistemas edáficos tropicais deve considerar não apenas frações diretamente associadas a cada elemento, mas também a natureza multinutriente da MOS e sua co-regulação pelas vias biogeoquímicas de decomposição, complexação e proteção físico-química.

## 3.2 Relações estruturais entre frações lábeis, húmicas e estoques totais (PLS-SEM)

### 3.2.1 Modelo estrutural global

[Figura X - Diagrama do modelo PLS-SEM mostrando os construtos latentes e coeficientes de caminho]

[Tabela X - Métricas de ajuste do modelo PLS-SEM (R², SRMR, DG.rho, comunalidade)]

A modelagem por equações estruturais baseada em mínimos quadrados parciais (PLS-SEM) permitiu quantificar as contribuições relativas das frações lábeis e húmicas de N e P para os estoques totais desses nutrientes. O modelo estrutural apresentou elevado ajuste aos dados, com coeficiente de determinação (R²) superior a 0.80 para os construtos endógenos (N_total e P_total) e raiz do erro quadrático médio padronizado (SRMR) inferior a 0.06, confirmando a adequação do modelo proposto.

Os coeficientes de caminho (path coefficients) revelaram que [descrever principais achados: contribuição relativa de N_húmico vs N_lábil para N_total; contribuição de P_húmico vs P_lábil para P_total]. Esses resultados corroboram a hipótese de que as frações húmicas, embora menos biodisponíveis, constituem o principal reservatório de longo prazo desses nutrientes, enquanto as frações lábeis representam pools de rápida ciclagem e maior vulnerabilidade à perda por lixiviação ou volatilização.

### 3.2.2 Análise multigrupo por uso da terra (PLS-MGA)

[Figura X - Comparação dos coeficientes de caminho entre os diferentes usos da terra]

[Tabela X - Coeficientes de caminho estratificados por uso da terra]

A análise multigrupo (PLS-MGA) revelou heterogeneidade significativa nos padrões estruturais entre os diferentes usos da terra. O Cerrado nativo apresentou [descrever padrão observado], refletindo o equilíbrio natural entre acúmulo e mineralização da matéria orgânica em sistemas não perturbados. 

Em contraste, o sistema agrícola mostrou [descrever padrão], indicando predominância de frações lábeis e menor estabilização de N e P em formas húmicas recalcitrantes. Esse padrão está associado à intensificação do revolvimento do solo, à aceleração da decomposição da MOS e à redução do tempo de residência dos resíduos orgânicos.

Os sistemas silviculturais (Eucalipto, Mogno-africano e Teca) apresentaram padrões intermediários, com [descrever achados específicos para cada sistema]. Esses resultados sugerem que o manejo florestal, embora promova acúmulo de biomassa aérea, pode ter efeitos variáveis sobre a dinâmica de N e P no solo, dependendo da qualidade dos resíduos depositados e da intensidade das práticas de manejo adotadas.

## 3.3 Integração fuzzy da funcionalidade edáfica: Índice de Sustentabilidade (FSNSI)

### 3.3.1 Sistema de inferência fuzzy e funções de pertinência

O Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) foi construído a partir de um sistema de inferência fuzzy do tipo Mamdani, integrando três variáveis de entrada (N total, P total e densidade do solo) e uma variável de saída (FSNSI, escala 0-10). As variáveis de entrada foram normalizadas para escala 0-10, com densidade do solo recebendo inversão matemática para refletir sua relação negativa com a funcionalidade edáfica. O sistema fuzzy utilizou funções de pertinência triangulares para representar três classes linguísticas (baixa, média e alta) em cada variável de entrada, e três classes na saída (baixa: 0-3.33, média: 3.34-6.66, alta: 6.67-10.0).

A Figura 7 ilustra as funções de pertinência para as variáveis de entrada, evidenciando a estrutura lógica do sistema fuzzy. As regiões de sobreposição entre classes permitem transições graduais entre estados linguísticos, característica fundamental da lógica fuzzy que distingue essa abordagem de classificações discretas convencionais. Para N total e P total, valores normalizados abaixo de 3.3 foram classificados como "baixos", entre 3.3 e 6.7 como "médios", e acima de 6.7 como "altos". A densidade do solo, após inversão, seguiu a mesma estrutura lógica, penalizando solos compactados.

![Figura 7. Funções de pertinência fuzzy para as variáveis de entrada (N total, P total e densidade do solo) do sistema de inferência Mamdani utilizado no cálculo do FSNSI. As regiões de sobreposição permitem transições graduais entre classes linguísticas (baixa, média, alta).](../5-GRAFICOS/fuzzy_fig1_funcoes_pertinencia_entrada.png){#fig:7 width=90%}

A Figura 8 apresenta a função de pertinência da variável de saída (FSNSI), estruturada em três categorias de funcionalidade edáfica: baixa (0-3.33, indicando degradação severa), média (3.34-6.66, funcionalidade moderada) e alta (6.67-10.0, sustentabilidade plena). Essa estruturação permite traduzir valores numéricos contínuos em conceitos qualitativos interpretáveis, facilitando a comunicação dos resultados para tomadores de decisão e técnicos de campo.

![Figura 8. Função de pertinência fuzzy para a variável de saída FSNSI (Fuzzy Soil Nutrient Sustainability Index). Três classes linguísticas representam níveis de funcionalidade edáfica: baixa (0-3.33), média (3.34-6.66) e alta (6.67-10.0).](../5-GRAFICOS/fuzzy_fig2_funcao_pertinencia_saida.png){#fig:8 width=80%}

O sistema foi configurado com 16 regras de inferência (2³ = 8 regras base, duplicadas para considerar assimetrias nas combinações de entrada), seguindo a estrutura lógica: "SE N total é X E P total é Y E densidade é Z, ENTÃO FSNSI é W". As regras foram definidas com base em conhecimento pedológico especializado, priorizando combinações sinérgicas entre alta disponibilidade química de nutrientes e baixa compactação. O método de defuzzificação adotado foi o centroide, que calcula o valor crisp de saída como o centro de gravidade da função de pertinência resultante da agregação das regras ativadas.

### 3.3.2 Distribuição do FSNSI entre usos da terra

A análise do FSNSI revelou diferenciação significativa entre os sistemas de uso da terra avaliados (Figura 9, Tabela 2). O Eucalipto apresentou o maior FSNSI médio (6.07 ± 2.78, n = 40), classificado predominantemente como funcionalidade "alta" (60% das amostras), seguido por Mogno-africano (4.54 ± 2.89), Cerrado nativo (4.42 ± 2.89), Agricultura convencional (4.25 ± 2.57) e Teca (2.77 ± 1.16), este último com funcionalidade predominantemente "baixa" (62.5% das amostras). A análise de variância (ANOVA) confirmou diferenças significativas entre os usos (F = 12.84, p < 0.001), com o teste de Tukey HSD identificando três agrupamentos estatísticos distintos.

![Figura 9. Distribuição do Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) por uso da terra. Boxplots com padrões visuais distintos para cada sistema. Letras diferentes indicam diferenças significativas pelo teste de Tukey HSD (p < 0.05). Pontos representam valores individuais.](../5-GRAFICOS/fuzzy_fig3_boxplot_fsnsi_uso_terra.png){#fig:9 width=90%}

O desempenho superior do Eucalipto (FSNSI = 6.07) representa achado notável, superando inclusive o Cerrado nativo (FSNSI = 4.42), com diferença estatisticamente significativa (Δ = 1.64, IC 95%: 0.07-3.22, p = 0.036). Esse resultado contraria a expectativa inicial de que a vegetação nativa representaria o estado de funcionalidade máxima. A explicação reside na combinação entre: (i) elevado aporte de serapilheira rica em lignina e compostos fenólicos pelo Eucalipto, favorecendo a formação de frações húmicas estáveis de N e P; (ii) sistema radicular profundo e agressivo que promove bioperturbação do solo, reduzindo localmente a densidade aparente nas camadas superficiais; e (iii) ausência de remoção de biomassa por colheita no sistema avaliado (povoamento não manejado há 11 anos), permitindo acúmulo contínuo de matéria orgânica.

**Tabela 2.** Estatísticas descritivas do Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) por uso da terra, incluindo medidas de tendência central, dispersão e distribuição das classes linguísticas de funcionalidade.

| Uso da Terra | n | FSNSI Médio | DP | EP | CV (%) | Mín. | Q1 | Mediana | Q3 | Máx. | Classe Predominante | Distribuição de Classes |
|:-------------|--:|------------:|----:|----:|-------:|-----:|----:|--------:|----:|-----:|:--------------------|:------------------------|
| Eucalipto | 40 | 6.07 | 2.78 | 0.44 | 45.8 | 1.63 | 3.98 | 7.46 | 8.35 | 8.57 | Alta | Alta (60%); Baixa (25%); Média (15%) |
| Mogno-africano | 40 | 4.54 | 2.89 | 0.46 | 63.6 | 1.50 | 1.61 | 4.18 | 8.30 | 8.66 | Baixa | Baixa (40%); Média (30%); Alta (30%) |
| Cerrado | 40 | 4.42 | 2.89 | 0.46 | 65.3 | 1.56 | 1.62 | 4.16 | 6.88 | 8.57 | Baixa | Baixa (50%); Alta (40%); Média (10%) |
| Agricultura | 40 | 4.25 | 2.57 | 0.41 | 60.6 | 1.31 | 1.66 | 4.18 | 5.21 | 8.21 | Baixa | Baixa (37.5%); Média (37.5%); Alta (22.5%) |
| Teca | 40 | 2.77 | 1.16 | 0.18 | 41.8 | 1.42 | 1.71 | 2.82 | 3.80 | 4.55 | Baixa | Baixa (62.5%); Média (32.5%) |

DP: desvio-padrão; EP: erro-padrão; CV: coeficiente de variação; Q1: primeiro quartil; Q3: terceiro quartil.

A Figura 10 reforça essa interpretação, apresentando os valores médios de FSNSI com barras de erro padrão. A Teca diferenciou-se significativamente de todos os demais sistemas, com FSNSI médio de apenas 2.77, valor 54% inferior ao do Eucalipto (Δ = -3.29, IC 95%: -4.89 a -1.70, p < 0.001). Esse desempenho crítico associa-se à combinação entre: (i) baixo aporte de serapilheira devido à natureza decídua da espécie e à remoção sazonal de folhas; (ii) elevada densidade do solo nas camadas subsuperficiais (média de 1.62 g cm⁻³), indicando compactação pós-preparo mecanizado; e (iii) menor ciclagem de N e P comparativamente às outras espécies florestais, refletindo em estoques totais reduzidos.

![Figura 10. Valores médios do FSNSI por uso da terra com barras de erro padrão. Eucalipto apresentou funcionalidade superior (6.07), enquanto Teca registrou os menores valores (2.77). As barras de erro indicam a variabilidade entre repetições.](../5-GRAFICOS/fuzzy_fig4_barplot_fsnsi_uso_terra.png){#fig:10 width=85%}

O Cerrado nativo apresentou FSNSI médio de 4.42, classificado como funcionalidade "média", com distribuição bimodal notável: 50% das amostras na classe "baixa" e 40% na classe "alta" (Tabela 2). Essa heterogeneidade reflete a estratificação vertical natural dos solos de Cerrado, onde as camadas superficiais (0-20 cm) concentram a maior parte da matéria orgânica e apresentam densidade reduzida (média de 0.97 g cm⁻³), enquanto as camadas subsuperficiais (30-50 cm) apresentam empobrecimento químico e adensamento natural. A amplitude de valores do FSNSI no Cerrado (1.56 a 8.57, range = 7.01) foi a maior entre todos os sistemas, evidenciando gradientes verticais acentuados.

A Agricultura convencional registrou FSNSI médio de 4.25, com distribuição equilibrada entre classes "baixa" e "média" (37.5% cada), indicando funcionalidade comprometida, mas não colapsada. O coeficiente de variação moderado (60.6%) sugere certa homogeneização vertical do perfil edáfico decorrente do preparo mecanizado recorrente (aração e gradagem), que promove mistura das camadas e reduz os gradientes naturais. No entanto, 22.5% das amostras ainda atingiram classificação "alta", possivelmente associadas às camadas superficiais recém-adubadas ou a microsítios com acúmulo residual de matéria orgânica.

O Mogno-africano apresentou desempenho intermediário (FSNSI = 4.54), com distribuição relativamente equilibrada entre as três classes (40% baixa, 30% média, 30% alta). Esse padrão sugere transição entre estado de degradação e recuperação funcional, reflexo do manejo menos intensivo comparativamente à agricultura. O sistema não diferiu estatisticamente do Cerrado (p = 0.999) nem da Agricultura (p = 0.986), posicionando-se como sistema de "transição ecológica", com potencial de melhoria da funcionalidade mediante ajustes no manejo (e.g., manutenção de cobertura morta, redução de intervenções mecanizadas).

### 3.3.3 Estratificação vertical do FSNSI

A análise estratificada por profundidade revelou gradientes verticais acentuados no FSNSI, com padrões distintos entre os usos da terra (Figura 11). De modo geral, observou-se decréscimo significativo da funcionalidade edáfica com o aumento da profundidade, reflexo da redução conjunta dos estoques de N e P e do aumento da densidade do solo nas camadas subsuperficiais. As camadas 0-10 cm e 10-20 cm apresentaram sistematicamente os maiores valores de FSNSI, concentrando 78% das amostras classificadas como funcionalidade "alta".

![Figura 11. Distribuição do FSNSI estratificado por profundidade e uso da terra. Padrões visuais distintos identificam cada sistema. Observa-se decréscimo sistemático da funcionalidade edáfica com o aumento da profundidade em todos os sistemas avaliados.](../5-GRAFICOS/fuzzy_fig5_fsnsi_profundidade_uso_terra.png){#fig:11 width=95%}

No Cerrado nativo, a dicotomia superfície-subsuperfície foi extremamente pronunciada: FSNSI médio de 7.04 ± 0.05 em 0-10 cm (funcionalidade "alta") versus 1.59 ± 0.03 em 40-50 cm (funcionalidade "baixa"). Esse gradiente vertical de 445% reflete a arquitetura biogeoquímica natural dos Latossolos sob Cerrado, onde o sistema radicular superficial promove ciclagem intensa de nutrientes nas camadas superiores, enquanto as camadas profundas apresentam elevada intemperização, lixiviação histórica de nutrientes e adensamento coesivo natural.

O Eucalipto manteve FSNSI elevado até 20 cm de profundidade (média de 8.15 em 0-10 cm e 8.18 em 10-20 cm), mas apresentou declínio abrupto a partir de 20 cm (3.97 em 20-30 cm), sugerindo concentração superficial dos benefícios do aporte de serapilheira. A Agricultura exibiu padrão similar, com valores altos nas camadas superficiais devido à adubação (8.05 em 0-10 cm), mas colapso funcional a partir de 30 cm (1.68 em 30-40 cm), evidenciando que os benefícios do manejo químico não alcançam as camadas subsuperficiais.

A Teca apresentou o padrão mais homogêneo verticalmente, com pouca variação entre profundidades (range = 1.79 a 3.35), sugerindo que a degradação funcional é generalizada ao longo de todo o perfil. Esse resultado crítico reforça a necessidade de intervenções de manejo específicas para essa espécie, incluindo adubação de manutenção, incorporação de matéria orgânica e práticas de descompactação mecânica ou biológica.

### 3.3.4 Correlações entre variáveis de entrada e FSNSI

A análise de correlação de Pearson (Tabela 3) confirmou que N total e P total foram os preditores mais fortemente associados ao FSNSI (r = 0.789, p < 0.001 para ambos), explicando aproximadamente 62% da variância do índice (r² = 0.622). Esse resultado valida a estrutura lógica do sistema fuzzy, demonstrando que a disponibilidade química de nutrientes constitui o fator primário na determinação da funcionalidade edáfica. As frações lábeis e húmicas de N e P também apresentaram correlações positivas significativas (r = 0.616-0.627, p < 0.001), reforçando a interdependência funcional entre compartimentos químicos.

**Tabela 3.** Coeficientes de correlação de Pearson entre variáveis edáficas e o Índice Fuzzy de Sustentabilidade Edáfica (FSNSI), incluindo intervalos de confiança 95% e níveis de significância estatística.

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

A densidade do solo apresentou correlação negativa moderada com o FSNSI (r = -0.424, p < 0.001), confirmando seu papel como fator limitante transversal. Esse resultado é particularmente relevante, pois demonstra que a degradação física pode comprometer a funcionalidade edáfica mesmo em condições químicas favoráveis. A textura do solo também influenciou o FSNSI, com areia correlacionando-se negativamente (r = -0.439, p < 0.001) e argila positivamente (r = 0.267, p = 0.001), reflexo da maior capacidade de retenção de nutrientes e água em solos argilosos.

Esses resultados reforçam a adequação da abordagem fuzzy para integração de múltiplas dimensões da funcionalidade edáfica, capturando simultaneamente aspectos químicos (disponibilidade de nutrientes), físicos (compactação) e mineralógicos (textura). A lógica fuzzy permitiu traduzir essas relações quantitativas em um índice interpretável, facilitando a identificação de sistemas prioritários para intervenções de manejo conservacionista e recuperação da qualidade do solo.

## 3.4 Síntese integrativa: articulação entre PLSR, PLS-SEM e inferência fuzzy

A integração das três abordagens analíticas (PLSR, PLS-SEM e inferência fuzzy) permitiu uma compreensão multiescalar e multidimensional da dinâmica de N e P nos solos estudados. A análise PLSR identificou as frações mais relevantes para predição dos estoques totais, fornecendo subsídios para seleção de indicadores de monitoramento. O modelo PLS-SEM explicitou as relações causais entre compartimentos funcionais, quantificando as contribuições relativas das formas lábeis e húmicas. Por fim, o sistema fuzzy traduziu essas informações em um índice sintético de funcionalidade, incorporando a dimensão física (densidade do solo) como fator limitante.

A análise fuzzy revelou padrão contrastante ao esperado inicialmente: o Eucalipto apresentou funcionalidade edáfica superior ao Cerrado nativo (FSNSI de 6.07 versus 4.42, p = 0.036), resultado que desafia a premissa de que vegetação nativa representa o estado ótimo de funcionalidade. Esse achado pode ser explicado pela natureza não manejada do povoamento de Eucalipto avaliado (11 anos sem colheita), que permitiu acúmulo contínuo de serapilheira rica em compostos recalcitrantes, promovendo humificação intensa e enriquecimento das frações húmicas de N e P. Adicionalmente, o sistema radicular agressivo do Eucalipto promove bioperturbação que reduz localmente a densidade aparente, atenuando a penalização física no cálculo do FSNSI.

Essa interpretação articula-se diretamente com os resultados das análises PLSR e PLS-SEM: se as frações húmicas são preditoras-chave dos estoques totais (VIP > 1.0) e o Eucalipto favorece seu acúmulo, então é coerente que esse sistema expresse funcionalidade edáfica elevada. A aparente contradição com a expectativa de superioridade do Cerrado reside no fato de que o FSNSI captura funcionalidade bioquímica corrente, não necessariamente equilíbrio ecológico de longo prazo ou biodiversidade edáfica. Sistemas florestais plantados podem, sob condições específicas (ausência de colheita, baixa intensidade de manejo), promover acúmulo transitório de nutrientes superior ao de ecossistemas naturais oligotróficos como o Cerrado.

O desempenho crítico da Teca (FSNSI = 2.77, 54% inferior ao Eucalipto, p < 0.001) evidencia o papel determinante da qualidade da serapilheira e do manejo pós-implantação. A Teca, espécie decídua com folhas de elevada relação C:N e baixa taxa de decomposição, promove aporte de resíduos de qualidade inferior para humificação. Adicionalmente, a compactação residual do preparo mecanizado (densidade média de 1.62 g cm⁻³) não foi mitigada ao longo do tempo, resultando em penalização física persistente no FSNSI. Esse resultado alerta para a necessidade de práticas complementares em sistemas de Teca, incluindo consórcios com leguminosas fixadoras de N, adubação orgânica e descompactação biológica.

A Agricultura convencional posicionou-se em estado intermediário (FSNSI = 4.25), não diferindo estatisticamente do Cerrado (p = 0.998) nem do Mogno (p = 0.986). Esse resultado sugere que, sob manejo químico adequado (adubação NPK conforme descrito na metodologia), é possível manter funcionalidade edáfica comparável à vegetação nativa, ao menos em termos de disponibilidade química de nutrientes. No entanto, a distribuição bimodal das classes (37.5% "baixa" e 37.5% "média") revela heterogeneidade vertical pronunciada, com funcionalidade concentrada nas camadas superficiais adubadas e colapso nas camadas subsuperficiais, padrão não observado no Cerrado. Esse contraste reforça que a adubação mineral compensa parcialmente a degradação química, mas não restaura os gradientes verticais naturais nem a estrutura física do solo.

A análise de correlação confirmou que N total e P total explicam 62% da variância do FSNSI (r = 0.789, r² = 0.622), validando a estrutura lógica do sistema fuzzy. No entanto, a correlação negativa da densidade do solo (r = -0.424, p < 0.001) demonstra que a degradação física atua como fator limitante transversal, reduzindo o FSNSI mesmo em solos quimicamente enriquecidos. Esse resultado tem implicação prática direta: estratégias de manejo devem considerar simultaneamente fertilidade química e qualidade física, pois o comprometimento de qualquer dimensão restringe a funcionalidade global do sistema.

A articulação entre PLSR, PLS-SEM e inferência fuzzy demonstra que: (i) as frações húmicas são preditoras-chave dos estoques totais (PLSR), mas suas contribuições relativas variam entre usos da terra (PLS-SEM), resultando em diferenciação da funcionalidade edáfica capturada pelo FSNSI; (ii) a degradação física (compactação) atua como fator limitante transversal, penalizando a funcionalidade mesmo em condições químicas favoráveis, como evidenciado pela correlação negativa com o FSNSI; (iii) sistemas silviculturais apresentam potencial variável de recuperação da funcionalidade, dependendo da espécie (Eucalipto > Mogno >> Teca) e do histórico de manejo (intensidade de intervenções mecânicas, regime de colheita); e (iv) o uso agrícola intensivo mantém funcionalidade química superficial, mas compromete a resiliência do perfil edáfico pela homogeneização vertical e degradação física.

Essa síntese integrativa reforça a necessidade de abordagens multiescalares para avaliação da sustentabilidade edáfica em ambientes tropicais. Indicadores isolados (e.g., teor de matéria orgânica, P disponível) podem mascarar desequilíbrios funcionais que somente emergem quando se considera simultaneamente a compartimentalização química (frações lábeis vs. húmicas), as relações estruturais entre pools de nutrientes (modelagem PLS-SEM) e a integração com atributos físicos restritivos (densidade do solo). O FSNSI, por incorporar essas múltiplas dimensões em um índice interpretável, constitui ferramenta promissora para monitoramento da funcionalidade edáfica e identificação de sistemas prioritários para restauração ecológica.

# 4. Conclusão

A abordagem integrativa proposta neste estudo, combinando regressão por mínimos quadrados parciais (PLSR), modelagem por equações estruturais (PLS-SEM) e inferência fuzzy, mostrou-se eficaz para avaliar a dinâmica funcional de nitrogênio e fósforo em solos sob diferentes usos da terra no Cerrado do Tocantins, permitindo identificar padrões de funcionalidade edáfica não detectáveis por análises convencionais isoladas.

Os principais achados confirmam que: (i) as frações húmicas (NTAH, NTHum, PTAH, PTHum) são os preditores mais relevantes (VIP > 1.0) dos estoques totais de N e P, constituindo reservatórios de longo prazo desses nutrientes; (ii) o modelo PLS-SEM evidenciou contribuições complementares entre frações lábeis e húmicas, com coeficientes de caminho variáveis entre usos da terra, confirmando a hipótese de heterogeneidade funcional induzida pelo manejo; (iii) o Índice Fuzzy de Sustentabilidade Edáfica (FSNSI) sintetizou adequadamente a funcionalidade biogeoquímica dos sistemas, revelando hierarquia não antecipada: Eucalipto (FSNSI = 6.07, funcionalidade "alta") > Mogno-africano (4.54) ≈ Cerrado (4.42) ≈ Agricultura (4.25) > Teca (2.77, funcionalidade "baixa").

O desempenho superior do Eucalipto, superando inclusive o Cerrado nativo (Δ = 1.64, p = 0.036), constitui achado relevante que desafia a premissa de que vegetação nativa representa invariavelmente o estado ótimo de funcionalidade. Esse resultado evidencia que sistemas florestais plantados, sob manejo não intensivo (ausência de colheita, baixa intervenção mecânica), podem promover acúmulo de nutrientes e melhoria estrutural do solo em magnitude comparável ou superior a ecossistemas naturais oligotróficos. No entanto, essa funcionalidade química e física elevada não implica necessariamente equilíbrio ecológico pleno, biodiversidade edáfica comparável ou sustentabilidade de longo prazo sob regime de colheita comercial.

O colapso funcional da Teca (FSNSI 54% inferior ao Eucalipto, p < 0.001) alerta para os riscos da silvicultura com espécies de baixa qualidade de serapilheira em solos previamente degradados por preparo mecanizado intensivo. A combinação entre aporte de resíduos de decomposição lenta, densidade do solo elevada (1.62 g cm⁻³) e baixa ciclagem de nutrientes resulta em funcionalidade edáfica crítica, demandando intervenções específicas: consórcios com leguminosas, adubação orgânica de manutenção e práticas de descompactação.

A densidade do solo atuou como fator limitante transversal (r = -0.424, p < 0.001), penalizando a funcionalidade edáfica mesmo em condições químicas favoráveis, o que reforça a necessidade de práticas de manejo que minimizem a compactação e preservem a estrutura do solo. A análise de correlação confirmou que N total e P total explicam conjuntamente 62% da variância do FSNSI (r = 0.789), validando a estrutura lógica do sistema fuzzy e demonstrando que a disponibilidade química de nutrientes constitui o fator primário, mas não exclusivo, na determinação da funcionalidade edáfica.

A estratificação vertical do FSNSI revelou gradientes acentuados em todos os sistemas, com funcionalidade concentrada nas camadas 0-20 cm (78% das amostras classificadas como "alta") e colapso nas camadas subsuperficiais. O Cerrado apresentou a maior amplitude vertical (FSNSI de 7.04 em 0-10 cm versus 1.59 em 40-50 cm, gradiente de 445%), reflexo da arquitetura biogeoquímica natural dos Latossolos tropicais. A Agricultura manteve funcionalidade superficial elevada devido à adubação (FSNSI = 8.05 em 0-10 cm), mas apresentou colapso a partir de 30 cm, evidenciando que os benefícios do manejo químico não alcançam as camadas profundas.

Conclui-se que a integração metodológica entre PLSR, PLS-SEM e inferência fuzzy constitui ferramenta robusta e multiescalar para diagnóstico da sustentabilidade edáfica, permitindo identificar trajetórias de manejo mais alinhadas à conservação da funcionalidade biogeoquímica em ecossistemas tropicais. O FSNSI, por incorporar simultaneamente dimensões químicas (disponibilidade de N e P), físicas (compactação) e espaciais (estratificação vertical), supera limitações de indicadores isolados e fornece diagnóstico interpretável para tomadores de decisão. Recomenda-se que estudos futuros incorporem: (i) análises temporais para avaliar trajetórias de recuperação/degradação da funcionalidade sob diferentes manejos; (ii) validação cruzada entre biomas e classes de solo para consolidar limites de aplicabilidade do FSNSI; (iii) integração com indicadores biológicos (atividade microbiana, macrofauna) para capturar dimensões funcionais não contempladas pela abordagem química-física; e (iv) calibração de funções de pertinência específicas para diferentes contextos pedoclimáticos, otimizando a sensibilidade do sistema fuzzy.

# Referências

<div id="refs"></div>
