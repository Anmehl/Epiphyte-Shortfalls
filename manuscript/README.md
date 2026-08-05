# Manuscript Files — BITR-25-097 → D&D Resubmission

**Journal:** Diversity and Distributions  
**Title:** Data Shortfalls on Vascular Epiphytes in the Neotropics  

## Folder structure

| Folder | Contents |
|--------|----------|
| `original/` | Original submitted manuscript (BITR-25-097, as submitted to Biotropica) |
| `tracked/` | Revised manuscript with tracked changes (current working version) |
| `clean/` | Final clean version for submission (to be created after all revisions are complete) |
| `supplementary/` | Supplementary data, tables, and figures |

## Status (2026-08-05)

- [x] Introduction — Wallacean framing applied (tracked)
- [x] Methods — proxy descriptions updated; correlation validation added (tracked)
- [x] Results — terminology updated (tracked)
- [x] Abstract + Discussion — terminology updated (tracked)
- [x] Figure captions — updated (tracked)
- [ ] Original manuscript file — add to `original/`
- [ ] 4-category vs. 3-category discrepancy — pending
- [ ] Sensitivity analysis (10-record threshold) — pending
- [ ] Tree comparison analysis — pending
- [ ] Biogeographic provinces figure — pending
- [ ] Supplementary Table SX (metric correlations) — pending
- [ ] Clean version — pending

## Key analysis scripts

| Script | Purpose |
|--------|---------|
| `r_scripts/03_Calculating_estimators_&_results_categorisation.Rmd` | KnowBR metrics + 4-category composite |
| `r_scripts/05_Hot_cold_spots_&_raster_creation.Rmd` | Gi* hotspot/coldspot analysis |
| `r_scripts/06_Manuscript_summary.Rmd` | Summary stats and paragraph generator |
| `r_scripts/07_Correlation_analysis.Rmd` | Metric correlations (addresses Reviewer 1 Pg8 ln156) |
