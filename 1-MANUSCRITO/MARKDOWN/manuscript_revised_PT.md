---
title: "Sustentabilidade nutricional do solo em Latossolos do Cerrado com índice fuzzy (FSNSI)"
author: Luiz Diego Vidal Santos
date: "24 de Dezembro de 2025"
bibliography: [referencias_artigo.bib, references_old.bib]
csl: apa.csl
lang: pt-BR
---


**Renisson Neponuceno de Araújo Filho**  
Professor doutor, Departamento de Tecnologia Rural  
Universidade Federal Rural de Pernambuco, Recife, PE, Brasil.  
Orcid: 0000-0002-9747-1276  
e-mail: renisson.neponuceno@ufrpe.br

**Luiz Diego Vidal Santos**  
Professor doutor, Departamento de Ciências Humanas e Filosofia  
Universidade Estadual de Feira de Santana, Feira de Santana, BA, Brasil.  
Orcid: 0000-0002-9747-1276  
e-mail: ldvsantos@uefs.br

**Francisco Sandro Rodrigues Holanda**  
Professor doutor, Departamento de Engenharia Agronômica  
Universidade Federal de Sergipe, São Cristóvão, PE, Brasil.  
Orcid: 0000-0001-6812-6679  
e-mail: fholanda@academico.ufs.br

**Alceu Pedrotti**  
Professor doutor, Departamento de Engenharia Agronômica  
Universidade Federal de Sergipe, São Cristóvão, PE, Brasil.  
Orcid: 0000-0003-3086-8399  
e-mail: alceupedrotti@gmail.com

**Olavo da Costa Leite**  
Professor Doutor, Colégio Agropecuário de Natividade  
Secretaria da Educação do Tocantins, Natividade, TO, Brasil.  
Orcid: https://orcid.org/0000-0002-8959-0064  
e-mail: olavo.leite@seduc.to.gov.br

**Ludmilla Morais Pereira**  
Mestre, Programa de Pós-graduação em Engenharia Florestal  
Universidade Estadual de Santa Catarina, Lages, SC, Brazil  
Orcid: https://orcid.org/0000-0001-9684-3288  
e-mail: ludmillamoraislive@gmail.com

**Mateus Barbosa Santos da Silva**  
Universidade Estadual de Feira de Santana - UEFS  
Orcid: 0000-0003-3879-307X
e-mail: mbssilva@uefs.br  

**Jémison Mattos dos Santos**  
Universidade Estadual de Santa Cruz - UESC  
e-mail: jemisons@uesc.br

## Resumo

A conversão de ecossistemas naturais em sistemas agrícolas e silviculturais reconfigura a cinética de estabilização organomineral e, por consequência, os estoques de nitrogênio e fósforo em Latossolos do Cerrado. Este estudo propõe o Índice Fuzzy de Sustentabilidade Nutricional do Solo, FSNSI, como ferramenta de suporte à decisão capaz de integrar capital químico, expresso por estoques de N e P, e restrição física, expressa por densidade do solo, em uma métrica escalável para a fase de produção em avaliação do ciclo de vida. A partição composicional indicou dominância das frações húmicas em relação ao total, com mediana de 76,0% para o N e baixa contribuição das frações lábeis, com mediana de 12,18%, corroborando um regime de retenção controlado por reservatórios recalcitrantes. A vegetação nativa apresentou a maior contribuição húmica, com mediana de 82,0%, e a menor fração residual, 4,96%, enquanto a agricultura apresentou redução da contribuição húmica, com mediana de 73,0%, e ampliação da fração residual, 17,15%, sugerindo maior alocação de massa em compartimentos não recuperados pelas extrações operacionais. Os plantios florestais apresentaram mediana de estoque total de nitrogênio por camada de 1,362, cerca de 21,2% superior ao Cerrado, com manutenção de um regime dominado por frações húmicas. O FSNSI discriminou os usos da terra (GLM Gama com reamostragem bootstrap, n = 1000), com maior funcionalidade em Eucalipto, Exp(B) igual a 6,07, seguido pelo Cerrado, Exp(B) igual a 4,42, evidenciando que o desempenho funcional pode ser otimizado quando há aporte orgânico contínuo sem perturbação mecânica do sistema. Conclui-se que a coestabilização de N e P em frações húmicas, modulada pela integridade física do solo, é o mecanismo central que sustenta a funcionalidade nutricional em ambientes tropicais intemperizados e que o FSNSI fornece uma métrica integrada para orientar intervenções, priorização e monitoramento e avaliação ambiental de rotina em programas de gestão da terra.

**Palavras-chave:** Nitrogênio do solo; Indicador de qualidade do solo; Monitoramento e avaliação ambiental; Frações húmicas; Mudança no uso da terra; Latossolo.

# 1. Introdução

Os solos tropicais constituem sistemas biogeoquímicos complexos e dinâmicos onde a matéria orgânica do solo (MOS) desempenha um papel fundamental na regulação dos ciclos de nutrientes, agregação estrutural e manutenção da fertilidade [@Lavallee2020; @Lal2020]. A conversão de ecossistemas nativos em áreas agrícolas e silviculturais altera a entrada e a qualidade dos resíduos orgânicos, acelerando a decomposição e reduzindo a formação de compostos húmicos estáveis. Essa transformação diminui os estoques de nitrogênio (N) e fósforo (P), comprometendo a ciclagem de nutrientes e a resiliência do solo [@Silva2024; @Tivet2013]. No bioma Cerrado, um hotspot global de biodiversidade, tais impactos são críticos, pois seus solos altamente intemperizados, ácidos e naturalmente pobres em nutrientes dependem da estabilidade das frações húmicas da MOS para manter suas funções ecológicas e produtivas [@Locatelli2023]. As substâncias húmicas,  ácidos húmicos (AH), ácidos fúlvicos (AF) e humina (Hum),  atuam como reservatórios de nutrientes, regulando a retenção de água e a formação de agregados estáveis [@Lehmann2015; @Paul2016]. Por meio de adsorção, complexação e imobilização biogênica, essas frações estabilizam N e P, reduzindo perdas e promovendo a persistência de nutrientes no sistema [@Stevenson1994; @Gerke2022].

O interesse científico recente tem se concentrado em compreender o acoplamento biogeoquímico entre N e P e sua co-estabilização na MOS. Evidências indicam que eles são co-regulados por processos interdependentes de decomposição, humificação e proteção organomineral. Mecanismos como incorporação na biomassa microbiana, competição por sítios de adsorção, formação de complexos com substâncias húmicas e co-oclusão física em microagregados estabilizam N e P, protegendo-os da rápida mineralização e garantindo sua persistência no sistema [@Cao2021; @Gerke2022]. Essas interações demonstram que distúrbios no ciclo de um nutriente geram desequilíbrios estequiométricos que afetam a eficiência do uso do outro, comprometendo a estabilidade da matéria orgânica do solo e a sustentabilidade do solo [@MarinhoJunior2021]. No entanto, a maioria dos estudos ainda trata N e P separadamente, ignorando suas inter-relações estruturais e funcionais.

Apesar dos avanços significativos na modelagem de processos edáficos, permanece um hiato metodológico crítico em relação ao desenvolvimento de indicadores de sustentabilidade do solo que sejam simultaneamente robustos, capazes de lidar com a não linearidade e incerteza dos dados, e integráveis em estruturas mais amplas de avaliação de sustentabilidade [@vanLeeuwen2023]. Indicadores tradicionais de fertilidade ou qualidade do solo são frequentemente reducionistas, unidimensionais ou abstrusos para as partes interessadas fora do domínio da ciência do solo [@Vereecken2018]. Para que a gestão da terra informe efetivamente a Avaliação da Sustentabilidade do Ciclo de Vida (ASCV) e as decisões de gestão da cadeia de suprimentos, que são fundamentais para a produção e consumo sustentáveis, é imperativo desenvolver métricas que traduzam a complexidade do solo em um índice agregado e escalável [@Toth2018].

Avanços recentes na modelagem permitiram a integração de múltiplos atributos edáficos para investigar essas relações. A modelagem de equações estruturais baseada em mínimos quadrados parciais (PLS-SEM) permite a identificação de relações causais entre compartimentos do solo e processos biogeoquímicos, quantificando os efeitos diretos e indiretos de variáveis como densidade do solo e frações húmicas nos estoques de nutrientes [@HairJr2021]. Essa técnica é particularmente útil em sistemas tropicais, onde múltiplos fatores interagem simultaneamente. Além disso, métodos de inteligência computacional, como sistemas de inferência fuzzy, permitem a integração de variáveis químicas e físicas em um único índice de funcionalidade do solo, refletindo a natureza contínua e não linear das respostas edáficas a diferentes práticas de manejo [@Mamdani1977; @Reis2023]. A combinação de PLS-SEM e inferência fuzzy fornece uma abordagem abrangente para diagnosticar a sustentabilidade do solo. Essa integração permite a formulação de indicadores compostos, como o Índice Fuzzy de Sustentabilidade Edáfica (FESI) ou o Índice de Funcionalidade Nutricional do Solo (FSNSI), que sintetiza a funcionalidade biogeoquímica de sistemas sob diferentes usos da terra [@Reis2023].

A intensificação agrícola e o preparo convencional do solo reduzem a matéria orgânica particulada e quebram complexos organominerais, aumentando a densidade do solo e diminuindo a porosidade [@Iversen2022]. Esses efeitos físicos restringem a difusão de gases, a infiltração de água e a atividade microbiana, comprometendo a ciclagem e a co-estabilização de N e P [@Vereecken2018]. Assim, a degradação física, expressa pelo aumento da densidade do solo, é um fator limitante da funcionalidade do solo, interagindo com processos biogeoquímicos e afetando diretamente a sustentabilidade do solo [@Khalaf2020; @Mendes2019]. Com base nesse contexto, hipotetiza-se que as frações húmicas e lábeis de N e P contribuem de forma distinta e complementar para os estoques totais desses nutrientes, e que a degradação física atua como uma variável mediadora da funcionalidade do solo [@Condron2011; @Jensen2020]. Espera-se que solos sob vegetação nativa apresentem maior proporção de N e P em frações húmicas e maior co-estabilização biogeoquímica, enquanto sistemas agrícolas e silviculturais revelarão predominância de formas lábeis e menor sinergia entre os ciclos de N e P [@Macci2016].

Dentro desse arcabouço, o Índice de Funcionalidade Nutricional do Solo (FSNSI) configura-se como uma métrica integrada para sintetizar a funcionalidade edáfica em sistemas sob diferentes usos da terra [@vanLeeuwen2023]. Ao combinar a dinâmica de N e P com métricas de degradação física, o FSNSI cumpre uma dupla função. Ele permite o diagnóstico da sustentabilidade em escala local e, adicionalmente, fornece um indicador quantitativo agregado de impacto aplicável à fase de produção sob a perspectiva do Pensamento do Ciclo de Vida (Life Cycle Thinking, LCT) [@Sala2019; @Powlson2012]. Nessa abordagem, a funcionalidade do solo expressa por um índice composto pode ser incorporada como informação de inventário e de avaliação em estudos de Avaliação da Sustentabilidade do Ciclo de Vida (ASCV), contribuindo para comparações mais consistentes entre sistemas produtivos e para a análise dos efeitos de mudanças no uso da terra. Como indicador voltado ao monitoramento e à avaliação ambiental, o FSNSI também pode ser acoplado a camadas de SIG para apoiar a priorização espacial de intervenções de manejo e a identificação de hotspots de risco funcional.

Neste estudo, objetivou-se avaliar a dinâmica funcional do nitrogênio e do fósforo nas frações húmicas e lábeis do solo sob diferentes usos da terra e propor e validar uma estrutura analítica integrada (PLSR, PLS-SEM e FSNSI) para o diagnóstico da sustentabilidade nutricional do solo. A aplicação conjunta dessas abordagens contribui para elucidar mecanismos de coestabilização de N e P em solos tropicais e para operacionalizar a integração de atributos edáficos em avaliações de sustentabilidade em nível de sistema.

# 2. Materiais e Métodos

## 2.1 Área de estudo

A pesquisa foi conduzida no município de São Valério, no Tocantins, com uma área total de 53,23 ha, nas coordenadas geográficas 11º54’37” S e 48º12’31” O (Figura 1). A área possui altitude em torno de 360 m na sede municipal, sendo o clima da região do tipo tropical sazonal, classificado como Aw segundo Köppen [@Thornthwaite1948], caracterizado por duas estações bem definidas, com verão chuvoso entre outubro e abril e inverno seco de maio a setembro. A variação média anual é de cerca de 1.480 mm e as temperaturas médias mensais variam ligeiramente ao longo do ano, com valores médios diários em torno de 27 °C, mínimas de 21–24 °C e máximas entre 30 e 35 °C [@Santos2025]. O relevo é predominantemente suave ondulado, inserido na paisagem típica do bioma Cerrado, e os solos são, em sua maioria, Latossolos Vermelho-Amarelos bem drenados com baixa fertilidade natural [@Santos2025].

![Figura 1 – Localização das áreas experimentais.](../../2-FIGURAS/mapa_area.png){#fig:1 width=70%}

## 2.2 Características das áreas de estudo

A área de Cerrado preservado (sensu stricto) (Figura 2a), considerada como área de controle, abrange 44,82 ha e tem mais de 40 anos, localizada nas coordenadas 11°54’57’’S e 48°11’59’’O. A vegetação exibe uma fisionomia típica de Cerrado denso, com árvores variando de 5 a 8 metros de altura, uma vez que o Cerrado em seu sentido restrito compreende exclusivamente formações savânicas. Apesar disso, dentro do domínio savânico, há considerável variação estrutural na vegetação, com fisionomias variando de Cerrado ralo a denso [@Lacerda2025]. Um levantamento da vegetação foi realizado para calcular parâmetros fitossociológicos: Densidade Relativa (DR), Dominância Relativa (DoR), Frequência Relativa (FR) e Índice de Valor de Importância (IVI) [@Queiroz2017] (Apêndice 1).

![Figura 2,  Áreas estudadas. Fotomontagem das áreas: (a) Cerrado sensu stricto (vegetação nativa preservada); (b) eucalipto (Eucalyptus sp.); (c) mogno africano (Khaya ivorensis); (d) teca (Tectona grandis); (e) agricultura (soja/milho em rotação).](../../2-FIGURAS/cerrado.jpg){#fig:2a width=30%} ![Eucalipto](../../2-FIGURAS/eucalipto.jpg){#fig:2b width=30%} ![Mogno Africano](../../2-FIGURAS/mogno.jpg){#fig:2c width=30%} ![Teca](../../2-FIGURAS/teca.jpg){#fig:2d width=30%} ![Agricultura](../../2-FIGURAS/agricultura.jpg){#fig:2e width=30%}

Para melhorar a clareza e a reprodutibilidade, as principais características de manejo de cada situação de uso da terra foram sintetizadas na Tabela 1.

**Tabela 1. Idade do povoamento, preparo do solo, densidade de plantio e regimes de fertilização por situação de uso da terra.**

| Situação de uso da terra | Área | Idade | Preparo do solo / operações | Densidade de plantio / espaçamento | Adubação / corretivos (conforme descrito) |
| --- | --- | --- | --- | --- | --- |
| Cerrado sensu stricto (controle) | 44,82 ha | > 40 anos | Vegetação nativa preservada | - | - |
| Eucalipto (*Eucalyptus* sp.) | 2,29 ha | 5 anos | Limpeza com lâmina em trator de esteira; aração e gradagem | ~1.667 mudas ha⁻¹ (3 × 2 m) | NPK 5-25-15; correções de base com Ca, Zn, S, Cu e B [@Vera2022; @Boudiar2022] |
| Mogno africano (*K. ivorensis*) | 1,94 ha | 7 anos | Limpeza; aração e gradagem | 1.111 mudas ha⁻¹ (3 × 3 m; desbaste para 6 × 6 m) | NPK 00-10-10 e esterco bovino por cova; reaplicações no 1º ano [@Lucena2024; @Lima2023] |
| Teca (*T. grandis*) | 1,12 ha | 10 anos | Limpeza; aração e gradagem | 1.667 mudas ha⁻¹ (3 × 2 m) | Coberturas com NPK 20-05-20 no 1º ano [@Vieira2017; @Lima2023] |
| Agricultura (rotação soja/milho) | 3,06 ha | > 10 anos | Operações de preparo e semeadura (gradagem, nivelamento, sulcamento) | Espaçamento dependente da cultura | NPK 4-28-10 (fase soja) e 4-14-18 + doses de N (fase milho) [@Machado2024; @Camargo2024] |

O plantio de eucalipto (*Eucalyptus* sp.) cobre uma área total de 2,29 hectares e tem cinco anos, localizado nas coordenadas 11°54’32’’S, 48°12’22’’O (Figura 2b). A densidade de plantio foi de aproximadamente 1667 mudas/ha com espaçamento de 3 x 2 m, em covas medindo 0,40 x 0,40 x 0,40 m, cavadas manualmente com pás, seguidas da aplicação de fertilizante NPK, na formulação 5-25-15, a fim de estimular o desenvolvimento das plantas e melhor adaptação das mudas ao solo [@Vera2022]. No início do plantio, foi realizada adubação de base com 20 kg de Ca²⁺, 0,8 kg de Zn²⁺, 12 kg de S (SO₄²⁻), 1,6 kg de Cu²⁺ e 1,6 kg de B (H₃BO₃). A limpeza da área, para remoção da vegetação nativa, foi realizada com lâmina frontal acoplada a trator de esteira, seguida de aração e gradagem, o que possibilita melhorias nos processos químicos e biológicos [@Boudiar2022]. Quanto ao processo de alinhamento e esquadrejamento das mudas, utilizou-se o método do Triângulo Retângulo (3/4/5) com auxílio de estacas e trena [@Vera2022].

O plantio de mogno africano (*K. ivorensis*) cobre uma área total de 1,94 ha, tem sete anos e está localizado nas coordenadas 11°54’29’’S, 48°12’10’’O (Figura 2c). O plantio foi realizado em covas medindo 0,40 x 0,40 x 0,40 m, com espaçamentos de 3 x 3 m e densidade de 1111 mudas/ha. Durante o plantio, foram adicionados a cada cova 0,2 kg de fertilizante NPK com formulação 00-10-10 e 5 kg de esterco bovino curtido. Estes foram aplicados a cada três meses durante o primeiro ano de crescimento. O desbaste também foi realizado quando as copas começaram a se tocar, resultando em um espaçamento final de 6 x 6 metros [@Lucena2024]. Semelhante à área de eucalipto, a limpeza da área foi realizada com auxílio de lâmina frontal acoplada a trator de esteira, seguida de serviços de aração e gradagem [@Lima2023].

O plantio de teca (*T. grandis*) cobre uma área total de 1,12 ha e tem dez anos, localizado nas coordenadas 11°54’22’’S e 48°12’17’’O (Figura 2d). O preparo da área antes do plantio foi realizado utilizando lâmina frontal acoplada a trator de esteira, seguido de aração e gradagem [@Lima2023]. Durante o primeiro ano, foram realizadas duas adubações de cobertura, a primeira aos 60 dias e a outra no oitavo mês, com a aplicação de 95 g por cova de plantio de NPK com formulação 20-05-20 [@Vieira2017]. O plantio foi feito manualmente no espaçamento de 3 x 2 m, em dimensões de 0,40 x 0,40 m, com 1.667 mudas/hectare, que foram plantadas individualmente com o colo ao nível do solo. Também foi realizado o replantio de mudas falhadas, bem como capinas no primeiro ano. No segundo ano, o sombreamento proporcionado pela teca impediu grande parte do desenvolvimento de ervas daninhas, reduzindo a necessidade de capina e roçada, e no terceiro ano, não foram necessários mais tratos culturais [@Moreira2021]. Além disso, foram realizadas atividades de poda e desbrota com auxílio de serras, com observações constantes quanto ao tamanho dos galhos.

Por fim, a área agrícola cobre 3,06 ha, tem mais de 10 anos e está localizada nas coordenadas 11°54’44’’S e 48°12’02’’O (Figura 2e). A área dedicada à agricultura está em uso há mais de 10 anos, com rotação de culturas entre milho e soja. No momento da coleta, a área estava sendo utilizada para o cultivo de soja, que se estende entre os meses de junho e setembro. As atividades incluíram gradagem e nivelamento do solo, seguidos da aplicação de 300 kg ha⁻¹ de NPK na formulação 4-28-10, com espaçamento de 0,5 m entre plantas. As plantas foram tratadas durante todo o período de plantio com fungicidas tiofanato-metílico e azoxistrobina, e inseticidas, na dosagem de 100 g por 50 kg de sementes, além da remoção de ervas daninhas [@Machado2024]. O cultivo do milho, por outro lado, estende-se de janeiro a março, devido às condições favoráveis promovidas pelas chuvas. O preparo do solo foi realizado através de gradagem e sulcamento, com espaçamento médio entre plantas de 0,2 x 0,8 m e adubação com 400 kg de 4-14-18 por ha⁻¹, dentro do sulco de semeadura, e 50, 100 e 150 kg de N por ha⁻¹, na superfície do solo, combinado com procedimentos relacionados ao controle de ervas daninhas, através de capina manual e uso de herbicidas quando necessário [@Camargo2024].

Cinco trincheiras em cada área estudada, com dimensões de 70 × 70 × 100 cm  em diferentes pontos [@MarinhoJunior2021], foram abertas manualmente, totalizando vinte e cinco trincheiras. Amostras de solo, tanto deformadas quanto indeformadas, foram coletadas para análises físicas e químicas nas profundidades de 0-10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-80 e 80-100 cm. As amostras de solo deformadas foram então secas ao ar e peneiradas em peneira de 2 mm para análises subsequentes.

## 2.3 Análises Físicas e Químicas

A determinação da distribuição do tamanho das partículas do solo foi realizada em amostras deformadas, utilizando o método da pipeta, conforme descrito por [@Teixeira2017] , e a densidade do solo foi obtida pelo método do cilindro volumétrico [@Teixeira2017].

As amostras de solo foram inicialmente secas ao ar, peneiradas em malha de 2 mm e homogeneizadas. Uma subamostra foi então moída em almofariz e pistilo de porcelana até a obtenção de um pó fino e uniforme, e passada novamente em peneira de 150 μm (100 mesh). O teor de nitrogênio total (Ntotal) foi determinado pelo método de combustão a seco, utilizando um analisador elementar (Modelo PE-2400 Série II, Perkin Elmer). Para a determinação do fósforo total (Ptotal), as amostras peneiradas em malha de 150 μm foram submetidas à digestão úmida. O teor de Ptotal foi determinado por colorimetria [@MurphyRiley1962].

As substâncias húmicas foram extraídas das amostras de solo utilizando o procedimento de fracionamento recomendado pela Sociedade Internacional de Substâncias Húmicas (IHSS) [@Swift1996]. O método baseia-se nas diferenças de solubilidade das frações orgânicas em soluções alcalinas e ácidas, permitindo a separação das frações ácido fúlvico (AF), ácido húmico (AH) e humina (Hum). A matéria orgânica leve (MOL) foi separada por flotação em água [@FragaSalcedo2004]. Após o fracionamento das substâncias húmicas, as amostras foram congeladas e liofilizadas para a determinação do teor de N e P nas frações AF, AH e Hum. O P foi quantificado pelo método colorimétrico de [@MurphyRiley1962]. O teor de N nas mesmas frações húmicas foi determinado por combustão a seco utilizando um analisador elementar (Modelo PE-2400 Série II, Perkin Elmer). O fósforo associado à matéria orgânica leve (P-MOL) foi determinado pelo método colorimétrico [@MurphyRiley1962], enquanto o nitrogênio (N-MOL) foi quantificado por combustão a seco utilizando o analisador CHNS/O (Perkin Elmer PE-2400).

As frações lábeis de fósforo e nitrogênio (P lábil e N lábil) foram determinadas de acordo com metodologias estabelecidas. O P lábil foi obtido pelo procedimento de extração [@Hedley1982], seguido de quantificação colorimétrica de acordo com o método [@MurphyRiley1962]. O N lábil, por sua vez, foi determinado indiretamente pelo método de [@ShangTiessen1997]. Os estoques de N e P foram calculados a partir das concentrações obtidas no solo e nas respectivas frações húmicas, considerando a densidade do solo e a espessura das camadas amostradas.

## 2.4 Construção do Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI)

O FSNSI foi desenvolvido utilizando um sistema de inferência Mamdani implementado no ambiente R (pacote `FuzzyR`). O sistema integrou os estoques de N Total e P Total (indicadores de capital químico) e a Densidade do Solo (indicador de restrição física) como variáveis de entrada. Todas as variáveis foram normalizadas para uma escala [0–10]. Para a Densidade do Solo, aplicou-se uma normalização invertida, onde menores valores de densidade correspondem a pontuações mais altas, refletindo melhor qualidade física.

### 2.4.1 Funções de Pertinência e Fuzzificação

Funções de pertinência triangulares foram aplicadas às variáveis de entrada e saída, definindo três termos linguísticos: Baixo, Médio e Alto. As funções foram parametrizadas dinamicamente com base nos quartis empíricos da distribuição de cada variável ($Q_{25}, Q_{50}, Q_{75}$). A forma geral da função de pertinência triangular é dada pela Eq. 1:

$$ \mu_A(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right) $$

Onde $a, b, c$ representam o limite inferior, pico e limite superior, definidos como: Baixo ($0, Q_{25}, Q_{50}$), Médio ($Q_{25}, Q_{50}, Q_{75}$) e Alto ($Q_{50}, Q_{75}, 10$).

### 2.4.2 Regras de Inferência e Defuzzificação

A base de conhecimento consistiu em regras fuzzy no formato "SE–ENTÃO", utilizando o operador lógico E (mínimo) para agregar os antecedentes. O grau de ativação ($\alpha_i$) de cada regra foi calculado conforme a Eq. 2:

$$ \alpha_i = \min(\mu_{N}(x_N), \mu_{P}(x_P), \mu_{Ds}(x_{Ds})) $$

O valor final do FSNSI foi obtido através da defuzzificação pelo método do Centroide (Centro de Gravidade), que calcula o ponto de equilíbrio da distribuição de saída fuzzy agregada (Eq. 3):

$$ \hat{z} = \frac{\int z \cdot \mu_{FSNSI}(z) \, dz}{\int \mu_{FSNSI}(z) \, dz} $$

O FSNSI resultante varia de 0 a 10 e foi interpretado como: Baixa Sustentabilidade (0,0–3,3), Sustentabilidade Intermediária (3,4–6,6) e Alta Sustentabilidade (6,7–10,0).

## 2.5 Análise de Dados

Os dados foram submetidos a Modelos Lineares Generalizados Multivariados (GLM) com reamostragem bootstrap (n = 1000) para avaliar os efeitos do uso da terra e da profundidade do solo nas frações de N e P, estoques e FSNSI. A abordagem GLM foi adotada em detrimento da ANOVA tradicional para lidar com a distribuição não normal e a heterocedasticidade das variáveis (Shapiro-Wilk, p < 0,01). A distribuição Gama foi selecionada com base em critérios de ajuste superiores (menor AIC e BIC) em comparação com as distribuições normal e log-normal [@Akaike1974; @McCullaghNelder2019]. A adequação do modelo foi confirmada pela análise de resíduos (Deviance/gl < 1) e pela ausência de superdispersão [@CameronTrivedi1990].

A significância multivariada foi avaliada utilizando as estatísticas de Pillai, Wilks, Hotelling e Roy. As comparações entre pares foram realizadas com correção de Bonferroni para controlar o erro Tipo I. As análises exploratórias incluíram Análise de Componentes Principais (PCA), Análise de Agrupamento Hierárquico (HCA, método Ward.D2) e análise de correlação de Pearson para avaliar associações lineares entre variáveis.

As relações estruturais foram modeladas utilizando Regressão de Mínimos Quadrados Parciais (PLSR) e Modelagem de Equações Estruturais (PLS-SEM) para identificar os principais preditores (VIP > 1,0). As análises foram conduzidas no R [@RCoreTeam2024] utilizando os pacotes `FactoMineR`, `factoextra`, `ggplot2`, `seminr` (PLS-SEM) e `boot` (reamostragem bootstrap).

# 3. Resultados e Discussão

## 3.1 Dinâmica das Frações de Nitrogênio e Fósforo

As frações húmicas representaram mediana de 76,0% do N total (IIQ: 74,48 a 79,45%; amplitude: 72,09 a 82,85%), indicando dominância de reservatórios de alta inércia temporal em Latossolos do Cerrado. No espaço latente do PLSR (Figura 3), as frações húmicas exibem coerência direcional com o nitrogênio total, corroborando essa hierarquia de balanço de massa.

As frações lábeis contribuíram com mediana de 12,18% (IIQ: 11,47 a 12,73%; amplitude: 9,09 a 13,77%), enquanto a fração residual apresentou mediana de 11,47% (amplitude: 3,38 a 18,83%). Para o fósforo, o ordenamento entre compartimentos preservou a dominância húmica observada para o nitrogênio, corroborando a co-estratificação dos macronutrientes dentro do arcabouço organomineral, em consonância com o conceito de matéria orgânica associada a minerais, no qual a associação preferencial com silte e argila e a proteção física em microagregados reduzem a acessibilidade microbiana e prolongam a residência dos elementos no sistema [@Lavallee2020].

Na Figura 3, o alinhamento entre TN e frações húmicas é compatível com a mediana de 76,0% do N total alocada no compartimento húmico e com a hierarquia composicional observada, na qual a maior parte do N se concentra em frações de maior complexidade estrutural. Em termos mecanísticos, essa dominância implica que a retenção de N é governada por incorporação progressiva em redes orgânicas de baixa biodegradabilidade e por interação com superfícies minerais que impõem barreiras físico-químicas ao acesso enzimático, reforçando uma dinâmica de imobilização e reestabilização contínua. Como a humificação opera como mecanismo de transferência de massa entre um compartimento de alta rotatividade e um compartimento de alta persistência, a fração lábil tende a atuar como reservatório de curto prazo e não como determinante do estoque de longo prazo, coerente com sua contribuição percentual reduzida e com sua maior sensibilidade a perturbações e microclima [@Stevenson1994].


![Figura 3. Correlação estrutural entre nitrogênio total (TN) e suas frações húmicas (TNHum, TNHA e TNFA) e lábeis (LabileN) no modelo PLSR.](../../2-FIGURAS/biplot_plsr_nt.png){#fig:3 width=70%}

Em Latossolos altamente intemperizados, a ciclagem de P é constrangida pela adsorção específica em óxidos de Fe e Al (troca de ligantes), elevando a impedância química à renovação biológica. A matéria orgânica modula a disponibilidade de P por competição por sítios reativos e por favorecer sua incorporação em pools organominerais persistentes, em consonância com @Gerke2022. Quando essa mesma lógica é aplicada ao fósforo total, a organização vetorial no PLSR evidencia se o estoque permanece acoplado às frações de maior persistência e como as frações lábeis se posicionam em relação ao gradiente de resposta (Figura 4).

![Figura 4. Correlação estrutural entre fósforo total (TP) e suas frações húmicas (TPHum, TPHA e TPFA) e lábeis (LabileP) no modelo PLSR.](../../2-FIGURAS/biplot_plsr_pt.png){#fig:4 width=70%}

A convergência entre os padrões de nitrogênio e fósforo no espaço multivariado reforça a hipótese de acoplamento estequiométrico durante a formação e a maturação da matéria orgânica do solo. A retenção de um nutriente passa a condicionar a do outro por rotas compartilhadas de processamento microbiano e proteção físico-química, em vez de trajetórias independentes governadas apenas por reatividade mineral, o que é coerente com o princípio de que a imobilização microbiana de N é modulada pela qualidade do carbono e, concomitantemente, condiciona a captura de P em formas orgânicas mais persistentes [@Cao2021]. Em Latossolos altamente intemperizados, essa coestabilização ocorre sob competição intensa por sítios reativos em óxidos de Fe e Al, de modo que a matéria orgânica opera como modulador geoquímico ao interferir na sorção específica de fosfato e ao favorecer a incorporação de P em frações organominerais de maior persistência [@Condron2011].

Quando essa coestabilização é vista pela lente de agregados e associações organometálicas, o papel de Fe e Al como ponte entre matéria orgânica processada microbianamente e superfícies minerais fornece um mecanismo plausível para a persistência de P associado à matriz organomineral em solos altamente intemperizados [@Khalaf2020].

O Cerrado preservado apresentou a maior contribuição húmica, com mediana de 82,0% e fração residual de 4,96%, enquanto a agricultura apresentou a menor contribuição húmica, com mediana de 73,0% e fração residual de 17,15%. Quando a comparação é sintetizada em três macro-sistemas (vegetação nativa, plantios florestais e agricultura), essa ordem funcional reduz ambiguidade interpretativa. Os plantios florestais exibiram condição intermediária, com mediana de 76,0% na contribuição húmica e fração residual de 11,47%, sugerindo que a transição Cerrado para sistemas arbóreos manteve parte substancial da arquitetura de estabilização, porém com redistribuição de massa entre compartimentos, em consonância com mecanismos de proteção organomineral e rotas contrastantes entre matéria orgânica particulada e associada a minerais descritos para sistemas florestais [@Paul2016; @Ferreira2021].

Em paralelo, a leitura em termos de estoques totais por camada indica que os plantios apresentaram mediana de EstNT de 1,362, aproximadamente 21,2% superior ao Cerrado, cuja mediana foi de 1,124, enquanto a agricultura apresentou mediana de 1,171, cerca de 4,1% acima do Cerrado. Entre os plantios, a sequência Teca, Eucalipto e Mogno apresentou medianas de EstNT de 1,383, 1,335 e 1,295, correspondendo a incrementos de 23,0, 18,8 e 15,2% em relação ao Cerrado, sugerindo que o aumento do capital químico ocorre concomitantemente a um regime de estabilização dominado por frações húmicas.

A baixa dispersão relativa dos percentuais de partição, especialmente quando comparada à variação de estoques, deve ser interpretada como propriedade composicional de um sistema em que as frações representam uma decomposição do total e, portanto, estão sujeitas a restrições de soma e a eficiência de recuperação analítica, não como evidência de ausência de dinâmica [@Aitchison1986]. Em termos de engenharia de processos, esse comportamento indica que o controle dominante está no fluxo de transferência entre compartimentos e no balanço entre estabilização e perda, mais do que em flutuações amplas na distribuição percentual, reforçando o papel da dinâmica entre frações e estabilidade estrutural como mecanismo regulador da resiliência de estoques a longo prazo [@Jensen2020].

## 3.2 Mecanismos Estruturais de Estabilização de Nutrientes

No modelo estrutural, os coeficientes de caminho das frações húmicas para os estoques totais foram > 1,2 e os coeficientes das frações lábeis foram aproximadamente -0,3 (Figura 5), indicando que o acúmulo de capital químico é governado pela estabilização em frações de maior inércia temporal. Esses coeficientes negativos nas frações lábeis devem ser interpretados como assinatura de transferência de massa entre um reservatório de alta rotatividade e um reservatório persistente, compatível com a cinética de humificação e o caráter transitório do compartimento lábil, e não como penalização funcional [@HairJr2021].

![Figura 5. Modelo estrutural hierárquico de segunda ordem (HCM) integrando as frações funcionais de N e P.](../../2-FIGURAS/analise_caminhos_pls.png){#fig:5 width=70%}

Como postulado por @Lehmann2015, o "modelo contínuo" da matéria orgânica do solo implica que compostos lábeis são continuamente processados e estabilizados. Em nosso modelo, um alto estoque de N/P lábil que não se traduz em N/P húmico representa um sistema com humificação interrompida ou mineralização excessiva,  típico da agricultura convencionalmente arada. Em contraste, os coeficientes equilibrados nos sistemas de Cerrado e Eucalipto indicam um fluxo ativo de insumos lábeis para reservas estáveis.

A simetria entre as vias de N e P no modelo estrutural reforça o conceito de co-estabilização biogeoquímica. @MarinhoJunior2021 também relatou que em solos de Cerrado brasileiro, a interrupção desse acoplamento (por exemplo, por fertilização excessiva de P sem insumos orgânicos) leva a um declínio na qualidade da MOS. Nossos resultados estendem isso ao mostrar que esse acoplamento é mantido mesmo sob transições silviculturais, desde que a estrutura física do solo seja preservada.

**Tabela 2. Métricas de qualidade do modelo global PLS-SEM.**

| Métrica | Valor observado | Interpretação |
| --- | --- | --- |
| R² (N_total) | 0,959 (Cerrado) | 95,9% da variância explicada |
| R² (P_total) | 0,959 (Cerrado) | 95,9% da variância explicada |
| SRMR | < 0,06 | Modelo bem ajustado aos dados |
| Confiabilidade (α) | > 0,97 | Consistência interna > 0,97 |
| Comunalidade (AVE) | > 0,95 | Variância média bem explicada |

## 3.3 Heterogeneidade Funcional Entre Usos da Terra

A Análise Multigrupo indicou coeficientes húmicos variando de β = 1,180 (agricultura) a β = 1,372 (teca), evidenciando que as práticas de manejo alteram as vias de estabilização (Tabela 3). O Cerrado nativo apresentou coeficientes húmicos elevados (β = 1,286), estabelecendo uma linha de base funcional onde a ciclagem de nutrientes é hermeticamente fechada e eficiente.

O sistema agrícola mostrou uma redução significativa na eficiência húmica (β = 1,180). Isso se alinha com @Silva2024, que demonstrou que a conversão do Cerrado para a agricultura acelera a oxidação da matéria orgânica particulada. A ruptura física dos agregados pelo preparo do solo expõe a matéria orgânica protegida ao ataque microbiano, desacoplando os ciclos de N e P.


**Tabela 3. Coeficientes de caminho estratificados por uso da terra.**

| Uso da Terra | N Húmico → N Total | N Lábil → N Total | P Húmico → P Total | P Lábil → P Total |
| --- | --- | --- | --- | --- |
| Cerrado | 1,286 | -0,313 | 1,286 | -0,313 |
| Agricultura | 1,180 | -0,237 | 1,180 | -0,237 |
| Mogno Africano | 1,271 | -0,277 | 1,271 | -0,277 |
| Eucalipto | 1,275 | -0,283 | 1,275 | -0,283 |
| Teca | 1,372 | -0,445 | 1,372 | -0,445 |

*Nota. Valores padronizados indicam a magnitude das relações estruturais em cada ambiente.*


Entre os sistemas silviculturais, Eucalipto (β = 1,275) e Mogno Africano (β = 1,271) imitaram a funcionalidade do Cerrado nativo. Essa resiliência pode ser atribuída à manutenção de uma camada permanente de serapilheira e à ausência de perturbação do solo após o plantio. @StLuce2022 observou que plantações de árvores de raízes profundas podem bombear nutrientes das camadas do subsolo, redepositando-os na superfície via queda de serapilheira, efetivamente "refechando" o ciclo de nutrientes.

A Teca, no entanto, apresentou uma anomalia distinta, com o maior coeficiente húmico, β = 1,372, emparelhado com o coeficiente lábil mais negativo, β = -0,445. Embora isso possa parecer favorável sob uma leitura puramente estrutural, o padrão é compatível com um gargalo de ciclagem associado à baixa decomponibilidade da serapilheira. A serapilheira de teca é conhecida por seu alto teor de lignina e metabólitos secundários, por exemplo tectoquinona, que podem reduzir taxas de decomposição e retardar a realimentação de nutrientes ao compartimento lábil [@AraujoFilho2025]. Combinado com a maior densidade do solo observada em povoamentos de Teca (Apêndice 2), o resultado é compatível com aumento de impedância física e bioquímica, deslocando o sistema para acúmulo em formas recalcitrantes e reduzindo o regime de renovação de curto prazo, condição associada à estagnação funcional em solos compactados [@Locatelli2023].

## 3.4 Integração fuzzy da funcionalidade edáfica e índice fuzzy de sustentabilidade nutricional do solo (FSNSI)

O modelo GLM ajustado indicou um efeito estatisticamente significativo do fator Uso da Terra sobre o Índice Fuzzy de Sustentabilidade Nutricional do Solo (FSNSI), com p < 0,001 e bom ajuste de acordo com os critérios de qualidade do modelo, com Deviance/gl = 0,082 e Pearson/gl = 0,075. As estimativas marginais ajustadas mostraram maior funcionalidade no sistema Eucalipto, cuja média diferiu significativamente do Cerrado nativo, com p < 0,05. O Eucalipto apresentou o maior FSNSI médio, com Exp(B) = 6,07 e IC95% de 5,45 a 6,69, seguido pelo Cerrado, com Exp(B) = 4,42 e IC95% de 3,80 a 5,04.

O Eucalipto superou o Cerrado (Exp(B) = 6,07 versus 4,42), mas esse padrão é condicionado ao recorte amostral e ao modo como o índice pondera capital químico (N e P) e restrição física (densidade do solo). O resultado é compatível com maior aporte e baixa perturbação após o estabelecimento [@Iversen2022], e evidências indicam que plantações bem manejadas podem superar linhas de base nativas em funções específicas do solo sob insumos otimizados [@Tang2023].

Ao longo dos usos da terra, o FSNSI variou de 1,56 a 8,57 e o deslocamento das medianas e a dispersão intrauso tornam explícita a heterogeneidade funcional que o agregado fuzzy integra (Figura 6).

![Figura 6. Distribuição do Índice Fuzzy de Sustentabilidade do Solo (FSNSI) por uso da terra.](../../2-FIGURAS/boxplot_fsnsi_uso_terra.png){#fig:6 width=70%}

*Nota. Boxplots com padrões visuais distintos para cada sistema. Letras diferentes indicam diferenças significativas de acordo com o teste HSD de Tukey, com p < 0,05. Os pontos representam valores individuais.*

O Cerrado nativo exibiu uma distribuição bimodal, com 50% em baixa e 40% em alta funcionalidade, refletindo sua intensa estratificação vertical natural. A alta amplitude dos valores de FSNSI, de 1,56 a 8,57, captura o contraste entre camadas superficiais ricas em matéria orgânica e porosas, de 0 a 20 cm, e o subsolo quimicamente empobrecido e naturalmente compactado, característica típica desses Latossolos. A agricultura convencional, com Exp(B) = 4,25 e IC95% de 3,68 a 4,82, mostrou tendência à homogeneização vertical, com CV = 60,6%, compatível com o preparo mecanizado que mistura camadas e reduz gradientes estruturais [@Leal2024]. Embora a funcionalidade seja comprometida, 22,5% das amostras atingiram a classe 'alta', plausivelmente devido à fertilização superficial e ao acúmulo residual de matéria orgânica [@Camargo2024].

Tabela 4. Coeficientes de correlação de Pearson entre variáveis do solo e o FSNSI.

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

As correlações entre FSNSI e pools nutricionais foram fortes (r = 0,616–0,789; p < 0,001), validando a coerência interna do índice, pois o escore responde simultaneamente ao capital químico persistente e ao capital de rápida renovação, sob penalização por impedância física via densidade. Essa propriedade de integração reduz a entropia interpretativa típica de leituras univariadas e aproxima a avaliação de fertilidade de uma leitura de funcionalidade, na qual processos de estabilização, ciclagem e restrição física coexistem como componentes acoplados do desempenho do sistema.

Por se tratar de uma única campanha amostral, a inferência representa o estado do sistema sob as condições edafoclimáticas do período de coleta, de modo que variações interanuais de precipitação e temperatura podem modular o balanço entre mineralização, estabilização e adsorção, especialmente em ambientes tropicais. A continuidade do monitoramento em campanhas subsequentes é, portanto, necessária para testar a estabilidade temporal das relações estruturais estimadas e para validar a robustez do FSNSI como indicador operacional em cenários de maior variabilidade climática [@Vereecken2018; @Toth2018].

# 4. Conclusão

A funcionalidade nutricional em Oxissolos do Cerrado parece ser sustentada, principalmente, pela coestabilização de nitrogênio e fósforo em pools húmicos persistentes, com a vegetação nativa atuando como referência funcional associada à forte proteção organomineral. A conversão do uso da terra para agricultura convencional esteve associada a um deslocamento para compartimentos menos protegidos, compatível com perturbação recorrente do solo e enfraquecimento do acoplamento entre ciclos de N e P. Em contraste, plantações florestais preservaram uma arquitetura de estabilização mais próxima da linha de base nativa, sugerindo que transições silviculturais podem manter o capital químico quando há aporte orgânico contínuo e baixa perturbação pós-estabelecimento.

O FSNSI oferece uma forma operacional de sintetizar capital químico e restrição física em uma única métrica de funcionalidade, permitindo comparar sistemas de uso do solo e apoiar monitoramento e priorização de manejo. No conjunto de dados avaliado, o eucalipto apresentou o melhor desempenho funcional, enquanto o teca evidenciou que a acumulação bioquímica pode coexistir com gargalos de ciclagem e limitações físicas, reforçando a necessidade de interpretar funcionalidade em conjunto com a integridade física do solo. Como a inferência se baseia em uma única campanha amostral, recomenda-se validação multissazonal e uso de indicadores biológicos complementares para ampliar a robustez do índice em diferentes contextos pedoclimáticos.

# 5. Declarações

## Financiamento

[Inserir aqui a declaração de financiamento. Se não houve financiamento, usar: "Os autores não receberam financiamento específico para este trabalho."]

## Conflito de interesses

Os autores declaram não haver conflito de interesses.

## Aprovação ética

Não aplicável.

## Consentimento para participar

Não aplicável.

## Consentimento para publicação

Não aplicável.

## Disponibilidade de dados

O conjunto de dados utilizado nas análises está disponível no repositório do projeto em https://doi.org/10.5281/zenodo.18077256.

## Contribuição dos autores

[Inserir aqui a declaração de contribuição dos autores.]

## Agradecimentos

[Inserir aqui os agradecimentos.]

# Referências

::: {#refs}
:::

# Apêndices

## Apêndice 1 – Parâmetros fitossociológicos da área de Cerrado sensu stricto.

| Nomes das espécies | DR (%) | DoR (%) | FR (%) | IVI (%) |
| :--- | :--- | :--- | :--- | :--- |
| *Psidium firmum* | 6,25 | 6,15 | 6,25 | 18,66 |
| *Salvertia convallariodora* | 0,89 | 1,06 | 0,89 | 2,85 |
| *Eugenia dysenterica* | 3,57 | 3,74 | 3,57 | 10,89 |
| *Anacardium occidentale* | 1,78 | 1,46 | 1,78 | 5,04 |
| *Plathymenia reticulata* | 5,35 | 3,39 | 5,35 | 14,11 |
| *Anadenanthera peregrina* | 5,35 | 5,58 | 5,35 | 16,30 |
| *Dimorphandra mollis* | 0,89 | 0,34 | 0,89 | 2,13 |
| *Astronium fraxinifolium* | 2,67 | 2,63 | 2,67 | 7,99 |
| *Pseudobombax tomentosum* | 4,46 | 3,72 | 4,46 | 12,66 |
| *Piptadenia gonoacantha* | 2,67 | 3,07 | 2,67 | 8,43 |
| *Hymenaea courbaril* | 4,46 | 3,85 | 4,46 | 12,79 |
| *Mabea fistulifera* | 3,57 | 3,98 | 3,57 | 11,13 |
| *Byrsonima spicata* | 7,14 | 7,41 | 7,14 | 21,70 |
| *Guazuma ulmifolia* | 6,25 | 8,07 | 6,25 | 20,57 |
| *Tabebuia vellosoi* | 0,89 | 0,78 | 0,89 | 2,57 |
| *Qualea parviflora* | 3,57 | 3,75 | 3,57 | 10,90 |
| *Caryocar brasiliense* | 6,25 | 5,88 | 6,25 | 18,38 |
| *Curatella americana* | 12,50 | 11,88 | 12,50 | 36,89 |
| *Pterodon* sp. | 11,60 | 13,42 | 11,60 | 36,64 |
| *Magonia pubescens* | 9,82 | 9,73 | 9,82 | 29,38 |

## Apêndice 2 – Caracterização dos atributos físicos do solo.

| Uso da terra | Areia (g kg⁻¹) | Silte (g kg⁻¹) | Argila (g kg⁻¹) | Densidade (g cm⁻³) |
| :--- | :--- | :--- | :--- | :--- |
| 0-10 cm | | | | |
| Cerrado | 614,0±3,1 | 79,6±2,5 | 306,4±4,5 | 1,17±0,01 |
| Teca | 614,5±1,5 | 79,5±3,5 | 306,0±4,2 | 1,11±0,01 |
| Mogno | 614,1±3,5 | 79,4±2,7 | 306,5±4,4 | 1,20±0,01 |
| Eucalipto | 614,2±1,2 | 79,7±3,2 | 306,1±4,2 | 1,25±0,02 |
| Agricultura | 614,8±2,5 | 79,0±3,1 | 306,2±5,3 | 1,35±0,01 |
