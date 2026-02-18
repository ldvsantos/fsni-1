Ref (Submission ID fc44f6d1-409c-41f9-91ed-4978861fe3b1)

Response to Reviewers (point-by-point)

Dear Editor and Reviewers,

We sincerely thank the reviewers for the thorough and constructive evaluation. Every comment was carefully considered, and the manuscript has been substantially revised. The responses below follow the exact order and wording of each reviewer comment.

---

# Reviewer 1

**R1-1. "The presented data are unbelievable in so small variations."**

We understand the concern. The low variation in compositional percentages (i.e., the proportion each fraction represents of the total) is a mathematical property of compositional data, where fractions sum to a fixed total and are therefore subject to closure constraints and analytical recovery efficiency (Aitchison, 1986). This does not imply absence of dynamics. We added an explicit paragraph in Section 3.1 explaining that dominant control lies in the transfer flux among compartments and in the balance between stabilization and loss, rather than in large fluctuations of percentage distribution. In contrast, absolute stocks (e.g., EstNT) do show substantial variation across land uses.

**R1-2. "All plantations and agriculture areas were shifted from the native forest and in a same time?"**

No, conversion did not occur simultaneously. We inserted a paragraph after Table 1 (Section 2.2) clarifying that stand ages range from 5 years (Eucalyptus) to over 10 years (agriculture), and that the sampling design follows a space-for-time substitution approach. An additional caveat paragraph in Section 3.3 acknowledges that asynchronous conversion constrains direct age-controlled comparison but reflects the real diversity of silvicultural transitions at the landscape scale.

**R1-3. "The explanation of N stock in various soils is weak without any evidences supported from N input and transformation."**

We expanded Section 3.1 to include explicit evidence. The higher stock in agriculture is now attributed to sustained mineral-N additions through fertilization cycles documented in Table 1. For silvicultural systems, stock gains are explained by continuous litter input, root turnover, and reduced post-establishment disturbance. We also state that none of the three plantation species is a nitrogen-fixing legume, eliminating biological N fixation as a confounding factor.

**R1-4. "N accumulation in soil differs greatly from SOM though organic N is co-related to SOM."**

Agreed. We added the following clarification in Section 3.1: "Total N stock dynamics should not be equated with bulk SOM trends, because N accumulation reflects the combined outcome of organic-N incorporation, mineral-N retention, and fraction-specific stabilization, processes that may diverge from carbon-driven SOM trajectories (Gerke, 2022)."

---

# Reviewer 2

## General comments

**R2-G1. "The abbreviation uses are vague."**

All abbreviations were standardized and defined at first use. Section 2.6 now provides a complete list of predictor variables for both PLSR models (NLabil, NMOL, NTAF, NTAH, NTHum, EstNLabil, EstNMOL, EstNAF, EstNAH, EstNTHum, and phosphorus counterparts). Figure labels in scripts and captions use a consistent naming convention (e.g., TN_stock, N_labile, N_humic).

**R2-G2. "The abstract is not an appropriate summary of the paper."**

The abstract was rewritten to include quantitative results for all five land uses in decreasing order, compositional partitioning data (median humic 76.0%, labile 12.18%), structural comparison among systems, and the full FSNSI ranking with adjusted mean values. The conclusion sentence is now directly supported by the preceding results.

**R2-G3. "Several sections are too long (materials and methods; result and discussion)."**

Sections 2.2 (study area) and 2.6 (data analysis) were condensed relative to the first submission. The remaining detail is considered essential for reproducibility. The Results and Discussion were shortened by removing redundant passages and converting the PLS-SEM quality metrics table (former Table 2) into a single in-text sentence.

**R2-G4. "The result section needs to be written separately."**

We acknowledge the preference; however, Forest Ecology and Management accepts combined Results and Discussion, and we believe the integrative format better serves the mechanistic narrative required to interpret the structural model (PLS-SEM) and the fuzzy index jointly with the primary data. This choice was deliberate and consistently maintained.

**R2-G5. "The figure quality is not satisfactory, and fonts are too small to read."**

All ggplot scripts were revised to increase base font size from 14 to 16 pt, label sizes from 3.5 to 5 pt (geom_text_repel), and point sizes from 3 to 4 pt. The figures are now exported at 300 dpi with dimensions that ensure readability at journal column width.

## Specific comments

**R2-S1. "Title should be more precise" (suggested: Impact of Land Use Change on Soil Nitrogen Stocks and Humic Fractions in Latosol from Brazilian Cerrado).**

We appreciate and accept the suggestion. The title was revised to "Impact of Land Use Change on Soil Nitrogen Stocks and Humic Fractions in Latosol from Brazilian Cerrado," which more precisely conveys the scope of the study and the soil–land-use comparison framework.

**R2-S2. Highlights fragmented and unclear.**

The Highlights were entirely rewritten to address the reviewer's concerns. H1 now specifies the land-use change (Cerrado to silviculture and agriculture). All items are finding-based, drawn directly from the quantitative results (76% humic retention, 21% N stock increase in plantations, full FSNSI ranking). The final highlight summarizes the central mechanistic conclusion (N–P co-stabilization) rather than a recommendation, as the reviewer advised.

**R2-S3. "Species names should be in italic" (L10-11).**

Corrected. All Latin binomials appear in italics in the text and in Table 1. The abstract uses common names (Eucalyptus, Mahogany, Teak) for readability and brevity.

**R2-S4. "It is not needed to mention these statistical analyses [in the abstract]" (L14-15).**

The mention of "Gamma GLM" was removed from the abstract. Only the significance level (p < 0.001) and the adjusted means are now reported.

**R2-S5. "Please give an increasing or decreasing order rather than highest and lowest" (L15-16).**

Done. Both the abstract and Section 3.4 now present the FSNSI ranking in strict decreasing order for all five land uses: Eucalyptus (6.07), Mahogany (4.54), Cerrado (4.42), Agriculture (4.25), Teak (2.77). Total N stocks are also presented in decreasing order in Section 3.1.

**R2-S6. "What was the RDA result? What variation it explained?" (L19-20).**

The original manuscript mentioned RDA as an exploratory analysis, which was subsequently replaced by PLSR and PLS-SEM as the primary structural method. The revised manuscript no longer references RDA. PLSR variance explained is reported in Section 2.6 (49.43% for LV1; 94.49% cumulative for LV1+LV2).

**R2-S7. "The conclusion in abstract should be based on given results" (L20-22).**

The abstract conclusion now follows directly from the quantitative results presented immediately before it (FSNSI ranking, humic dominance data, stock comparisons), ensuring that every claim is traceable to a reported finding.

**R2-S8. Introduction: first paragraph should state the reason behind the study.**

The first paragraph was revised to open with the central role of SOM in tropical soils and the consequences of native ecosystem conversion, directly framing the problem motivating this study.

**R2-S9. "Add citations in introduction" (e.g., L76).**

All unsupported statements in the Introduction were given citation support. Every paragraph now contains at least one reference to peer-reviewed literature.

**R2-S10. "From your hypothesis, it is clear that you want to compare forest and agriculture. Cerrado sensu stricto should be specified as native vegetation" (L101-104).**

Cerrado sensu stricto is now explicitly identified as "preserved native vegetation" in both the abstract and Section 2.2, and as "(control)" in Table 1. We note that Cerrado sensu stricto is not a tropical forest; it is a savanna formation (woody savanna) with distinct physiognomy and biogeography. Using "tropical forest" would be taxonomically and phytogeographically incorrect. The standardized name follows the Brazilian Vegetation Classification System (IBGE) and is widely recognized in the international literature.

**R2-S11. "This section offers limited significance and is unnecessarily too long" (L135-192, study area/characteristics).**

Section 2.2 was condensed. The management summary is now structured as a single table (Table 1) with one contextual paragraph and one design-caveat paragraph. The phytosociological survey was moved to Appendix 1.

**R2-S12. "This section is also too long" (L233-270, statistical methods).**

Section 2.6 was streamlined by removing redundant descriptions, but the PLSR and PLS-SEM specifications were retained in full because both reviewers requested additional methodological detail (e.g., DV/IV, components retained, variance explained, bootstrap resampling). We believe the remaining text is the minimum needed for reproducibility.

**R2-S13. "Not clear total N stock of soil or humus fraction" (L275).**

Clarified. The text now reads "Total nitrogen stocks per layer" with the variable name EstNT explicitly defined as total nitrogen stock.

**R2-S14. "There is no need to provide χ² Wald value. The p values are enough" (L274, 279, 280).**

χ² Wald values were removed throughout the manuscript. Land-use effects on FSNSI are now reported as Exp(B) (exponentiated coefficients) with bootstrap 95% confidence intervals. We added a methodological justification in Section 2.6 explaining that Exp(B) quantifies effect magnitude on the original response scale, whereas a significant Wald test only indicates departure from the null. This approach follows current recommendations for reporting effect sizes alongside significance levels.

**R2-S15. "The results are written in a fragmented manner. A trend or increasing/decreasing order should be provided for all treatments" (L275-285).**

Done. Section 3.1 (N stocks) and Section 3.4 (FSNSI) now present all five land uses in strict decreasing order with quantitative values and percentage differences relative to the native baseline. We also adopted the reviewer's suggestion of comparing three macro-systems (native vegetation, forest plantations, agriculture) to reduce interpretative ambiguity, while retaining individual rankings within each group.

**R2-S16. "This is not an abbreviation. This is also redundant" (L275, 282, 289).**

Redundant abbreviation uses were removed and each variable is defined once at first occurrence.

**R2-S17. "Higher stock in agriculture probably due to higher rate of application" (L290).**

Agreed and addressed. Section 3.1 now states: "The higher stock observed in agriculture likely reflects sustained mineral-N additions through fertilization cycles (Table 1), which supplement organically derived N and complicate direct comparison with unfertilized native vegetation."

**R2-S18. "Is there any plantation species that is leguminous?" (L296-300).**

None of the three plantation species (*Eucalyptus* sp., *Khaya ivorensis*, *Tectona grandis*) is a nitrogen-fixing legume. This is now stated explicitly in Section 2.2 (after Table 1) and reiterated in Section 3.1, confirming that biological N fixation does not confound the observed stock differences.

**R2-S19. "How soluble and readily decomposed compounds have higher N?" (L298).**

The original wording about "solubility and decomposability" was removed. The revised text focuses on organic input quality, residence time, and protection within organomineral domains as the mechanisms governing N stock differences.

**R2-S20. "Is this citation from the same forest and region?" (L299-300).**

We replaced the generic reference with Carvalho et al. (2023), which reports stabilization dynamics in managed systems on Brazilian weathered soils, and with Gerke (2022) for the biochemical co-stabilization framework. Both are consistent with the pedoclimatic context of this study.

**R2-S21. "Figure quality is not satisfactory. Font size too small to read" (Fig. 4).**

All figures were regenerated with larger font sizes (base 16 pt, labels 5 pt, points 4 pt) and exported at 300 dpi. The scripts include explicit ggsave() calls with dimensions suitable for journal column width (8 x 7 inches for the PLSR predictions figure).

**R2-S22. "These abbreviations are vague and unclear" (L331-332).**

Variable abbreviations in the PLSR section are now fully defined in Methods (Section 2.6) with separate lists for the nitrogen and phosphorus models.

**R2-S23. "It is expected from you to provide more insights, such as which sites are better in terms of humus and N" (L335-336).**

Section 3.3 now provides the full ranking of humic path coefficients (beta) in decreasing order: Teak (1.372), Cerrado (1.286), Eucalyptus (1.275), Mahogany (1.271), Agriculture (1.180), and Table 2 presents these values for all systems. Each system's functional state is interpreted relative to the Cerrado baseline.

**R2-S24. "Are the age of plantation not same? If so, then how is this comparison between plantation justified?" (L362).**

Plantation ages differ (Eucalyptus 5 yr, Mahogany 7 yr, Teak 10 yr). We added a dedicated paragraph in Section 3.3 explaining that the design follows a space-for-time substitution and that the coefficients capture post-conversion trajectories at different maturity stages. This asynchrony constrains direct age-controlled comparison but reflects the real diversity of silvicultural transitions at the landscape scale.

**R2-S25. "How drought can contribute to mineralization? Mineralization relies on microbial activity, which demands water" (L376-377).**

The reviewer is correct. The sentence linking drought to mineralization was scientifically inaccurate and was removed from the manuscript.

**R2-S26. "Please refer to Singh et al. (2018), Ecological Indicators, 95, 953-963, for interpretation style."**

We reviewed Singh et al. (2018) and adopted a more structured approach to multi-treatment interpretation. Comparisons now follow a consistent sequence: overall trend in decreasing order, identification of macro-groups (native, plantations, agriculture), and mechanistic interpretation for each group.

**R2-S27. "You need to learn how to cite papers at different end of the sentence" (L429).**

Citation formatting was corrected throughout. The manuscript uses Pandoc with APA CSL, which produces "Author and Author (Year)" in narrative citations and "(Author & Author, Year)" in parenthetical citations, following journal requirements.

**R2-S28. "The result and discussion section is too long. At least 1/3 part should be shortened."**

The R&D section was condensed by removing the PLS-SEM quality-metrics table (former Table 2), converting its content to a single in-text sentence, eliminating redundant passages, and tightening mechanistic discussions. The revised section focuses on quantitative evidence with brief mechanistic interpretation, consistent with the reviewer's guidance.

**R2-S29. "Conclusion section is fragmented and written in a monotonous manner. It should be concise."**

The Conclusion was rewritten as two concise paragraphs. The first summarizes the main findings (co-stabilization mechanism, land-use contrasts), and the second addresses FSNSI utility, limitations (single sampling campaign), and recommendations for future validation.

---

We are grateful for the reviewers' detailed and rigorous evaluation, which substantially strengthened methodological transparency, quantitative rigor, and interpretative clarity.

Sincerely,

The Authors
