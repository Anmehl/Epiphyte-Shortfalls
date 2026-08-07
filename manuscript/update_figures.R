## =============================================================================
## update_figures.R
## Regenerate Figures 2, 3, and Appendix S8/S9 with revised color scheme:
##   well-sampled   → red        (#C0392B or similar warm red)
##   fairly-sampled → light green (#A8D5A2)
##   poorly-sampled → blue       (#2E86AB or similar cool blue)
## Also: remove gray grid-cell borders (border = NA or border = FALSE)
##
## Run from the project root:
##   source("update_figures.R")
## =============================================================================

library(tidyverse)
library(sf)
library(raster)      # or terra, depending on your version
library(tmap)        # or ggplot2 — adapt to whichever you used
library(KnowBR)      # if loading KnowBR outputs

## ── 0. Revised color palette ─────────────────────────────────────────────
## THREE-CLASS SCHEME
##   Class 1: well-sampled   (slope < 0.02)
##   Class 2: fairly-sampled (0.02 ≤ slope ≤ 0.3)
##   Class 3: poorly-sampled (slope > 0.3)
##
## OLD (traffic-light): red = poor,  light green = fair,  cyan = well
## NEW (heatmap):       red = well,  light green = fair,  blue = poor

COL_WELL   <- "#C0392B"   # warm red   — well-sampled
COL_FAIR   <- "#A8D5A2"   # light green — fairly-sampled
COL_POOR   <- "#2E86AB"   # steel blue  — poorly-sampled
COL_NODATA <- "grey90"    # cells with < 10 records (no slope estimated)

## Named vector matching your factor levels — adjust names to match your data
palette_3class <- c(
  "well-sampled"   = COL_WELL,
  "fairly-sampled" = COL_FAIR,
  "poorly-sampled" = COL_POOR,
  "no data"        = COL_NODATA
)

## ── 1. Load your processed spatial data ──────────────────────────────────
## Replace these paths with your actual file paths
# grid_sf   <- read_sf("data/neotropics_grid_55km.gpkg")
# slope_df  <- read_csv("data/KnowBR_slopes_all_families.csv")
# comp_df   <- read_csv("data/KnowBR_completeness_all_families.csv")
#
## Merge slope/completeness onto grid
# grid_fig2 <- grid_sf %>%
#   left_join(slope_df, by = "cell_id") %>%
#   mutate(
#     class_slope = case_when(
#       is.na(slope)  ~ "no data",
#       slope  < 0.02 ~ "well-sampled",
#       slope  > 0.3  ~ "poorly-sampled",
#       TRUE          ~ "fairly-sampled"
#     ),
#     class_slope = factor(class_slope,
#                          levels = c("well-sampled","fairly-sampled",
#                                     "poorly-sampled","no data"))
#   )

## ── 2. FIGURE 2 — Sampling deficiency (slope-based proxy) ────────────────
## Uncomment and adapt to your actual data object names

# families <- c("Araceae","Bromeliaceae","Orchidaceae","Piperaceae","Polypodiaceae")
#
# plot_fig2 <- function(data, family = "All families") {
#   ggplot(data %>% filter(family_name == family | family == "All families")) +
#     geom_sf(aes(fill = class_slope), color = NA) +        # color = NA removes borders
#     scale_fill_manual(
#       values = palette_3class,
#       name   = "Sampling class",
#       labels = c(
#         "well-sampled"   = paste0("Well-sampled (slope < 0.02)"),
#         "fairly-sampled" = paste0("Fairly-sampled (0.02 ≤ slope ≤ 0.3)"),
#         "poorly-sampled" = paste0("Poorly-sampled (slope > 0.3)"),
#         "no data"        = "No data (< 10 records)"
#       )
#     ) +
#     coord_sf(crs = "+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +datum=WGS84") +  # Behrmann
#     labs(title = family) +
#     theme_void() +
#     theme(
#       legend.position  = "bottom",
#       legend.title     = element_text(face = "bold"),
#       plot.title       = element_text(face = "italic", hjust = 0.5)
#     )
# }
#
# ## Combined total + 5 family panels
# fig2_plots <- lapply(c("All families", families), plot_fig2, data = grid_fig2)
# fig2_combined <- patchwork::wrap_plots(fig2_plots, ncol = 3)
#
# ggsave(
#   filename = "figures/Figure2_sampling_deficiency_revised.png",
#   plot     = fig2_combined,
#   width    = 18, height = 12, dpi = 300, bg = "white"
# )
# message("Figure 2 saved.")

## ── 3. FIGURE 3 — Wallacean shortfalls (completeness + R/S ratio) ────────
## Three-way classification uses slope AND completeness AND R/S ratio
## well-sampled:   slope < 0.02  AND completeness > 90%  AND R/S > 15
## poorly-sampled: slope > 0.3   OR  completeness < 50%  OR  R/S < 3
## fairly-sampled: everything else

# grid_fig3 <- grid_sf %>%
#   left_join(comp_df, by = "cell_id") %>%
#   mutate(
#     class_wallacean = case_when(
#       is.na(slope) | is.na(completeness) | is.na(RS_ratio) ~ "no data",
#       slope < 0.02 & completeness > 90 & RS_ratio > 15     ~ "well-sampled",
#       slope > 0.3  | completeness < 50 | RS_ratio < 3      ~ "poorly-sampled",
#       TRUE                                                  ~ "fairly-sampled"
#     ),
#     class_wallacean = factor(class_wallacean,
#                              levels = c("well-sampled","fairly-sampled",
#                                         "poorly-sampled","no data"))
#   )
#
# plot_fig3 <- function(data, family = "All families") {
#   ggplot(data %>% filter(family_name == family | family == "All families")) +
#     geom_sf(aes(fill = class_wallacean), color = NA) +     # color = NA removes borders
#     scale_fill_manual(
#       values = palette_3class,
#       name   = "Wallacean shortfall class",
#       labels = c(
#         "well-sampled"   = "Well-sampled (slope<0.02, comp>90%, R/S>15)",
#         "fairly-sampled" = "Fairly sampled (intermediate)",
#         "poorly-sampled" = "Poorly sampled (slope>0.3, comp<50%, R/S<3)",
#         "no data"        = "No data"
#       )
#     ) +
#     coord_sf(crs = "+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0 +datum=WGS84") +
#     labs(title = family) +
#     theme_void() +
#     theme(
#       legend.position = "bottom",
#       legend.title    = element_text(face = "bold"),
#       plot.title      = element_text(face = "italic", hjust = 0.5)
#     )
# }
#
# fig3_plots    <- lapply(c("All families", families), plot_fig3, data = grid_fig3)
# fig3_combined <- patchwork::wrap_plots(fig3_plots, ncol = 3)
#
# ggsave(
#   filename = "figures/Figure3_wallacean_shortfall_revised.png",
#   plot     = fig3_combined,
#   width    = 18, height = 12, dpi = 300, bg = "white"
# )
# message("Figure 3 saved.")

## ── 4. Figure S8.1 — Gi* spatial clustering ──────────────────────────────
## Colors for Gi* are separate (high cluster = red, low cluster = blue,
## non-significant = grey). No changes needed to the color scheme for S8.1
## UNLESS borders also need removing there.
##
## To remove borders from S8.1 (if using ggplot2):
##   geom_sf(..., color = NA)   # same as above

## ── 5. Figure S9.1 — Frequency distributions ────────────────────────────
## Caption clarification: panels A and B are independent histograms.
## Consider adding panel labels explicitly:
##
# fig_s9_A <- ggplot(grid_data, aes(x = n_records)) +
#   geom_histogram(fill = "steelblue", color = "white", bins = 50) +
#   geom_vline(aes(xintercept = mean(n_records, na.rm=T)),
#              color = "red", linetype = "dashed", linewidth = 0.8) +
#   geom_vline(aes(xintercept = median(n_records, na.rm=T)),
#              color = "black", linetype = "solid", linewidth = 0.8) +
#   labs(x = "Occurrence records per grid cell", y = "Frequency",
#        title = "(A)") +
#   theme_classic()
#
# fig_s9_B <- ggplot(grid_data, aes(x = sp_richness)) +
#   geom_histogram(fill = "darkorange", color = "white", bins = 50) +
#   geom_vline(aes(xintercept = mean(sp_richness, na.rm=T)),
#              color = "red", linetype = "dashed", linewidth = 0.8) +
#   geom_vline(aes(xintercept = median(sp_richness, na.rm=T)),
#              color = "black", linetype = "solid", linewidth = 0.8) +
#   labs(x = "Observed species richness per grid cell", y = "Frequency",
#        title = "(B)") +
#   theme_classic()
#
# fig_s9 <- patchwork::wrap_plots(fig_s9_A, fig_s9_B, ncol = 2)
# ggsave("figures/AppS9_Fig_S9.1_revised.png",
#        fig_s9, width = 12, height = 5, dpi = 300, bg = "white")
# message("Figure S9.1 saved.")

## ── END ──────────────────────────────────────────────────────────────────
message("update_figures.R: all sections completed. Uncomment and run each block.")
