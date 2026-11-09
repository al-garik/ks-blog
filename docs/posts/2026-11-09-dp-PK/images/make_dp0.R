# Hero figure: DP vs greedy on a one-compartment IV bolus lattice

suppressPackageStartupMessages({
  library(dplyr)
  library(tidyr)
  library(ggplot2)
})

r <- 0.5
V <- 50
doses <- c(0, 100, 200, 300, 400)
H <- 5

reach <- tibble(t = 0, c = 0)
for (tt in 1:H) {
  prev <- reach %>% filter(t == tt - 1)
  nxt <- tidyr::crossing(prev, dose = doses) %>%
    transmute(t = tt, c = r * c + dose / V) %>%
    distinct()
  reach <- bind_rows(reach, nxt)
}

dp_path <- tibble(
  t = 0:H,
  c = c(0, 6, 5, 4.5, 4.25, 4.125)
)
greedy_path <- tibble(
  t = 0:H,
  c = c(0, 4, 4, 4, 4, 4)
)

dp_edges <- tibble(
  x = 0:(H - 1),
  xend = 1:H,
  y = dp_path$c[1:H],
  yend = dp_path$c[2:(H + 1)]
)
greedy_edges <- tibble(
  x = 0:(H - 1),
  xend = 1:H,
  y = greedy_path$c[1:H],
  yend = greedy_path$c[2:(H + 1)]
)

dose_lab <- tibble(
  x = c(0.5, 1.5),
  y = c(3.55, 6.35),
  label = c("300 mg", "100 mg")
)

col_dp <- "#1F6F8B"
col_greedy <- "#B9770E"
col_ink <- "#1A252F"
col_muted <- "#95A5A6"
col_target <- "#1E8449"
col_lattice <- "#B0B7BD"

p <- ggplot() +
  geom_hline(
    yintercept = 5,
    colour = col_target,
    linewidth = 0.55,
    linetype = "22"
  ) +
  annotate(
    "text",
    x = -0.22,
    y = 5.38,
    label = "target",
    colour = col_target,
    size = 3.2,
    fontface = "italic",
    hjust = 0
  ) +
  geom_point(
    data = filter(reach, c <= 9.2),
    aes(t, c),
    shape = 21,
    size = 2.4,
    stroke = 0.4,
    fill = "white",
    colour = col_lattice,
    alpha = 0.85
  ) +
  geom_segment(
    data = greedy_edges,
    aes(x = x, xend = xend, y = y, yend = yend),
    colour = col_greedy,
    linewidth = 1.05,
    linetype = "22",
    arrow = arrow(length = unit(0.18, "cm"), type = "closed")
  ) +
  geom_segment(
    data = dp_edges,
    aes(x = x, xend = xend, y = y, yend = yend),
    colour = col_dp,
    linewidth = 1.35,
    arrow = arrow(length = unit(0.2, "cm"), type = "closed")
  ) +
  geom_point(
    data = greedy_path,
    aes(t, c),
    shape = 21,
    size = 7.2,
    stroke = 1.05,
    fill = "#FDEBD0",
    colour = col_greedy
  ) +
  geom_point(
    data = dp_path,
    aes(t, c),
    shape = 21,
    size = 8.4,
    stroke = 1.15,
    fill = col_dp,
    colour = "#15485A"
  ) +
  geom_text(
    data = filter(dp_path, t <= 2),
    aes(t, c, label = c),
    colour = "white",
    size = 3.05,
    fontface = "bold"
  ) +
  geom_text(
    data = dose_lab,
    aes(x, y, label = label),
    colour = col_dp,
    size = 3.15,
    fontface = "bold"
  ) +
  annotate(
    "text",
    x = 3.35,
    y = 3.55,
    label = "greedy  (200 then 100 mg)",
    colour = col_greedy,
    size = 3.15,
    fontface = "italic"
  ) +
  scale_x_continuous(
    breaks = 0:H,
    labels = paste0("t = ", 0:H),
    limits = c(-0.35, 5.45),
    expand = c(0, 0)
  ) +
  scale_y_continuous(
    breaks = c(0, 2, 4, 5, 6, 8),
    limits = c(-0.35, 9.35),
    expand = c(0, 0)
  ) +
  labs(
    title = "DP path on a PK dose lattice",
    subtitle = "One-compartment IV bolus  ·  reachable states (open)  ·  target 5 mg/L",
    x = NULL,
    y = "C (mg/L)",
    caption = "Bellman chain:  0  →  6  →  5  →  4.5  →  4.25  →  4.125   (300 mg then 100 mg)"
  ) +
  coord_cartesian(clip = "off") +
  theme_minimal(base_size = 12, base_family = "sans") +
  theme(
    plot.background = element_rect(fill = "white", colour = NA),
    panel.background = element_rect(fill = "white", colour = NA),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(colour = "#EEF1F4", linewidth = 0.4),
    plot.title = element_text(face = "bold", colour = col_ink, size = 16),
    plot.subtitle = element_text(colour = "#5D6D7E", size = 10.5),
    plot.caption = element_text(
      colour = col_dp, face = "bold", hjust = 0, size = 10.2
    ),
    axis.title.y = element_text(colour = col_ink, size = 11),
    axis.text = element_text(colour = col_ink, size = 10.5, face = "bold"),
    plot.margin = margin(14, 18, 12, 14)
  )

ggsave(
  "pictures/post-logo.png",
  p,
  width = 10.2,
  height = 5.15,
  dpi = 200,
  bg = "white"
)

message("wrote pictures/post-logo.png")
