# Manuscript Files — BITR-25-097 → D&D Resubmission

**Journal:** Diversity and Distributions  
**Title:** Data Shortfalls on Vascular Epiphytes in the Neotropics  
**Last updated:** 2026-08-06

## Folder structure

| Folder | Contents |
|--------|----------|
| `original/` | Original submission to Biotropica (BITR-25-097, 2025-03) |
| `tracked/` | Revised manuscript with tracked changes (current working version for DDI) |
| `supplementary/` | Supporting Information document (tables S1–S3, figures S1–S5) |
| `correspondence/` | Point-by-point response letters to Reviewer 1 and Reviewer 2 |
| `clean/` | Final clean version for submission (to be created after all revisions complete) |

## Files

| File | Description |
|------|-------------|
| `tracked/DDI_revision_tracked.docx` | Main manuscript — all changes tracked (author: Maria Carmona-Higuita) |
| `supplementary/Supporting_Information_DDI.docx` | SI captions: Table S1 (correlations), Table S2 (sensitivity), Table S3 (provinces), Figures S1–S5 |
| `correspondence/Response_to_Reviewer1_DDI.docx` | Point-by-point response — 38 comments (R1.M1–M4, R1.1–R1.38) |
| `correspondence/Response_to_Reviewer2_DDI.docx` | Point-by-point response — 5 structural comments (R2.1–R2.5) |

## Revision status (2026-08-06)

### Completed
- [x] Introduction — Wallacean framing, Hortal et al. 2015, biases vs. shortfalls
- [x] Methods — convergent evidence framing (ρ = 0.86–0.99), classification thresholds explicit
- [x] Methods ln135 — temporal duplicate clarification (tracked change)
- [x] Methods ln142 — Ugland exact estimator, no permutations (tracked change)
- [x] Methods ln168 — Oliveira et al. 2016 citation added (tracked change)
- [x] Results — terminology (Wallacean shortfall throughout), mean → median, Pearson r added
- [x] Abstract + Discussion — terminology standardized, Chanachai et al. 2024 comparison added
- [x] Figure 2 caption — quartiles → three slope-based classes (tracked change)
- [x] Sensitivity analysis — Script 08; threshold 10 records robust (ρ = 1.00 for 5–30)
- [x] Metric correlation analysis — Script 07; Spearman ρ = 0.86–0.99 all pairs
- [x] Biogeographic provinces figure — Script 09; output/figures/Fig_biogeographic_provinces.jpg
- [x] Supplementary — rebuilt with DDI format (Appendix S1–S8, numbered S1.1, S2.1, etc.)
- [x] Hotspot analysis — moved to Appendix S8 (Fig. S8.1); reframed as sampling effort clustering
- [x] Table TS1 → Table S3.1 tracked change in main docx
- [x] Response letters — Reviewer 1 (38 points) and Reviewer 2 (5 points)
- [x] Discussion — data cleaning para moved to Results (tracked change)
- [x] Discussion ln299 — historical survey citation (Gentry & Dodson 1987; Meyer et al. 2016)
- [x] Discussion ln355 — long sentence split into two (tracked change)
- [x] Discussion — limitations paragraph added before conclusion
- [x] OOXML cleanup — all 186 paragraphs verified clean (no malformed w:t elements)

### Pending (before submission)
- [ ] Insert actual Figure 4 image (Fig_biogeographic_provinces.jpg) into docx manually
- [ ] English copyediting — final pass before submission
- [ ] Clean version — create after all tracked changes accepted

### Also completed in this session
- [x] Results §2 (P62, P63) — condensed family-level percentages to key contrasts
- [x] Discussion P75 — citations corrected: Prance et al. 2000 & Gentry & Dodson 1987 properly framed
- [x] Figure 4 — biogeographic provinces caption added (tracked insert); cross-refs in P49, P60, P71

## Key analysis scripts

| Script | Purpose |
|--------|---------|
| `r_scripts/03_Calculating_estimators_&_results_categorisation.Rmd` | KnowBR metrics + 3-class composite |
| `r_scripts/05_Hot_cold_spots_&_raster_creation.Rmd` | Gi* hotspot/coldspot (→ SI Figure S5) |
| `r_scripts/06_Manuscript_summary.Rmd` | Summary stats and paragraph generator |
| `r_scripts/07_Correlation_analysis.Rmd` | Metric correlations → Table S1 |
| `r_scripts/08_Sensitivity_threshold.Rmd` | 10-record threshold sensitivity → Table S2 + Figure S1 |
| `r_scripts/09_Biogeographic_provinces.Rmd` | Provinces map → Fig_biogeographic_provinces.jpg |
