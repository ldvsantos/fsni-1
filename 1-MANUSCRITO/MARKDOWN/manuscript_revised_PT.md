---
title: "Impacto da Mudança de Uso da Terra nos Estoques de Nitrogênio e Frações Húmicas em Latossolo do Cerrado Brasileiro"
author: Luiz Diego Vidal Santos
date: "28 de Dezembro de 2025"
bibliography: [referencias_artigo.bib, references_old.bib]
csl: springer-basic-author-date.csl
lang: pt-BR
---

<!-- markdownlint-disable MD025 -->

## Resumo

A conversão de ecossistemas naturais em sistemas agrícolas e silviculturais reconfigura a cinética de estabilização organomineral e, consequentemente, os estoques de nitrogênio e fósforo em Latossolos do Cerrado. Este estudo propõe o Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI) como ferramenta de suporte à decisão que integra capital químico, expresso por estoques de N e P, e restrição física, expressa pela densidade do solo, em uma métrica escalável para a fase de produção em avaliação de sustentabilidade do ciclo de vida. A partição composicional indicou dominância das frações húmicas em relação ao total, com mediana de contribuição húmica de 76,0% para o N e baixa contribuição das frações lábeis, com mediana de 12,18%, sustentando um regime de retenção controlado por reservatórios recalcitrantes. A vegetação nativa apresentou a maior contribuição húmica, com mediana de 82,0%, e a menor fração residual (4,96%), enquanto a agricultura mostrou contribuição húmica reduzida (mediana de 73,0%) e fração residual aumentada (17,15%), sugerindo maior alocação de massa em compartimentos não recuperados pelas extrações operacionais. Os plantios florestais apresentaram mediana de estoque total de nitrogênio por camada de 1,362, aproximadamente 21,2% superior ao Cerrado nativo, mantendo um regime de estabilização dominado por frações húmicas. O FSNSI discriminou os usos da terra (p < 0,001), com médias ajustadas em ordem decrescente de Eucalipto (6,07), Mogno (4,54), Cerrado (4,42), Agricultura (4,25) e Teca (2,77), indicando que o desempenho funcional é máximo quando há aporte orgânico contínuo sem perturbação mecânica recorrente e mínimo onde a impedância bioquímica restringe a ciclagem de nutrientes. Conclui-se que a coestabilização de N e P em frações húmicas, modulada pela integridade física do solo, constitui o mecanismo central que sustenta a funcionalidade nutricional em ambientes tropicais altamente intemperizados, e que o FSNSI fornece uma métrica integrada para orientar intervenções, priorização e monitoramento e avaliação ambiental de rotina em programas de gestão da terra.

**Palavras-chave:** Nitrogênio do solo; Indicador de qualidade do solo; Monitoramento e avaliação ambiental; Frações húmicas; Mudança de uso da terra; Latossolo.

**Destaques**

- A conversão do Cerrado para silvicultura e agricultura alterou o fracionamento húmico do N
- As frações húmicas retiveram 76% do N total em todos os sistemas de uso da terra
- Plantios florestais aumentaram os estoques totais de N em 21% em relação ao Cerrado nativo
- O FSNSI classificou o Eucalipto como melhor e a Teca como pior entre cinco usos da terra
- A coestabilização de N e P em pools húmicos regula a funcionalidade nutricional do solo

# 1. Introdução

Os solos tropicais constituem sistemas biogeoquímicos complexos e dinâmicos nos quais a matéria orgânica do solo (MOS) desempenha papel central na regulação da ciclagem de nutrientes, agregação estrutural e manutenção da fertilidade [@Lavallee2020; @Lal2020]. A conversão de ecossistemas nativos em áreas agrícolas e silviculturais altera a entrada e a qualidade dos resíduos orgânicos, acelera a decomposição e reduz a formação de compostos húmicos estáveis [@Carvalho2023]. Essa transformação diminui os estoques de nitrogênio (N) e fósforo (P), comprometendo a ciclagem de nutrientes e a resiliência do solo [@Silva2024; @Tivet2013].

No bioma Cerrado, um hotspot global de biodiversidade, esses impactos são críticos porque seus solos altamente intemperizados, ácidos e naturalmente pobres em nutrientes dependem da estabilidade das frações húmicas da MOS para manter funções ecológicas e produtivas [@Locatelli2023]. As substâncias húmicas, ácidos húmicos (AH), ácidos fúlvicos (AF) e humina (Hum), atuam como reservatórios de nutrientes que regulam a retenção de água e a formação de agregados estáveis [@Lehmann2015; @Paul2016]. Por meio de adsorção, complexação e imobilização biogênica, essas frações estabilizam N e P, reduzem perdas e promovem a persistência de nutrientes no sistema [@Carvalho2023; @Gerke2022].

Embora a humificação clássica tenha historicamente sustentado interpretações sobre a persistência da MOS, arcabouços contemporâneos enfatizam um continuum de compostos orgânicos e o papel central da associação mineral e da proteção espacial no controle do tempo de residência [@Lehmann2015; @Lavallee2020]. Neste estudo, o fracionamento húmico é utilizado como partição analítica operacional para rastrear vias de estabilização, e não como pressuposto de que as substâncias húmicas isoladamente explicam a persistência. A interpretação mecanística é, portanto, fundamentada pela convergência de evidências do particionamento de frações, da estrutura PLSR e dos coeficientes de caminho PLS-SEM.

Estudos recentes em solos tropicais e altamente intemperizados têm focado crescentemente no acoplamento biogeoquímico entre N e P e sua coestabilização na MOS [@Cao2021; @Gerke2022; @MarinhoJunior2021]. Evidências indicam que esses nutrientes são co-regulados por processos interdependentes de decomposição, humificação e proteção organomineral. Mecanismos como incorporação na biomassa microbiana, competição por sítios de adsorção, formação de complexos com substâncias húmicas e co-oclusão física em microagregados estabilizam N e P, protegendo-os da mineralização rápida e promovendo persistência [@Cao2021; @Gerke2022]. Essas interações indicam que distúrbios no ciclo de um nutriente induzem desequilíbrios estequiométricos que afetam a eficiência de uso do outro, comprometendo a estabilidade da MOS e a sustentabilidade do solo [@MarinhoJunior2021]. Não obstante, a maioria dos estudos ainda trata N e P separadamente, negligenciando suas inter-relações estruturais e funcionais.

Apesar dos avanços na modelagem de processos edáficos, permanece uma lacuna metodológica crítica em relação a indicadores de sustentabilidade que sejam simultaneamente robustos, capazes de lidar com não linearidade e incerteza, e integráveis em arcabouços mais amplos de avaliação de sustentabilidade [@vanLeeuwen2023]. Indicadores tradicionais de fertilidade ou qualidade do solo são frequentemente reducionistas, unidimensionais ou de difícil interpretação fora do domínio da ciência do solo [@Vereecken2018]. Para informar a avaliação de sustentabilidade do ciclo de vida e decisões de cadeia de suprimentos, é necessário desenvolver métricas que traduzam a complexidade do solo em um índice agregado e escalável [@Toth2018].

Avanços recentes na modelagem permitiram a integração de múltiplos atributos edáficos para investigar essas relações. A modelagem de equações estruturais por mínimos quadrados parciais (PLS-SEM) permite identificar relações causais entre compartimentos e processos do solo, quantificando efeitos diretos e indiretos de variáveis como densidade do solo e frações húmicas nos estoques de nutrientes [@HairJr2021]. Métodos de inteligência computacional, como sistemas de inferência fuzzy, integram variáveis químicas e físicas em um único índice de funcionalidade que reflete respostas edáficas contínuas e não lineares ao uso da terra [@Mamdani1977; @Reis2023]. A combinação de PLS-SEM e inferência fuzzy suporta indicadores compostos como o Índice de Funcionalidade Nutricional do Solo (FSNSI), sintetizando a funcionalidade biogeoquímica sob diferentes usos da terra [@Reis2023; @Suganya2024EMA].

A intensificação agrícola e o preparo convencional reduzem a matéria orgânica particulada e rompem complexos organominerais, aumentam a densidade do solo e diminuem a porosidade [@Iversen2022]. Esses efeitos físicos restringem a difusão de gases, a infiltração de água e a atividade microbiana, comprometendo a ciclagem de nutrientes e a coestabilização de N e P [@Vereecken2018]. Assim, a degradação física, expressa pelo aumento da densidade do solo, limita a funcionalidade do solo e interage com processos biogeoquímicos, afetando a sustentabilidade [@Khalaf2020; @Mendes2019]. Com base nesse contexto, o estudo testa a hipótese de que a estabilização de nutrientes em Latossolos do Cerrado é primariamente controlada pelo balanço entre retenção húmica e renovação lábil, enquanto a densidade do solo media esse balanço modificando a intensidade dos fluxos biogeoquímicos. Sob esse mecanismo, espera-se que a vegetação nativa mantenha maior coestabilização de N e P em frações húmicas, enquanto sistemas manejados apresentem maior alocação para compartimentos lábeis e residuais e acoplamento mais fraco entre os ciclos de nutrientes [@Condron2011; @Jensen2020; @Macci2016].

Dentro desse arcabouço, o FSNSI emerge como solução relevante [@vanLeeuwen2023]. Ao sintetizar a dinâmica de N e P com métricas de degradação física, o FSNSI opera de duas formas: diagnostica a sustentabilidade local e fornece um indicador quantitativo agregado para a fase de produção dentro de uma perspectiva de pensamento do ciclo de vida [@Sala2019; @Powlson2012]. Portanto, a funcionalidade do solo quantificada dessa forma torna-se um insumo para avaliação de sustentabilidade do ciclo de vida e suporte à decisão em gestão da terra [@Jha2025EMA]. Como indicador de monitoramento e avaliação ambiental, o FSNSI também pode ser acoplado a camadas de SIG para apoiar a priorização espacial de intervenções de manejo e identificar hotspots de risco funcional [@Yang2025EMA]. Este estudo objetivou avaliar a dinâmica funcional de N e P nas frações húmicas e lábeis do solo sob diferentes usos da terra, e propor e validar um arcabouço analítico integrado (PLSR, PLS-SEM e FSNSI) para diagnosticar a sustentabilidade nutricional do solo.

# 2. Materiais e Métodos

## 2.1 Área de estudo

A pesquisa foi conduzida no município de São Valério, Tocantins, Brasil, em uma área total de 53,23 ha, nas coordenadas 11º54'37" S e 48º12'31" O (Figura 1). A altitude da área é de aproximadamente 360 m. O clima regional é tropical sazonal, classificado como Aw segundo Köppen [@Thornthwaite1948], com verão chuvoso de outubro a abril e inverno seco de maio a setembro. A precipitação média anual é de aproximadamente 1.480 mm e as temperaturas médias mensais variam ligeiramente ao longo do ano, com valores médios diários em torno de 27 °C, mínimas de 21–24 °C e máximas entre 30 e 35 °C [@Santos2025]. O relevo é predominantemente suave ondulado, típico do bioma Cerrado, e os solos são principalmente Latossolos Vermelho-Amarelos bem drenados com baixa fertilidade natural associada a baixo fósforo disponível e alta influência de alumínio [@Santos2025].

![Figura 1 – Localização das áreas experimentais.](../../2-FIGURAS/mapa_area.png){#fig:1 width=70%}

## 2.2 Características das situações de uso da terra

A área de Cerrado sensu stricto preservado (Figura 2a), utilizada como controle, abrange 44,82 ha e tem mais de 40 anos, localizada nas coordenadas 11°54'57''S e 48°11'59''O. A vegetação exibe fisionomia de Cerrado denso, com árvores variando de 5 a 8 m, e considerável variação estrutural entre fisionomias do Cerrado [@Lacerda2025]. Um levantamento da vegetação foi realizado para calcular parâmetros fitossociológicos, incluindo Densidade Relativa, Dominância Relativa, Frequência Relativa e Índice de Valor de Importância [@Queiroz2017] (Apêndice 1).

![Figura 2 – Situações de uso da terra. Fotomontagem: (a) Cerrado sensu stricto (vegetação nativa preservada); (b) eucalipto (*Eucalyptus* sp.); (c) mogno africano (*Khaya ivorensis*); (d) teca (*Tectona grandis*); (e) agricultura (rotação soja/milho).](../../2-FIGURAS/fig_2.jpg){#fig:2 width=90%}

Para melhorar a clareza e a reprodutibilidade, as principais características de manejo de cada situação de uso da terra estão sintetizadas na Tabela 1.

**Tabela 1. Idade do povoamento, preparo do solo, densidade de plantio e regimes de fertilização por situação de uso da terra.**

| Situação de uso da terra | Área | Idade | Preparo do solo / operações | Densidade de plantio / espaçamento | Fertilização / corretivos (conforme descrito) |
| --- | --- | --- | --- | --- | --- |
| Cerrado sensu stricto (controle) | 44,82 ha | > 40 anos | Vegetação nativa preservada | - | - |
| Eucalipto (*Eucalyptus* sp.) | 2,29 ha | 5 anos | Limpeza com lâmina em trator de esteira; aração e gradagem | ~1.667 mudas ha⁻¹ (3 × 2 m) | NPK 5-25-15; correções de base com Ca, Zn, S, Cu e B [@Vera2022; @Boudiar2022] |
| Mogno africano (*K. ivorensis*) | 1,94 ha | 7 anos | Limpeza; aração e gradagem | 1.111 mudas ha⁻¹ (3 × 3 m; desbaste para 6 × 6 m) | NPK 00-10-10 e esterco bovino por cova; reaplicações no 1º ano [@Lucena2024; @Lima2023] |
| Teca (*T. grandis*) | 1,12 ha | 10 anos | Limpeza; aração e gradagem | 1.667 mudas ha⁻¹ (3 × 2 m) | Coberturas com NPK 20-05-20 no 1º ano [@Vieira2017; @Lima2023] |
| Agricultura (rotação soja/milho) | 3,06 ha | > 10 anos | Operações de preparo e semeadura (gradagem, nivelamento, sulcamento) | Espaçamento dependente da cultura | NPK 4-28-10 (fase soja) e 4-14-18 + doses de N (fase milho) [@Machado2024; @Camargo2024] |

Todas as áreas manejadas foram convertidas a partir de vegetação nativa de Cerrado em diferentes épocas, resultando em idades de povoamento que variam de 5 anos (Eucalipto) a mais de 10 anos (agricultura), conforme detalhado na Tabela 1. Como a conversão síncrona não era viável dentro do histórico operacional da propriedade, o delineamento amostral segue uma abordagem de substituição espaço-por-tempo na qual cada situação de uso da terra representa uma trajetória pós-conversão distinta amostrada em um único momento. Nenhuma das três espécies de plantio (*Eucalyptus* sp., *Khaya ivorensis*, *Tectona grandis*) é leguminosa fixadora de nitrogênio, de modo que a fixação biológica de N não confunde as diferenças observadas nos estoques de nitrogênio entre sistemas silviculturais. A heterogeneidade de idade dos povoamentos é reconhecida como restrição do delineamento e é considerada na interpretação dos resultados.

## 2.3 Amostragem de solo

Cinco trincheiras foram abertas em cada situação de uso da terra, com dimensões de 70 × 70 × 100 cm em diferentes pontos [@MarinhoJunior2021], totalizando 25 trincheiras e representando cinco repetições por tratamento de uso da terra. Amostras de solo deformadas e indeformadas foram coletadas para análises físicas e químicas nas profundidades de 0-10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-80 e 80-100 cm. As amostras deformadas foram secas ao ar e peneiradas em malha de 2 mm para análises subsequentes. Para as análises inferenciais, a estrutura de dados foi tratada como observações estratificadas por uso da terra e profundidade, com trincheiras repetidas como suporte amostral dentro de cada classe de uso.

## 2.4 Análises físicas e químicas

A distribuição granulométrica foi determinada em amostras deformadas pelo método da pipeta [@Teixeira2017], e a densidade do solo foi obtida pelo método do cilindro volumétrico [@Teixeira2017] (Apêndice 2).

As amostras de solo foram secas ao ar, peneiradas em malha de 2 mm e homogeneizadas. Uma subamostra foi moída em almofariz e pistilo de porcelana até obtenção de pó fino e uniforme, sendo então peneirada novamente em malha de 150 μm (100 mesh). O nitrogênio total (Ntotal) foi determinado por combustão seca em analisador elementar (Modelo PE-2400 Série II, Perkin Elmer). O fósforo total (Ptotal) foi determinado após digestão úmida e quantificado por colorimetria [@MurphyRiley1962].

As substâncias húmicas foram extraídas utilizando o procedimento de fracionamento recomendado pela Sociedade Internacional de Substâncias Húmicas (IHSS) [@Swift1996]. O método baseia-se nas diferenças de solubilidade em soluções alcalinas e ácidas, permitindo a separação de ácido fúlvico (AF), ácido húmico (AH) e humina (Hum). A matéria orgânica leve (MOL) foi separada por flotação em água [@FragaSalcedo2004]. Após o fracionamento húmico, as amostras foram congeladas e liofilizadas para determinação de N e P em AF, AH e Hum. O fósforo foi quantificado pelo método colorimétrico [@MurphyRiley1962]. O nitrogênio nas mesmas frações húmicas foi determinado por combustão seca. O fósforo associado à MOL (P-MOL) foi determinado por colorimetria [@MurphyRiley1962], e o nitrogênio associado à MOL (N-MOL) foi determinado por combustão seca.

O fósforo lábil (P lábil) foi obtido pelo procedimento de extração de Hedley [@Hedley1982] e quantificado por colorimetria [@MurphyRiley1962]. O nitrogênio lábil (N lábil) foi determinado indiretamente pelo método de [@ShangTiessen1997]. Os estoques de N e P foram calculados a partir das concentrações medidas (no solo total e nas respectivas frações), da densidade do solo e da espessura das camadas amostradas.

## 2.5 Construção do Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI)

O FSNSI foi desenvolvido utilizando um sistema de inferência Mamdani implementado em R (pacote FuzzyR). O sistema integrou os estoques de N Total e P Total (indicadores de capital químico) e a densidade do solo (indicador de restrição física) como variáveis de entrada. Todas as variáveis foram normalizadas para escala de 0 a 10. Para a densidade do solo, aplicou-se normalização invertida, de modo que menores valores de densidade correspondem a pontuações mais altas.

### 2.5.1 Funções de pertinência e fuzzificação

Funções de pertinência triangulares foram aplicadas às variáveis de entrada e saída, definindo três termos linguísticos: Baixo, Médio e Alto. As funções foram parametrizadas utilizando quartis empíricos da distribuição de cada variável ($Q_{25}, Q_{50}, Q_{75}$). A forma geral da função de pertinência triangular (Eq. 1) é:

$$ \mu_A(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right) $$

onde $a$, $b$ e $c$ representam o limite inferior, o pico e o limite superior, definidos como: Baixo ($0, Q_{25}, Q_{50}$), Médio ($Q_{25}, Q_{50}, Q_{75}$) e Alto ($Q_{50}, Q_{75}, 10$).

### 2.5.2 Regras de inferência e defuzzificação

A base de conhecimento consistiu em regras fuzzy no formato SE-ENTÃO, utilizando o operador lógico E (mínimo) para agregar antecedentes. O grau de ativação ($\alpha_i$) de cada regra foi calculado conforme a Eq. 2:

$$ \alpha_i = \min(\mu_{N}(x_N), \mu_{P}(x_P), \mu_{Ds}(x_{Ds})) $$

O valor final do FSNSI foi obtido por defuzzificação pelo centroide (Eq. 3):

$$ \hat{z} = \frac{\int z \cdot \mu_{FSNSI}(z) \, dz}{\int \mu_{FSNSI}(z) \, dz} $$

O FSNSI varia de 0 a 10 e foi interpretado como: Baixa Sustentabilidade (0,0–3,3), Sustentabilidade Intermediária (3,4–6,6) e Alta Sustentabilidade (6,7–10,0).

## 2.6 Análise de dados

Os dados foram analisados por modelos lineares generalizados multivariados (GLM) com reamostragem bootstrap (n = 1000) para avaliar os efeitos do uso da terra e da profundidade do solo nas frações de N e P, estoques e FSNSI. A abordagem GLM foi adotada em detrimento da ANOVA tradicional devido à não normalidade e heterocedasticidade (Shapiro-Wilk, p < 0,01). A distribuição Gama foi selecionada com base em menores AIC e BIC comparados com distribuições normal e log-normal [@Akaike1974; @McCullaghNelder2019]. A adequação do modelo foi confirmada pela análise residual (Deviance/gl < 1) e ausência de superdispersão [@CameronTrivedi1990]. Seguindo recomendações atuais sobre relato de tamanhos de efeito juntamente com níveis de significância, os efeitos do uso da terra sobre o FSNSI foram quantificados como coeficientes exponenciados (Exp(B)) com intervalos de confiança bootstrap de 95%, que expressam a magnitude do efeito na escala original da resposta e são mais informativos para interpretação prática do que testes de significância isolados, pois um teste significativo indica apenas desvio do nulo, enquanto Exp(B) quantifica a média predita sob cada condição de tratamento.

A significância multivariada foi avaliada pelas estatísticas de Pillai, Wilks, Hotelling e Roy. Comparações pareadas utilizaram correção de Bonferroni. Análises exploratórias incluíram análise de componentes principais (PCA), análise de agrupamento hierárquico (HCA, Ward.D2) e correlação de Pearson para avaliar associações lineares entre variáveis.

As relações estruturais foram modeladas por regressão de mínimos quadrados parciais (PLSR) e PLS-SEM para identificar preditores-chave (VIP > 1,0). O modelo estrutural foi especificado como modelo hierárquico de componentes de segunda ordem (HCM), e os contrastes entre usos da terra foram avaliados por análise multigrupo PLS (PLS-MGA). As análises foram conduzidas em R [@RCoreTeam2024] utilizando FactoMineR, factoextra, ggplot2, seminr (PLS-SEM e PLS-MGA) e boot (reamostragem bootstrap).

No fluxo de trabalho PLSR, os preditores foram centrados e escalonados antes do ajuste do modelo, e os componentes latentes foram estimados com validação cruzada leave-one-out para controlar sobreajuste sob preditores correlacionados. Dois modelos PLSR foram ajustados, um para o sistema de nitrogênio e outro para o sistema de fósforo. No modelo de nitrogênio, a variável dependente foi o estoque total de nitrogênio (EstNT), com variáveis independentes representando frações operacionais e seus estoques (NLabil, NMOL, NTAF, NTAH, NTHum, EstNLabil, EstNMOL, EstNAF, EstNAH e EstNTHum). No modelo de fósforo, a variável dependente foi o estoque total de fósforo (EstPT), com variáveis independentes análogas (PLabil, PMOL, PTAF, PTAH, PTHum, EstPLabil, EstPMOL, EstPAF, EstPAH e EstPTHum).

O conjunto de dados de modelagem compreendeu 200 observações derivadas de cinco classes de uso da terra, cinco trincheiras repetidas por classe e oito intervalos de profundidade por trincheira. Duas variáveis latentes foram retidas para ambos os sistemas de nutrientes. Em ambos os modelos, a primeira variável latente explicou 49,43% da variância da resposta e a segunda variável latente aumentou a variância explicada acumulada para 94,49%.

# 3. Resultados e Discussão

## 3.1 Dinâmica das frações de nitrogênio e fósforo

As frações húmicas representaram mediana de 76,0% do N total (IIQ: 74,48 a 79,45%; amplitude: 72,09 a 82,85%), indicando dominância de reservatórios de alta inércia em Latossolos do Cerrado. No espaço latente do PLSR (Figura 3), as frações húmicas exibem coerência direcional com o nitrogênio total, sustentando essa hierarquia de balanço de massa.

As frações lábeis contribuíram com mediana de 12,18% do nitrogênio total (IIQ: 11,47 a 12,73%; amplitude: 9,09 a 13,77%), enquanto a fração residual apresentou mediana de 11,47% (amplitude: 3,38 a 18,83%). Para o fósforo, o ordenamento entre compartimentos preservou a dominância húmica observada para o nitrogênio, sustentando a co-estratificação de macronutrientes dentro de um arcabouço organomineral consistente com matéria orgânica associada a minerais, no qual a associação preferencial com silte e argila e a proteção física em microagregados reduzem a acessibilidade microbiana e prolongam o tempo de residência dos elementos [@Lavallee2020].

Na Figura 3, o alinhamento NT–húmico é consistente com a mediana de 76,0% do N total no compartimento húmico e com a hierarquia composicional observada, onde a maior parte do N é alocada em frações de maior complexidade estrutural. Mecanisticamente, essa dominância implica que a retenção de N é governada pela incorporação progressiva em redes orgânicas de baixa biodegradabilidade e por interações com superfícies minerais que impõem barreiras físico-químicas ao acesso enzimático, reforçando uma dinâmica de imobilização e reestabilização contínua. Como a humificação transfere massa de um compartimento de alta rotatividade para um compartimento persistente, a fração lábil tende a atuar como reservatório de curto prazo e não como determinante dos estoques de longo prazo, consistente com sua menor contribuição proporcional e maior sensibilidade a perturbações e microclima [@Carvalho2023].

No modelo PLSR de nitrogênio, EstNT foi tratado como variável dependente e as variáveis de fração como preditores, com dois componentes latentes retidos após validação cruzada. O primeiro componente capturou a estrutura dominante de covariância entre estoque total e pools húmicos, e o segundo componente melhorou a separação das contribuições lábeis e associadas a minerais, consistente com o particionamento de variância estimado para a estrutura PLSR de dois componentes.

![Figura 3. Correlação estrutural no modelo PLSR de nitrogênio, onde o estoque total de nitrogênio é representado como TN_stock e os preditores são mostrados com abreviações padronizadas no biplot.](../../2-FIGURAS/biplot_plsr_nt.png){#fig:3 width=70%}


Em Latossolos altamente intemperizados, a ciclagem de P é constrangida pela adsorção específica a óxidos de Fe e Al (troca de ligantes), o que aumenta a impedância química à renovação biológica. A matéria orgânica modula a disponibilidade de P competindo por sítios reativos e favorecendo a incorporação em pools organominerais persistentes, consistente com @Gerke2022. No modelo PLSR de fósforo, EstPT foi tratado como variável dependente e as frações de fósforo foram utilizadas como preditores com dois componentes latentes retidos após validação cruzada.

A consistência preditiva desse modelo é demonstrada pela relação entre valores observados e preditos para fósforo, onde a tendência indica resposta coerente do modelo entre sistemas de uso da terra (Figura 4).

![Figura 4. Valores observados versus preditos na resposta de fósforo no modelo PLSR para o sistema de fósforo (EstPT como variável dependente).](../../2-FIGURAS/predicoes_pt.png){#fig:4 width=70%}

A convergência entre os padrões de nitrogênio e fósforo no espaço multivariado reforça a hipótese de acoplamento estequiométrico durante a formação e maturação da MOS. A retenção de um nutriente condiciona a retenção do outro por rotas compartilhadas de processamento microbiano e proteção físico-química, em vez de trajetórias independentes governadas apenas por reatividade mineral. Isso é consistente com o princípio de que a imobilização microbiana de N é modulada pela qualidade do carbono e, concomitantemente, condiciona a captura de P em formas orgânicas mais persistentes [@Cao2021]. Em Latossolos altamente intemperizados, essa coestabilização ocorre sob intensa competição por sítios reativos em óxidos de Fe e Al. A matéria orgânica, assim, modula o P interferindo na sorção específica de fosfato e favorecendo a incorporação em frações organominerais mais persistentes [@Condron2011].

Quando vista pela lente de agregados e associações organometálicas, o papel de Fe e Al como ponte entre matéria orgânica processada microbianamente e superfícies minerais fornece um mecanismo plausível para a persistência de P associado a matrizes organominerais em solos altamente intemperizados [@Khalaf2020].

O Cerrado preservado apresentou a maior contribuição húmica (mediana de 82,0%) e a menor fração residual (4,96%), enquanto a agricultura mostrou a menor contribuição húmica (mediana de 73,0%) e a maior fração residual (17,15%). Quando as comparações são sintetizadas em três macro-sistemas (vegetação nativa, plantios florestais e agricultura), esse ordenamento reduz a ambiguidade interpretativa. Os plantios florestais mostraram condição intermediária (mediana de 76,0% de contribuição húmica; residual de 11,47%), sugerindo que a transição do Cerrado nativo para sistemas arbóreos manteve parte substancial da arquitetura de estabilização enquanto redistribuiu massa entre compartimentos, consistente com mecanismos de proteção organomineral e vias contrastantes entre matéria orgânica particulada e associada a minerais [@Paul2016; @Ferreira2021].

Os estoques totais de nitrogênio por camada ordenaram-se de forma decrescente como Teca (mediana EstNT = 1,383), Eucalipto (1,335), Mogno (1,295), Agricultura (1,171) e Cerrado (1,124), correspondendo a incrementos de 23,0%, 18,8%, 15,2% e 4,1% em relação à linha de base nativa. O estoque mais elevado observado na agricultura provavelmente reflete adições sustentadas de N mineral por ciclos de fertilização (Tabela 1), que suplementam o N de origem orgânica e complicam a comparação direta com vegetação nativa não fertilizada. Nenhuma das três espécies de plantio é leguminosa fixadora de nitrogênio, de modo que os ganhos de estoque em sistemas silviculturais não podem ser atribuídos à fixação biológica de N e são mais plausivelmente explicados pelo aporte contínuo de serapilheira, renovação radicular e reduzida perturbação pós-estabelecimento. A dinâmica dos estoques totais de N não deve ser equiparada às tendências da MOS como um todo, pois o acúmulo de N reflete o resultado combinado de incorporação de N orgânico, retenção de N mineral e estabilização fração-específica, processos que podem divergir das trajetórias da MOS orientadas pelo carbono [@Gerke2022]. Esse contraste sugere que os ganhos de estoque dependem primariamente de como cada sistema de manejo modula a qualidade do aporte orgânico, o tempo de residência e a proteção dentro de domínios organominerais, mais do que da magnitude do aporte isoladamente.

A dispersão relativamente baixa dos percentuais de partição, especialmente quando comparada com a variação dos estoques, deve ser interpretada como propriedade composicional de um sistema no qual as frações representam uma decomposição do total e estão, portanto, sujeitas a restrições de soma e eficiência de recuperação analítica, não como evidência de dinâmica ausente [@Aitchison1986]. Em termos de engenharia de processos, isso indica que o controle dominante reside no fluxo de transferência entre compartimentos e no balanço entre estabilização e perda, mais do que em flutuações amplas na distribuição percentual, reforçando o papel da dinâmica das frações e da estabilidade estrutural como reguladores da resiliência de estoques a longo prazo [@Jensen2020].

## 3.2 Mecanismos estruturais de estabilização de nutrientes

No modelo estrutural, os coeficientes de caminho húmico-total foram > 1,2 e os coeficientes lábil-total foram aproximadamente -0,3 (Figura 5), indicando que o acúmulo de capital químico é governado pela estabilização em frações de maior inércia temporal. Esses coeficientes lábeis negativos devem ser interpretados como assinatura de transferência de massa entre um reservatório de alta rotatividade e um reservatório persistente, compatível com a cinética de humificação e a natureza transitória do compartimento lábil, e não como penalidade funcional [@HairJr2021].

![Figura 5. Modelo estrutural hierárquico de segunda ordem (HCM) integrando frações funcionais de N e P.](../../2-FIGURAS/analise_caminhos_pls.png){#fig:5 width=70%}

Conforme proposto por @Lehmann2015, o modelo contínuo da MOS implica que compostos lábeis são continuamente processados e estabilizados. Nesse arcabouço, um alto estoque de N ou P lábil que não se traduz em N ou P húmico indica humificação interrompida ou mineralização excessiva, típica da agricultura convencionalmente arada. Em contraste, coeficientes equilibrados nos sistemas de Cerrado e Eucalipto indicam fluxo ativo de aportes lábeis para reservas estáveis.

A simetria entre as vias de N e P no modelo estrutural reforça o conceito de coestabilização biogeoquímica. @MarinhoJunior2021 reportou que, em solos de Cerrado brasileiro, a ruptura desse acoplamento (p. ex., fertilização excessiva de P sem aportes orgânicos) pode reduzir a qualidade da MOS. Nossos resultados estendem essa interpretação ao indicar que esse acoplamento pode ser mantido sob transições silviculturais, desde que a estrutura física do solo seja preservada. O ajuste global do PLS-SEM corroborou a adequação estrutural do modelo, com R² = 0,959 para ambos os constructos endógenos N total e P total, SRMR abaixo de 0,06, confiabilidade composta excedendo 0,97 e variância média extraída (AVE) acima de 0,95 [@HairJr2021; @Henseler2015], indicando coletivamente que os constructos latentes capturam mais de 95% da variância dos indicadores sob validade discriminante satisfatória.

## 3.3 Heterogeneidade funcional entre usos da terra

A análise multigrupo mostrou coeficientes húmicos variando de β = 1,180 (agricultura) a β = 1,372 (teca), indicando que o manejo altera as vias de estabilização (Tabela 2). O Cerrado nativo apresentou coeficientes húmicos elevados (β = 1,286), representando uma linha de base funcional na qual a ciclagem de nutrientes é hermeticamente acoplada e eficiente.

A agricultura apresentou redução na eficiência húmica (β = 1,180), consistente com @Silva2024, que reportou que a conversão do Cerrado para agricultura acelera a oxidação da matéria orgânica particulada. A ruptura física de agregados pelo preparo do solo expõe matéria orgânica previamente protegida ao ataque microbiano, desacoplando assim os ciclos de N e P.

**Tabela 2. Coeficientes de caminho estratificados por uso da terra.**

| Uso da terra | N Húmico → N Total | N Lábil → N Total | P Húmico → P Total | P Lábil → P Total |
| --- | --- | --- | --- | --- |
| Teca | 1,372 | -0,445 | 1,372 | -0,445 |
| Cerrado | 1,286 | -0,313 | 1,286 | -0,313 |
| Eucalipto | 1,275 | -0,283 | 1,275 | -0,283 |
| Mogno africano | 1,271 | -0,277 | 1,271 | -0,277 |
| Agricultura | 1,180 | -0,237 | 1,180 | -0,237 |

*Nota. Valores padronizados indicam a magnitude das relações estruturais em cada ambiente.*

Entre os sistemas silviculturais, Eucalipto (β = 1,275) e Mogno africano (β = 1,271) mimetizaram a funcionalidade do Cerrado nativo. Essa resiliência pode ser atribuída à manutenção de uma camada permanente de serapilheira e à ausência de perturbação do solo após o estabelecimento do plantio. @StLuce2022 reportou que plantações arbóreas de raízes profundas podem bombear nutrientes das camadas subsuperficiais e redepositá-los na superfície via queda de serapilheira, efetivamente fechando os ciclos de nutrientes.

A Teca apresentou anomalia distinta, com o maior coeficiente húmico (β = 1,372) pareado com o coeficiente lábil mais negativo (β = -0,445). Embora isso possa parecer favorável numa leitura puramente estrutural, o padrão é consistente com um gargalo de ciclagem associado à baixa decomponibilidade da serapilheira. A serapilheira de teca é conhecida pelo alto teor de lignina e metabólitos secundários como tectoquinona, que podem reduzir taxas de decomposição e retardar o retorno de nutrientes aos pools lábeis [@AraujoFilho2025]. Combinado com a maior densidade do solo observada em povoamentos de Teca (Apêndice 2), o resultado é consistente com aumento de impedância física e bioquímica, deslocando o sistema para acúmulo em formas recalcitrantes e reduzindo a renovação de curto prazo, condição associada à estagnação funcional em solos compactados [@Locatelli2023].

As idades dos plantios diferem entre os sistemas avaliados (Eucalipto 5 anos, Mogno 7 anos, Teca 10 anos; Tabela 1), refletindo o fato de que as áreas amostradas correspondem a usos da terra já estabelecidos na paisagem em diferentes datas, o que caracteriza um delineamento de substituição espaço-por-tempo [@Pickett1989] no qual sistemas coexistentes em diferentes estágios pós-conversão servem como proxies para trajetórias temporais. @Walker2010 demonstraram que tais delineamentos produzem inferências confiáveis sobre o desenvolvimento do solo quando os sítios compartilham material parental, clima e posição topográfica comparáveis, condições satisfeitas aqui dada a uniformidade do substrato Latossólico e a proximidade espacial de todas as áreas avaliadas dentro da mesma propriedade.

## 3.4 Integração fuzzy da funcionalidade edáfica e o FSNSI

O GLM ajustado indicou efeito estatisticamente significativo do uso da terra sobre o FSNSI (p < 0,001) e bom ajuste do modelo (Deviance/gl = 0,082; Pearson/gl = 0,075). As estimativas marginais ajustadas indicaram maior funcionalidade no sistema Eucalipto, cuja média diferiu significativamente do Cerrado nativo (p < 0,05). As médias marginais ajustadas ordenaram-se de forma decrescente como Eucalipto (Exp(B) = 6,07; IC95%: 5,45–6,69), Mogno (Exp(B) = 4,54), Cerrado (Exp(B) = 4,42; IC95%: 3,80–5,04), Agricultura (Exp(B) = 4,25; IC95%: 3,68–4,82) e Teca (Exp(B) = 2,77), confirmando que a funcionalidade foi máxima sob aportes orgânicos contínuos sem perturbação do solo pós-estabelecimento e mínima onde a impedância bioquímica restringiu a ciclagem.

O Eucalipto superou o Cerrado (Exp(B) = 6,07 versus 4,42), mas esse padrão é condicionado à janela amostral e ao modo como o índice pondera capital químico (N e P) e restrição física (densidade do solo). O resultado é consistente com maiores aportes e perturbação limitada pós-estabelecimento [@Iversen2022], e evidências indicam que plantações bem manejadas podem superar linhas de base nativas para funções específicas do solo sob aportes otimizados [@Tang2023].

Ao longo dos usos da terra, o FSNSI variou de 1,56 a 8,57 e os deslocamentos nas medianas e dispersão intra-uso revelam heterogeneidade funcional integrada pela agregação fuzzy (Figura 6).

![Figura 6. Distribuição do Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI) por uso da terra.](../../2-FIGURAS/boxplot_fsnsi_uso_terra.png){#fig:6 width=70%}

*Nota. Letras diferentes indicam diferenças significativas segundo o teste HSD de Tukey (p < 0,05). Pontos representam valores individuais.*

O Cerrado nativo apresentou distribuição bimodal (50% baixa e 40% alta funcionalidade), refletindo forte estratificação vertical natural. A ampla faixa de FSNSI (1,56–8,57) captura o contraste entre camadas superficiais ricas em matéria orgânica e porosas (0–20 cm) e um subsolo quimicamente empobrecido e naturalmente compactado, típico desses Latossolos. A agricultura convencional (Exp(B) = 4,25; IC95%: 3,68–4,82) mostrou tendência à homogeneização vertical (CV = 60,6%), consistente com o preparo mecanizado que mistura camadas e reduz gradientes estruturais [@Leal2024]. Embora a funcionalidade esteja comprometida, 22,5% das amostras atingiram a classe 'alta', plausivelmente devido à fertilização superficial e ao acúmulo residual de MOS [@Camargo2024].

As correlações entre FSNSI e pools de nutrientes foram fortes (r = 0,616–0,789; p < 0,001), sustentando a coerência interna do índice, que responde simultaneamente ao capital químico persistente e ao capital de rápida renovação sob penalização por impedância física via densidade do solo (Tabela 3), consistente com o princípio de que indicadores robustos de qualidade do solo devem integrar atributos físicos, químicos e biológicos em vez de depender de medições isoladas [@DoranParkin1994]. Essa propriedade integrativa reduz a entropia interpretativa típica de leituras univariadas e desloca a avaliação de fertilidade para funcionalidade, onde estabilização, ciclagem e restrições físicas coexistem como componentes acoplados do desempenho do sistema, abordagem recentemente validada para indicadores físicos de Latossolos sob usos contrastantes da terra por @Cavalcante2021.

A associação positiva com pools totais indica que o indicador captura o armazenamento de nutrientes de longo prazo, relação consistente com o papel da matéria orgânica na sustentação da retenção de água e capacidade tamponante de nutrientes no solo [@Lal2020]. A associação negativa com a densidade do solo indica que a compactação estrutural restringe o desempenho edáfico ao reduzir o espaço poroso efetivo para transferência de gases e água, em concordância com o arcabouço mecanístico relacionando densidade do solo a aeração, condutividade hidráulica e impedância radicular estabelecido por @Letey1985.

## 3.5 Como o FSNSI melhora a interpretação da dinâmica funcional de N e P

O arcabouço FSNSI melhora a interpretação porque converte informação edáfica multivariada e parcialmente colinear em uma única variável resposta que preserva significado mecanístico entre usos da terra, endereçando o desafio reconhecido de que avaliações multivariadas do solo produzem indicadores difíceis de comparar diretamente quando avaliados isoladamente [@Bunemann2018; @Karlen1997]. Em vez de avaliar concentrações ou estoques isolados, o índice integra capital nutriente persistente, representado por pools totais e associados a frações húmicas, com pools de curta rotatividade e com impedância física representada pela densidade do solo, seguindo a lógica de agregação multicritério demonstrada por @MoraHerrera2020 para pontuação fuzzy de qualidade do solo.

Essa representação conjunta permite comparação direta de estados funcionais entre sistemas de manejo mantendo sensibilidade ao balanço entre estabilização e renovação, propriedade destacada como essencial para índices de qualidade do solo destinados a discriminar trajetórias de uso da terra [@Andrews2002; @MukherjeeLal2014]. Em termos práticos, o modelo identifica se estoques mais elevados estão associados à coestabilização efetiva em compartimentos húmicos ou ao acúmulo transitório sob restrição estrutural, o que é essencial para distinguir regimes nutricionais resilientes de vulneráveis. Ao combinar evidência estrutural baseada em PLS com agregação fuzzy, o FSNSI estende, portanto, comparações descritivas para uma métrica decisória operacional para monitoramento, priorização e direcionamento de manejo, consistente com a demanda por índices holísticos e quantitativos que superem indicadores isolados em direção à avaliação integrada da saúde do solo [@Rinot2019].

**Tabela 3. Coeficientes de correlação de Pearson entre variáveis do solo e FSNSI.**

| Variável | Correlação (r) | valor-p |
| --- | --- | --- |
| N Total | +0,789 | < 0,001 |
| P Total | +0,789 | < 0,001 |
| N Lábil | +0,627 | < 0,001 |
| P Lábil | +0,627 | < 0,001 |
| N Húmico | +0,616 | < 0,001 |
| P Húmico | +0,616 | < 0,001 |
| Densidade do solo | -0,424 | < 0,001 |
| Areia | -0,439 | < 0,001 |
| Argila | +0,267 | 0,001 |
| Silte | +0,230 | < 0,001 |

Com base em uma única campanha amostral, a inferência representa o estado do sistema sob as condições edafoclimáticas do período de amostragem. A variação interanual de precipitação e temperatura pode modular o balanço entre mineralização, estabilização e adsorção, especialmente em ambientes tropicais [@Vereecken2018]. O monitoramento continuado em campanhas subsequentes é, portanto, necessário para testar a estabilidade temporal das relações estruturais estimadas e validar a robustez do FSNSI como indicador operacional sob maior variabilidade climática [@Toth2018].

# 4. Conclusão

Este estudo confirma que a funcionalidade nutricional do solo em Latossolos do Cerrado é primariamente regulada por mecanismos de retenção húmica, com a densidade do solo atuando como restrição-chave modulando os fluxos biogeoquímicos. O Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI) proposto discriminou com sucesso os sistemas de uso da terra, fornecendo um indicador operacional que integra capital químico e restrição física em uma única métrica para monitoramento e avaliação ambiental. Nossos resultados demonstram que o FSNSI viabiliza a priorização de manejo ao identificar sistemas com funcionalidade comprometida, como a agricultura convencional, ao mesmo tempo em que destaca alternativas sustentáveis como plantações de Eucalipto. A capacidade do índice de sintetizar relações biogeoquímicas complexas em uma métrica interpretável representa um avanço significativo para a avaliação da funcionalidade do solo em ambientes tropicais, particularmente dado o acoplamento estequiométrico observado entre as dinâmicas de nitrogênio e fósforo através dos compartimentos húmicos.

## Financiamento

Os autores não receberam financiamento específico para este trabalho.

## Conflito de interesses

Os autores declaram não haver conflito de interesses.

## Aprovação ética

Não aplicável.

## Contribuição dos Autores

RNAF: Renisson Neponuceno de Araújo Filho; LDVS: Luiz Diego Vidal Santos; FSRH: Francisco Sandro Rodrigues Holanda; AP: Alceu Pedrotti; OCL: Olavo da Costa Leite; LMP: Ludmilla Morais Pereira; MBSS: Mateus Barbosa Santos da Silva; JMS: Jémison Mattos dos Santos. Conceptualização: RNAF, LDVS, FSRH, AP. Metodologia: RNAF, LDVS, FSRH, AP. Análise formal: LDVS, JMS. Investigação: RNAF, OCL, LMP. Curadoria de dados: LDVS, MBSS, JMS. Visualização: LDVS, MBSS. Redação – rascunho original: LDVS. Redação – revisão e edição: RNAF, LDVS, FSRH, AP, OCL, LMP, MBSS, JMS. Supervisão: RNAF, FSRH, AP. Administração do projeto: RNAF. Aquisição de financiamento: Nenhuma. Todos os autores leram e aprovaram o manuscrito final.

## Disponibilidade de dados

O conjunto de dados utilizado neste estudo está disponível no repositório do projeto em https://doi.org/10.5281/zenodo.18077256.

# Referências

::: {#refs}
:::
