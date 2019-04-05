#' Theme to turn plots to have a black background
#'
#' @description Theme to make ggplot2 graphs have a black background. Useful for presentations
#' @param base_size Base font size.
#' @param base_family Font family.
#' @export theme_black

theme_black = function(base_size = 12, base_family = "") {

  theme_classic(base_size = base_size, base_family = base_family) %+replace%

    theme(
      panel.grid.major = element_line(color = "white", size  =  0.2),
      panel.grid.minor = element_blank(),
      # Specify axis options
      axis.line = element_blank(),
      axis.text.x = element_text(size = base_size*0.8, color = "white", lineheight = 0.9),
      axis.text.y = element_text(size = base_size*0.8, color = "white", lineheight = 0.9),
      axis.ticks = element_line(color = "white", size  =  0.2),
      axis.title.x = element_text(size = base_size, color = "white", margin = margin(10, 10, 0, 0)),
      axis.title.y = element_text(size = base_size, color = "white", angle = 90, margin = margin(0, 10, 0, 0)),
      axis.ticks.length = unit(0.3, "lines"),
      # Specify legend options
      legend.background = element_rect(color = NA, fill = "black"),
      legend.key = element_rect(color = "white",  fill = "black"),
      legend.key.size = unit(1.2, "lines"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = base_size*0.8, color = "white"),
      legend.title = element_text(size = base_size*0.8, face = "bold", hjust = 0, color = "white"),
      legend.position = "right",
      legend.text.align = NULL,
      legend.title.align = NULL,
      legend.direction = "vertical",
      legend.box = NULL,
      # Specify panel options
      panel.background = element_rect(fill = "black", color  =  NA),
      panel.border = element_rect(fill = NA, color = "white"),
      # Specify facetting options
      strip.background = element_rect(fill = "black", color = "white"),
      strip.text.x = element_text(size = base_size, color = "white"),
      strip.text.y = element_text(size = base_size, color = "white",angle = -90),
      # Specify plot options
      plot.background = element_rect(color = "black", fill = "black"),
      plot.title = element_text(color = "white", margin = margin(0,0,5,0), hjust = 0, face = "bold", size = base_size*1.4),
      plot.subtitle = element_text(color = "white", margin = margin(0,0,5,0), hjust = 0),
      plot.caption = element_text(color = "white", size = base_size, face = 'bold', hjust = 1)

    )

}
