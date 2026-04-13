---
title: "Impact of Land-Use Change on Soil Nitrogen Stocks and Humic Fractions in Oxisols of the Brazilian Cerrado"
author: Luiz Diego Vidal Santos
date: "December 28, 2025"
bibliography: [referencias_artigo.bib, references_old.bib]
csl: springer-basic-author-date.csl
lang: en-US
---

<!-- markdownlint-disable MD025 -->

## Abstract

The conversion of natural ecosystems into agricultural and silvicultural systems reshapes organomineral stabilization kinetics and, consequently, nitrogen and phosphorus stocks in Cerrado Oxisols. This study proposes the Fuzzy Soil Nutritional Sustainability Index (FSNSI) as a decision-support tool that integrates chemical capital, expressed as N and P stocks, and physical constraint, expressed as soil bulk density, into a scalable metric for the production phase in life-cycle sustainability assessment. Compositional partitioning indicated the dominance of humic fractions relative to the total, with a median humic contribution of 76.0% for N, and a low contribution of labile fractions, with a median of 12.18%, supporting a retention regime controlled by recalcitrant reservoirs. Native vegetation showed the highest humic contribution, with a median of 82.0%, and the lowest residual fraction (4.96%), whereas agriculture showed a reduced humic contribution (median 73.0%) and an increased residual fraction (17.15%), suggesting a greater allocation of mass into compartments not recovered by the operational extractions. Forest plantations showed a median total nitrogen stock per layer of 1.362 Mg ha⁻¹, approximately 21.2% higher than native Cerrado, while maintaining a humic-dominated stabilization regime. The FSNSI discriminated land uses (p < 0.001), with adjusted means ranking in decreasing order as Eucalyptus (6.07), Mahogany (4.54), Cerrado (4.42), Agriculture (4.25), and Teak (2.77), indicating that functional performance is highest when continuous organic inputs occur without recurrent mechanical disturbance and lowest where biochemical impedance restricts nutrient cycling. The results suggest that the co-stabilization of N and P in humic fractions, modulated by the physical integrity of the soil, is a central mechanism sustaining nutrient functionality in highly weathered tropical environments, and that FSNSI provides an integrated metric to guide interventions, prioritization, and routine environmental monitoring and assessment in land-management programs.

**Keywords:** Soil nitrogen; Soil quality indicator; Environmental monitoring and assessment; Humic fractions; Land-use change; Oxisol.

**Highlights**

- Conversion of Cerrado to silviculture and agriculture altered N humic fractionation
- Humic fractions retained 76% of total N across all land-use systems
- Forest plantations increased total N stocks by 21% relative to native Cerrado
- FSNSI ranked Eucalyptus highest and Teak lowest among five land uses
- Co-stabilization of N and P in humic pools drives soil nutritional functionality

# 1. Introduction

Tropical soils are complex and dynamic biogeochemical systems in which soil organic matter (SOM) plays a central role in regulating nutrient cycling, structural aggregation, and fertility maintenance [@Lavallee2020; @Lal2020]. The conversion of native ecosystems into agricultural and silvicultural areas alters the input and quality of organic residues, accelerates decomposition, and reduces the formation of stable humic compounds [@Carvalho2023]. This transformation decreases nitrogen (N) and phosphorus (P) stocks, thereby compromising nutrient cycling and soil resilience [@Silva2024; @Tivet2013].

In the Cerrado biome, a global biodiversity hotspot, these impacts are critical because its highly weathered, acidic, and naturally nutrient-poor soils depend on the stability of humic SOM fractions to maintain ecological and productive functions [@Locatelli2023]. Humic substances (humic acids, HA; fulvic acids, FA; and humin, Hum) act as nutrient reservoirs that regulate water retention and the formation of stable aggregates [@Lehmann2015; @Paul2016]. Through adsorption, complexation, and biological immobilization, these fractions stabilize N and P, reduce losses, and promote nutrient persistence in the system [@Carvalho2023; @Gerke2022].

Although classical humification has historically underpinned interpretations of SOM persistence, the soil continuum model challenges the view of humic substances as discrete macromolecular entities and instead proposes a progressive decomposition continuum in which persistence is an ecosystem property governed by mineral association, spatial inaccessibility, and microbial processing rather than by intrinsic molecular recalcitrance [@Lehmann2015; @Lavallee2020; @cotrufo2021]. Mineral-organic associations, particularly those involving Fe and Al oxyhydroxides abundant in tropical Oxisols, may stabilize organic compounds through ligand exchange, cation bridging, and co-precipitation, thereby reducing enzymatic access and prolonging residence time irrespective of the biochemical class of the sorbed material [@kleber2015; @kallenbach2016]. Within this evolving paradigm, the alkaline-acid fractionation protocol used here (IHSS method) is retained as an operational analytical partition that tracks the distribution of N and P across functionally distinct solubility pools, rather than as an assumption that the extracted fractions correspond to chemically homogeneous macromolecules. This operational approach remains widely adopted in tropical soil studies because it provides reproducible and cost-effective separation of pools with contrasting turnover times, and its results can be interpreted within either the classical or the continuum framework provided that causal claims are constrained by independent structural evidence [@marschner2008; @Paul2016]. In the present study, mechanistic inferences are therefore anchored in convergent evidence from compositional partitioning, PLSR structure, and PLS-SEM path coefficients, rather than derived from the fractionation scheme alone.

Recent studies in tropical and highly weathered soils have increasingly focused on the biogeochemical coupling between N and P and their co-stabilization in SOM [@Cao2021; @Gerke2022; @MarinhoJunior2021]. Evidence indicates that these nutrients are co-regulated by interdependent decomposition, humification, and organomineral protection processes. Mechanisms such as incorporation into microbial biomass, competition for adsorption sites, complex formation with humic substances, and physical co-occlusion in microaggregates stabilize N and P, protecting them from rapid mineralization and promoting persistence [@Cao2021; @Gerke2022]. These interactions indicate that disturbances in one nutrient cycle induce stoichiometric imbalances that affect the use efficiency of the other, which compromises SOM stability and soil sustainability [@MarinhoJunior2021]. Nonetheless, most studies still treat N and P separately and overlook their structural and functional interrelations.

Agricultural intensification and conventional tillage reduce particulate organic matter and disrupt organomineral complexes, increase bulk density, and decrease porosity [@Iversen2022]. These physical effects restrict gas diffusion, water infiltration, and microbial activity, which compromises nutrient cycling and the co-stabilization of N and P [@Vereecken2018]. Physical degradation, expressed as increased bulk density, thus limits soil functionality and interacts with biogeochemical processes, affecting sustainability at multiple scales [@Wagai2020; @Mendes2019].

Despite these advances in understanding edaphic processes, a critical methodological gap remains regarding sustainability indicators that are simultaneously robust, able to handle nonlinearity and uncertainty, and that can be integrated into broader sustainability-assessment frameworks [@Ros2022]. Traditional fertility or soil-quality indicators are often reductionist, unidimensional, or difficult to interpret outside the soil-science domain [@Vereecken2018]. To inform life-cycle sustainability assessment and supply-chain decisions, it is necessary to develop metrics that translate soil complexity into an aggregated and scalable index [@Toth2018].

Recent modeling advances have enabled the integration of multiple soil attributes to investigate these relations. Partial least squares structural equation modeling (PLS-SEM) can identify causal relations among soil compartments by quantifying direct and indirect effects of variables such as bulk density and humic fractions on N and P stocks, thereby revealing the pathways through which organic and mineral phases control nutrient retention [@HairJr2021]. Fuzzy inference systems employ membership functions to represent continuous and nonlinear soil responses as degrees of membership in qualitative categories (e.g., low, medium, or high functionality), translating multiple chemical and physical input variables, including N and P fractions and bulk density, into a single aggregated index without imposing rigid categorical thresholds [@Mamdani1977; @Reis2023]. The combination of PLS-SEM and fuzzy inference supports composite indicators such as the Fuzzy Soil Nutritional Sustainability Index (FSNSI), which synthesizes biogeochemical functionality under different land uses [@Reis2023; @Suganya2024EMA].

Based on this context, the study tests the hypothesis that nutrient stabilization in Cerrado Oxisols is primarily controlled by the balance between humic retention and labile turnover, while bulk density mediates this balance by modifying the intensity of biogeochemical fluxes. Under this mechanism, native vegetation is expected to maintain stronger N and P co-stabilization in humic fractions, whereas managed systems are expected to show higher allocation to labile and residual compartments and weaker coupling between nutrient cycles, consistent with evidence that long-term organic-P accumulation in undisturbed soils is governed by humic retention [@YangPost2011], that N stabilization in persistent SOM pools depends on the balance between litter quality and microbial processing [@Jensen2020], and that land-use conversion disrupts organomineral protection of both nutrients [@Macci2016]. Five representative land-use systems on the same Oxisol substrate in the Brazilian Cerrado were selected to test this hypothesis, encompassing preserved native savanna vegetation (Cerrado sensu stricto, serving as reference), three monoculture forest plantations (*Eucalyptus* sp., *Khaya ivorensis*, and *Tectona grandis*), and conventional agriculture, which collectively span a gradient of post-conversion management intensity characteristic of the region.

Within this framework, FSNSI emerges as a relevant solution [@Ros2022], synthesizing N and P dynamics with physical degradation metrics to simultaneously diagnose local sustainability and provide an aggregated quantitative indicator for the production phase within a life-cycle thinking perspective [@Sala2019; @Powlson2011]. Soil functionality quantified in this manner becomes an input to life-cycle sustainability assessment and supports decision-making on land management [@Jha2025EMA], while its coupling with GIS layers can support spatial prioritization of management interventions and identification of functional-risk hotspots for environmental monitoring and assessment [@Yang2025EMA]. This study aimed to evaluate the functional dynamics of N and P in humic and labile soil fractions under these five land uses, and to propose and validate an integrated analytical framework (PLSR, PLS-SEM, and FSNSI) to diagnose soil nutritional sustainability.

# 2. Materials and Methods

## 2.1 Study area

The research was conducted in the municipality of São Valério, Tocantins, Brazil, in a total area of 53.23 ha, at 11º54’37” S and 48º12’31” W (Figure 1). The elevation is approximately 360 m. The regional climate is seasonal tropical, classified as Aw according to Köppen [@Thornthwaite1948], with a rainy summer from October to April and a dry winter from May to September. The mean annual precipitation is approximately 1,480 mm and mean monthly temperatures vary slightly throughout the year, with mean daily values around 27 °C, minima of 21–24 °C, and maxima between 30 and 35 °C [@Santos2025]. The relief is predominantly gently undulating, typical of the Cerrado biome, and soils are mainly well-drained Red-Yellow Oxisols with low natural chemical fertility associated with low available phosphorus and high aluminum influence [@Santos2025].

![Figure 1 - Location of the study site and land-use systems.](../../../2-FIGURAS/mapa_area.png){#fig:1 width=70%}

## 2.2 Characteristics of the land-use systems

The preserved Cerrado sensu stricto area (Figure 2a), used as the control, covers 44.82 ha and is over 40 years old, located at 11°54’57’’S and 48°11’59’’W. The vegetation exhibits a dense Cerrado physiognomy, with trees ranging from 5 to 8 m, and considerable structural variation across Cerrado physiognomies [@Lacerda2025]. A vegetation survey was conducted to calculate phytosociological parameters, including Relative Density, Relative Dominance, Relative Frequency, and the Importance Value Index [@Queiroz2017] (Appendix 1).

![Figure 2 - Land-use systems. Composite image: (a) Cerrado sensu stricto (preserved native vegetation); (b) eucalyptus (*Eucalyptus* sp.); (c) African mahogany (*Khaya ivorensis*); (d) teak (*Tectona grandis*); (e) agriculture (soybean/corn rotation).](../../../2-FIGURAS/fig_2.jpg){#fig:2 width=90%}

To improve clarity and reproducibility, the main management characteristics of each land-use system are summarized in Table 1.

**Table 1. Stand age, soil preparation, planting density, and fertilization regimes by land-use system.**

| Land-use system | Area | Stand age | Soil preparation / operations | Planting density / spacing | Fertilization / amendments (as described) |
| --- | --- | --- | --- | --- | --- |
| Cerrado sensu stricto (control) | 44.82 ha | > 40 years | Preserved native vegetation | - | - |
| Eucalyptus (*Eucalyptus* sp.) | 2.29 ha | 5 years | Clearing with crawler tractor blade; plowing and harrowing | ~1,667 seedlings ha⁻¹ (3 × 2 m) | NPK 5-25-15; base amendments with Ca, Zn, S, Cu, and B [@Vera2022; @Boudiar2022] |
| African mahogany (*K. ivorensis*) | 1.94 ha | 7 years | Clearing; plowing and harrowing | 1,111 seedlings ha⁻¹ (3 × 3 m; thinned to 6 × 6 m) | NPK 00-10-10 and cattle manure per pit; repeated applications in year 1 [@Lucena2024; @Lima2023] |
| Teak (*T. grandis*) | 1.12 ha | 10 years | Clearing; plowing and harrowing | 1,667 seedlings ha⁻¹ (3 × 2 m) | NPK 20-05-20 top dressings in year 1 [@Vieira2017; @Lima2023] |
| Agriculture (soybean/corn rotation) | 3.06 ha | > 10 years | Tillage and seedbed operations (harrowing, leveling, furrowing) | Crop-dependent spacing | NPK 4-28-10 (soybean phase) and 4-14-18 + N rates (corn phase) [@Machado2024; @Camargo2024] |

All managed areas were converted from native Cerrado vegetation at different times, resulting in stand ages that range from 5 years (Eucalyptus) to over 10 years (agriculture), as detailed in Table 1. Because synchronous conversion was not feasible within the farm's operational history, the sampling design follows a space-for-time substitution approach in which each land-use system represents a distinct post-conversion trajectory sampled at a single point in time. None of the three plantation species (*Eucalyptus* sp., *Khaya ivorensis*, *Tectona grandis*) is a nitrogen-fixing legume, so biological N fixation does not confound the observed differences in nitrogen stocks among silvicultural systems. Stand-age heterogeneity is acknowledged as a design constraint and is considered in the interpretation of results.

## 2.3 Soil sampling

Five trenches (70 × 70 × 100 cm) were opened in each land-use system at spatially independent positions within the management unit [@MarinhoJunior2021], totaling 25 trenches and representing five true replicates per land-use treatment. Because the experimental unit is the individual trench rather than the plot as a whole, differences in total plot area among land-use systems (1.12 to 44.82 ha; Table 1) do not affect the replication structure. Each trench constituted the experimental unit, and within each trench disturbed and undisturbed soil samples were collected at eight depth intervals (0-10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-80, and 80-100 cm), yielding 200 observations in total (5 land uses × 5 trenches × 8 depths).

Disturbed samples were air-dried and sieved through a 2 mm mesh for subsequent analyses. For inferential analyses, the data structure was treated as observations stratified by land use and depth, with replicate trenches as the sampling support within each land-use class, and the generalized linear model framework [@McCullaghNelder2019] accounted for this hierarchical structure through the inclusion of land-use and depth factors with Bonferroni-corrected pairwise comparisons.

## 2.4 Physical and chemical analyses

Particle-size distribution was determined in disturbed samples using the pipette method [@Teixeira2017], and soil bulk density was obtained by the volumetric-cylinder method [@Teixeira2017] (Appendix 2).

Soil samples were air-dried, sieved through a 2 mm mesh, and homogenized. A subsample was ground with a porcelain mortar and pestle to a fine, uniform powder, and then sieved again through a 150 μm (100 mesh) sieve. Total nitrogen (Ntotal) was determined by dry combustion using an elemental analyzer (Model PE-2400 Series II, Perkin Elmer). Total phosphorus (Ptotal) was determined after wet digestion and quantified by colorimetry [@MurphyRiley1962].

Humic substances were extracted using the fractionation procedure recommended by the International Humic Substances Society (IHSS) [@Swift1996]. The method is based on differences in solubility in alkaline and acidic solutions, allowing separation of fulvic acid (FA), humic acid (HA), and humin (Hum). Light organic matter (LOM) was separated by flotation in water [@FragaSalcedo2004]. After humic fractionation, samples were frozen and lyophilized to determine N and P in FA, HA, and Hum. Phosphorus was quantified by the colorimetric method [@MurphyRiley1962]. Nitrogen in the same humic fractions was determined by dry combustion. Phosphorus associated with LOM (P-LOM) was determined by colorimetry [@MurphyRiley1962], and nitrogen associated with LOM (N-LOM) was determined by dry combustion.

Labile phosphorus (labile P) was obtained using the Hedley extraction procedure [@Hedley1982] and quantified by colorimetry [@MurphyRiley1962]. Labile nitrogen (labile N) was determined indirectly by the method of @ShangTiessen1997. N and P stocks were computed from measured concentrations (in bulk soil and in the respective fractions), bulk density, and the thickness of sampled layers.

## 2.5 Construction of the Fuzzy Soil Nutritional Sustainability Index (FSNSI)

FSNSI was developed using a Mamdani inference system [@Mamdani1977] implemented in R (package FuzzyR). The system integrated Total N and Total P stocks (chemical-capital indicators) and bulk density (physical-constraint indicator) as input variables [@Reis2023]. All variables were normalized to a 0-10 scale. For bulk density, an inverse normalization was applied such that lower density corresponds to higher scores.

### 2.5.1 Membership functions and fuzzification

Triangular membership functions were applied to input and output variables, defining three linguistic terms: Low, Medium, and High. Functions were parameterized using empirical quartiles of each variable distribution ($Q_{25}, Q_{50}, Q_{75}$). The general form of the triangular membership function (Eq. 1) is:

$$ \mu_A(x) = \max\left(\min\left(\frac{x-a}{b-a}, \frac{c-x}{c-b}\right), 0\right) $$

where $a$, $b$, and $c$ represent the lower bound, peak, and upper bound, respectively, with parameter sets Low ($0, Q_{25}, Q_{50}$), Medium ($Q_{25}, Q_{50}, Q_{75}$), and High ($Q_{50}, Q_{75}, 10$).

### 2.5.2 Inference rules and defuzzification

The knowledge base consisted of fuzzy rules in an IF-THEN format, using the logical AND operator (minimum) to aggregate antecedents. The activation degree ($\alpha_i$) of each rule was calculated according to Eq. 2:

$$ \alpha_i = \min(\mu_{N}(x_N), \mu_{P}(x_P), \mu_{Bd}(x_{Bd})) $$

where $\mu_N$, $\mu_P$, and $\mu_{Bd}$ denote the membership degrees of the N stock, P stock, and bulk density inputs, respectively.

The final FSNSI value was obtained by centroid defuzzification (Eq. 3):

$$ \hat{z} = \frac{\int z \cdot \mu_{FSNSI}(z) \, dz}{\int \mu_{FSNSI}(z) \, dz} $$

FSNSI ranges from 0 to 10 and was interpreted as: Low Sustainability (0.0-3.3), Intermediate Sustainability (3.4-6.6), and High Sustainability (6.7-10.0).

## 2.6 Data analysis

Data were analyzed using multivariate generalized linear models (GLM; R package stats) with bootstrap resampling (n = 1000) to evaluate land-use and soil-depth effects on N and P fractions, stocks, and FSNSI. The GLM framework was adopted instead of traditional ANOVA due to non-normality and heteroscedasticity (Shapiro-Wilk, p < 0.01). A Gamma distribution was selected based on lower AIC and BIC compared with normal and log-normal distributions [@Akaike1974; @McCullaghNelder2019]. Model adequacy was confirmed by residual analysis (Deviance/df < 1) and absence of overdispersion [@CameronTrivedi1990]. Following current recommendations on reporting effect sizes alongside significance levels, land-use effects on FSNSI were quantified as exponentiated coefficients (Exp(B)) with bootstrap 95% confidence intervals, which express effect magnitude on the original response scale and are more informative for practical interpretation than significance tests alone, because a significance test only indicates departure from the null whereas Exp(B) quantifies the predicted mean under each treatment condition.

Multivariate significance was assessed using Pillai, Wilks, Hotelling, and Roy statistics. Pairwise comparisons used Bonferroni correction. Exploratory analyses included principal component analysis (PCA) on the correlation matrix of standardized variables, hierarchical clustering analysis (HCA, Ward.D2 linkage, Euclidean distance), and Pearson correlation to assess linear associations among variables.

Structural relations were modeled using partial least squares regression (PLSR) and PLS-SEM to identify key predictors (VIP > 1.0). The structural model was specified as a second-order hierarchical component model (HCM), and land-use contrasts were evaluated by PLS multi-group analysis (PLS-MGA). Analyses were conducted in R [@RCoreTeam2024] using FactoMineR, factoextra, ggplot2, seminr (PLS-SEM and PLS-MGA), and boot (bootstrap resampling).

In the PLSR workflow, all predictors were standardized (mean-centered and scaled to unit variance) prior to model fitting [@MevikWehrens2007] to ensure equal contribution of variables measured on different scales, and latent components were estimated with leave-one-out cross-validation (LOO-CV) to control overfitting under correlated predictors. Two PLSR models were fit, one for the nitrogen system and one for the phosphorus system. In the nitrogen model, the dependent variable was total nitrogen stock (EstNT), with independent variables representing operational fractions and their stocks (NLabil, NMOL, NTAF, NTAH, NTHum, EstNLabil, EstNMOL, EstNAF, EstNAH, and EstNTHum). In the phosphorus model, the dependent variable was total phosphorus stock (EstPT), with analogous independent variables (PLabil, PMOL, PTAF, PTAH, PTHum, EstPLabil, EstPMOL, EstPAF, EstPAH, and EstPTHum).

The modeling dataset comprised 200 observations derived from five land-use classes, five replicate trenches per class, and eight depth intervals per trench. Two latent variables were retained for both nutrient systems. In both models, the first latent variable explained 49.43% of response variance and the second latent variable increased cumulative explained response variance to 94.49%.

# 3. Results and Discussion

## 3.1 Dynamics of nitrogen and phosphorus fractions

Humic fractions accounted for a median of 76.0% of total N (IQR: 74.48% to 79.45%; range: 72.09% to 82.85%), indicating dominance of high-inertia reservoirs in Cerrado Oxisols. In the PLSR latent space (Figure 3), humic fractions show directional coherence with total nitrogen, supporting this mass-balance hierarchy.

Labile fractions accounted for a median of 12.18% of total nitrogen content in the soil profile (IQR: 11.47% to 12.73%; range: 9.09% to 13.77%), whereas the residual fraction showed a median of 11.47% (range: 3.38% to 18.83%). For phosphorus, the compartment ordering preserved the humic dominance observed for nitrogen, supporting co-stratification of macronutrients within an organomineral framework consistent with mineral-associated organic matter [@Lavallee2020], in which preferential association with silt and clay and physical protection in microaggregates reduce microbial accessibility and prolong element residence time [@Spohn2024].

In Figure 3, the TN–humic alignment is consistent with the 76.0% median humic share of total N and the observed compositional hierarchy, where most N is allocated to fractions with higher structural complexity. Mechanistically, this dominance implies that N retention is governed by progressive incorporation into organic networks with low biodegradability and by interactions with mineral surfaces that impose physicochemical barriers to enzymatic access [@kleber2015; @Celi2022], reinforcing a dynamic of immobilization and continuous re-stabilization.

Because humification transfers mass from a high-turnover compartment to a persistent compartment, the labile fraction tends to act as a short-term reservoir rather than a determinant of long-term stocks, consistent with its lower proportional contribution and higher sensitivity to disturbance and microclimate [@Carvalho2023].

In the nitrogen PLSR model, EstNT was treated as the dependent variable and the fraction variables as predictors, with two latent components retained after cross-validation [@MevikWehrens2007].

The first component captured the dominant covariance structure between total stock and humic fractions, explaining 49.43% of response variance, and the second component improved separation of labile and mineral-associated contributions, raising cumulative explained variance to 94.49%.

![Figure 3. Structural correlation biplot of the nitrogen PLSR model (two latent components). Land-use systems are distinguished by symbol shape and color.](../../../2-FIGURAS/biplot_plsr_nt.png){#fig:3 width=70%}

*Note. Total N stock = total nitrogen stock (dependent variable); FA-N = fulvic acid nitrogen; HA-N = humic acid nitrogen; Humin-N = humin nitrogen; Labile N = labile nitrogen; LOM-N = light organic matter nitrogen. The suffix "stock" denotes stock-level variables (e.g., FA-N stock = fulvic acid nitrogen stock).*

In highly weathered Oxisols, phosphorus cycling is constrained by specific adsorption to Fe and Al oxides (ligand exchange), which increases chemical impedance to biological turnover. Organic matter modulates P availability by competing for reactive sites and favoring incorporation into persistent organomineral pools, consistent with @Gerke2022. In the phosphorus PLSR model, EstPT was treated as the dependent variable and phosphorus fractions were used as predictors with two latent components retained after cross-validation.

Predictive consistency of this model is shown by the observed versus predicted relationship for phosphorus, where the trend indicates a coherent model response across land-use systems (Figure 4).

![Figure 4. Observed versus predicted total phosphorus stock in the PLSR model. The dependent variable is total phosphorus stock (Total P stock). ](../../../2-FIGURAS/predicoes_pt.png){#fig:4 width=70%}
*Note: Each point represents one observation, colored by land-use system. The trend line indicates the linear fit between observed and predicted values.*

The convergence between nitrogen and phosphorus patterns in the multivariate space reinforces the hypothesis of stoichiometric coupling during SOM formation and maturation [@Qaswar2019]. Retention of one nutrient conditions retention of the other through shared routes of microbial processing and physicochemical protection [@Celi2022], rather than independent trajectories governed only by mineral reactivity. This is consistent with the principle that microbial immobilization of N is modulated by carbon quality and, concomitantly, conditions the capture of P in more persistent organic forms [@Cao2021].

In highly weathered Oxisols, this co-stabilization occurs under intense competition for reactive sites on Fe and Al oxides. Organic matter thereby modulates P by interfering with specific phosphate sorption and favoring incorporation into more persistent organomineral fractions [@YangPost2011].

In the context of aggregates and organo-mineral associations, the role of Fe and Al as a bridge between microbially processed organic matter and mineral surfaces provides a plausible mechanism for the persistence of P associated with organomineral matrices in highly weathered soils [@Wagai2020].

Preserved Cerrado showed the highest humic contribution (median 82.0%) and the lowest residual fraction (4.96%), whereas agriculture showed the lowest humic contribution (median 73.0%) and the highest residual fraction (17.15%) [@Ferreira2021]. When comparisons are summarized into three macro-systems (native vegetation, forest plantations, and agriculture), this ordering reduces interpretive ambiguity.

Forest plantations showed an intermediate condition (median 76.0% humic contribution; residual 11.47%), suggesting that the transition from native Cerrado to arboreal systems maintained a substantial part of the stabilization architecture while redistributing mass among compartments, consistent with organomineral protection mechanisms [@Paul2016] and contrasting pathways between particulate and mineral-associated organic matter [@Gmach2018].

Total nitrogen stocks per layer ranked in decreasing order as Teak (median EstNT = 1.383 Mg ha⁻¹), Eucalyptus (1.335 Mg ha⁻¹), Mahogany (1.295 Mg ha⁻¹), Agriculture (1.171 Mg ha⁻¹), and Cerrado (1.124 Mg ha⁻¹), corresponding to increases of 23.0%, 18.8%, 15.2%, and 4.1% relative to the native baseline. The higher stock observed in agriculture likely reflects sustained mineral-N additions through fertilization cycles (Table 1), which supplement organically derived N [@McMahon2019] and complicate direct comparison with unfertilized native vegetation.

None of the three plantation species is a nitrogen-fixing legume, so the stock gains in silvicultural systems cannot be attributed to biological N fixation and are more plausibly explained by continuous litter input, root turnover, and reduced post-establishment disturbance [@MoraesWS2024; @SouzaAlmeida2021]. Total N stock dynamics should not be equated with bulk SOM trends, because N accumulation reflects the combined outcome of organic-N incorporation, mineral-N retention, and fraction-specific stabilization, processes that may diverge from carbon-driven SOM trajectories [@Gerke2022]. This contrast suggests that stock gains depend primarily on how each management system modulates organic input quality, residence time, and protection within organomineral domains, rather than on input magnitude alone.

The relatively low dispersion of partitioning percentages, especially when compared with the variation in stocks, should be interpreted as a compositional property of a system in which fractions represent a decomposition of the total and are therefore subject to sum constraints and analytical recovery efficiency, not as evidence of absent dynamics [@Aitchison1986]. In process-engineering terms, this indicates that dominant control lies in the transfer flux among compartments and in the balance between stabilization and loss, rather than in large fluctuations in percentage distribution, reinforcing the role of fraction dynamics and structural stability as regulators of long-term stock resilience [@Jensen2020].

## 3.2 Structural mechanisms of nutrient stabilization

In the structural model, humic-to-total path coefficients exceeded 1.2 and labile-to-total coefficients were approximately −0.3 (Figure 5), indicating that chemical-capital accumulation is governed by stabilization in fractions with greater temporal inertia. These negative labile coefficients should be interpreted as a mass-transfer signature between a high-turnover reservoir and a persistent reservoir, compatible with humification kinetics and the transient nature of the labile compartment, rather than as a functional penalty [@HairJr2021].

![Figure 5. Second-order hierarchical component model (HCM) integrating functional fractions of nitrogen and phosphorus via PLS-SEM. First-order constructs are Humic N (fulvic acid N, humic acid N, humin N), Labile N (labile N, light organic matter N), Humic P (fulvic acid P, humic acid P, humin P), and Labile P (labile P, light organic matter P).](../../../2-FIGURAS/analise_caminhos_pls.png){#fig:5 width=80%}

*Note. Second-order endogenous constructs are Total N and Total P. Solid arrows indicate positive paths and dashed arrows indicate negative paths. Coefficient ranges across the five land-use systems are shown on each edge.*

As proposed by @Lehmann2015, the continuum model of SOM implies that labile compounds are continuously processed and stabilized. In this framework, a high stock of labile N or P that does not translate into humic N or P indicates interrupted humification or excessive mineralization, typical of conventionally tilled agriculture. Conversely, balanced coefficients in Cerrado and Eucalyptus systems indicate an active flux of labile inputs into stable reserves [@Gmach2018].

The symmetry between N and P pathways in the structural model reinforces the concept of biogeochemical co-stabilization. @MarinhoJunior2021 reported that, in Brazilian Cerrado soils, disruption of this coupling (e.g., excessive P fertilization without organic inputs) can reduce SOM quality. Our results extend this interpretation by indicating that this coupling can be maintained under silvicultural transitions, provided that the soil physical structure is preserved.

The global PLS-SEM fit corroborated the structural adequacy of the model, with R² = 0.959 for both N total and P total endogenous constructs, SRMR below 0.06 and composite reliability exceeding 0.97 [@HairJr2021], and average variance extracted (AVE) above 0.95 [@Henseler2015], collectively indicating that the latent constructs capture more than 95% of indicator variance under satisfactory discriminant validity.

## 3.3 Functional heterogeneity among land uses

Multi-group analysis showed humic coefficients ranging from β = 1.180 (agriculture) to β = 1.372 (teak), indicating that management alters stabilization pathways (Table 2). Native Cerrado showed high humic coefficients (β = 1.286), representing a functional baseline in which nutrient cycling is tightly coupled and efficient.

Agriculture showed a reduction in humic efficiency (β = 1.180), consistent with @Silva2024, who reported that Cerrado conversion to agriculture accelerates particulate organic matter oxidation. Physical aggregate disruption by tillage exposes previously protected organic matter to microbial attack [@Purwanto2020; @Assuncao2019], thereby decoupling N and P cycles.

**Table 2. Path coefficients stratified by land use.**

| Land use | Humic N → Total N | Labile N → Total N | Humic P → Total P | Labile P → Total P |
| --- | --- | --- | --- | --- |
| Cerrado | 1.286 | -0.313 | 1.286 | -0.313 |
| Agriculture | 1.180 | -0.237 | 1.180 | -0.237 |
| African mahogany | 1.271 | -0.277 | 1.271 | -0.277 |
| Eucalyptus | 1.275 | -0.283 | 1.275 | -0.283 |
| Teak | 1.372 | -0.445 | 1.372 | -0.445 |

*Note. Standardized values indicate the magnitude of structural relations in each environment.*

Among silvicultural systems, Eucalyptus (β = 1.275) and African mahogany (β = 1.271) closely approximated native Cerrado functionality. This resilience may be attributed to the maintenance of a permanent litter layer and the absence of soil disturbance after plantation establishment. @StLuce2022 reported that deep-rooted tree plantations can pump nutrients from subsoil layers and redistribute them to the surface via litterfall, effectively closing nutrient cycles.

Teak showed a distinct anomaly, with the highest humic coefficient (β = 1.372) paired with the most negative labile coefficient (β = -0.445). While this may appear favorable in a purely structural reading, the pattern is consistent with a cycling bottleneck associated with low litter decomposability. Teak litter is known for high lignin content and secondary metabolites such as tectoquinone, which can reduce decomposition rates and delay nutrient return to labile pools [@AraujoFilho2025]. Combined with the higher bulk density observed in Teak stands (Appendix 2), the result is consistent with increased physical and biochemical impedance, shifting the system toward accumulation in recalcitrant forms and reducing short-term renewal, a condition associated with functional stagnation in compacted soils [@Locatelli2023].

Plantation ages differ among the evaluated systems (Eucalyptus 5 yr, Mahogany 7 yr, Teak 10 yr; Table 1), reflecting the fact that the sampled areas correspond to land uses already established in the landscape at different dates, which characterizes a space-for-time substitution design [@Pickett1989] in which coexisting systems at different post-conversion stages serve as proxies for temporal trajectories. @Walker2010 demonstrated that such designs yield reliable inferences on soil development when sites share comparable parent material, climate, and topographic position, conditions satisfied here given the uniform Oxisol substrate and the spatial proximity of all evaluated areas within the same farm.

## 3.4 Fuzzy integration of edaphic functionality and the FSNSI

The fitted GLM indicated a statistically significant land-use effect on FSNSI (p < 0.001; Deviance/df = 0.082; Pearson/df = 0.075), and adjusted marginal estimates indicated higher functionality in the Eucalyptus system, whose mean differed significantly from native Cerrado (p < 0.05). Adjusted marginal means ranked in decreasing order as Eucalyptus (Exp(B) = 6.07; 95% CI: 5.45-6.69), Mahogany (Exp(B) = 4.54; 95% CI: 3.98-5.10), Cerrado (Exp(B) = 4.42; 95% CI: 3.80-5.04), Agriculture (Exp(B) = 4.25; 95% CI: 3.68-4.82), and Teak (Exp(B) = 2.77; 95% CI: 2.35-3.19), suggesting that functionality tends to be highest under continuous organic inputs without post-establishment soil disturbance and lowest where biochemical impedance restricts cycling.

Eucalyptus exceeded Cerrado (Exp(B) = 6.07 versus 4.42), but this pattern is conditional on the sampling window and on how the index weights chemical capital (N and P) and physical constraint (bulk density). The result is consistent with higher inputs and limited post-establishment disturbance [@Iversen2022], and evidence indicates that well-managed plantations may surpass native baselines for specific soil functions under optimized inputs [@Tang2023].

Across land uses, FSNSI ranged from 1.56 to 8.57 and shifts in medians and within-use dispersion reveal functional heterogeneity integrated by the fuzzy aggregation (Figure 6).

![Figure 6. Distribution of the Fuzzy Soil Nutritional Sustainability Index (FSNSI) by land use.](../../../2-FIGURAS/boxplot_fsnsi_uso_terra.png){#fig:6 width=70%}

*Note. Different letters indicate significant differences according to Tukey HSD (p < 0.05). Points represent individual values.*

Native Cerrado showed a bimodal distribution (50% low and 40% high functionality), reflecting strong natural vertical stratification [@SouzaAlmeida2021]. The wide FSNSI range (1.56-8.57) captures the contrast between organic-rich, porous surface layers (0-20 cm) and a chemically impoverished, naturally compacted subsoil typical of these Oxisols. Conventional agriculture (Exp(B) = 4.25; 95% CI: 3.68-4.82) showed a tendency toward vertical homogenization (CV = 60.6%), consistent with mechanized tillage mixing layers and reducing structural gradients [@Leal2024]. Although functionality is compromised, 22.5% of samples reached the 'high' class, plausibly due to surface fertilization and residual SOM accumulation [@Camargo2024].

Correlations between FSNSI and nutrient pools were strong (r = 0.616–0.789; p < 0.001), supporting the internal coherence of the index (Table 3). FSNSI responds simultaneously to persistent chemical capital and short-turnover capital while penalizing physical impedance via bulk density, consistent with the principle that robust soil quality indicators must integrate physical, chemical, and biological attributes rather than rely on isolated measurements [@DoranParkin1994]. This integrative property reduces the interpretive complexity typical of univariate readings and shifts the assessment from fertility to functionality, where stabilization, cycling, and physical constraints coexist as coupled components of system performance, an approach recently validated for physical indicators of Oxisols under contrasting land uses by @Cavalcante2021.

The positive association with total pools indicates that the indicator captures long-term nutrient storage, a relationship consistent with the role of organic matter in sustaining soil water retention and nutrient buffering capacity [@Lal2020]. The negative association with bulk density indicates that structural compaction constrains edaphic performance by reducing effective pore space for gas and water transfer, in agreement with the mechanistic framework relating bulk density to aeration, hydraulic conductivity, and root impedance established by @Letey1985.

## 3.5 How FSNSI improves interpretation of N and P functional dynamics

The FSNSI framework improves interpretation because it converts multivariate and partially collinear soil information into a single response variable that preserves mechanistic meaning across land uses [@Karlen1997], addressing the recognized challenge that multivariate soil assessments produce indicators difficult to compare directly when evaluated in isolation [@Bunemann2018]. Instead of evaluating isolated concentrations or stocks, the index integrates persistent nutrient capital, represented by total and humic-associated pools, with short-turnover pools and with physical impedance represented by bulk density, following the multicriteria aggregation rationale demonstrated by @MoraHerrera2020 for fuzzy-based soil quality scoring.

This joint representation allows direct comparison of functional states among management systems [@Andrews2002] while maintaining sensitivity to the balance between stabilization and renewal, a property identified as necessary for soil quality indices intended to discriminate among land-use trajectories [@MukherjeeLal2014]. In practical terms, the model identifies whether higher stocks are associated with effective co-stabilization in humic compartments or with transient accumulation under structural restriction, which is necessary for distinguishing resilient from vulnerable nutrient regimes. By combining PLS-based structural evidence with fuzzy aggregation, FSNSI therefore extends descriptive comparisons into an operational decision metric for monitoring, prioritization, and management targeting, consistent with the call for comprehensive and quantitative indices that move beyond isolated indicators toward integrated soil health assessment [@Rinot2019].

**Table 3. Pearson correlation coefficients between soil variables and FSNSI.**

| Variable | Correlation (r) | p-value |
| --- | --- | --- |
| Total N | +0.789 | < 0.001 |
| Total P | +0.789 | < 0.001 |
| Labile N | +0.627 | < 0.001 |
| Labile P | +0.627 | < 0.001 |
| Humic N | +0.616 | < 0.001 |
| Humic P | +0.616 | < 0.001 |
| Bulk density | -0.424 | < 0.001 |
| Sand | -0.439 | < 0.001 |
| Clay | +0.267 | 0.001 |
| Silt | +0.230 | < 0.001 |

## 3.6 Limitations and scope

Direct SOC measurements were outside the scope of this initial survey, yet the N and P fractionation across humic and labile pools captures the dominant variance in SOM functionality [@Paul2016] and provides a self-consistent basis for all structural relations estimated by PLS-SEM. Future campaigns that incorporate SOC quantification would enable computation of stoichiometric ratios and further refine the mechanistic interpretation of organomineral coupling [@Lehmann2015].

The dataset originates from a single sampling campaign, a cross-sectional snapshot common in baseline monitoring and comparative land-use studies on established systems [@Vereecken2018]. The consistency of the observed contrasts with independent studies conducted under comparable Cerrado conditions [@Gmach2018; @Ferreira2021] supports the representativeness of the patterns, and temporal replication would allow seasonal stability of FSNSI to be assessed as a monitoring indicator [@Toth2018].

The space-for-time substitution design, widely employed in soil-development research [@Pickett1989], introduces stand-age heterogeneity as an inherent constraint. @Walker2010 showed that such designs yield reliable inferences when sites share parent material, climate, and topographic position, conditions satisfied here by the uniform Oxisol substrate and spatial proximity of all areas within the same farm. Paired chronosequence designs would provide additional control over age effects in future investigations.

# 4. Conclusion

The results suggest that soil nutrient functionality in Cerrado Oxisols is primarily regulated by humic retention mechanisms, with bulk density acting as a mediating constraint on biogeochemical fluxes. The proposed FSNSI differentiated among land-use systems, providing an operational indicator that integrates chemical capital and physical constraint into a single metric for environmental monitoring and assessment. FSNSI may enable management prioritization by identifying systems with compromised functionality, such as conventional agriculture, while highlighting silvicultural alternatives that maintain stabilization architecture. The capacity of FSNSI to synthesize biogeochemical relationships into an interpretable metric may contribute to soil functionality assessment in tropical environments, and its coupling with spatial data layers can support prioritization and routine monitoring within land-management programs.

## Funding

The authors received no specific funding for this work.

## Competing interests

The authors declare that they have no competing interests.

## Ethics approval

Not applicable.

## Author Contributions Statement

RNAF: Renisson Neponuceno de Araújo Filho; LDVS: Luiz Diego Vidal Santos; FSRH: Francisco Sandro Rodrigues Holanda; AP: Alceu Pedrotti; OCL: Olavo da Costa Leite; LMP: Ludmilla Morais Pereira; MBSS: Mateus Barbosa Santos da Silva; JMS: Jémison Mattos dos Santos. Conceptualization: RNAF, LDVS, FSRH, AP. Methodology: RNAF, LDVS, FSRH, AP. Formal analysis: LDVS, JMS. Investigation: RNAF, OCL, LMP. Data curation: LDVS, MBSS, JMS. Visualization: LDVS, MBSS. Writing – original draft: LDVS. Writing – review & editing: RNAF, LDVS, FSRH, AP, OCL, LMP, MBSS, JMS. Supervision: RNAF, FSRH, AP. Project administration: RNAF. Funding acquisition: None. All authors read and approved the final manuscript.

## Data availability

The dataset used in this study is available in the project repository at https://doi.org/10.5281/zenodo.18077256.

# References

::: {#refs}
:::
