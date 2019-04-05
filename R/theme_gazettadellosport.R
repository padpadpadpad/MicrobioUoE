#' Theme to turn plots to have a light pink background
#'
#' @description Theme to make ggplot2 graphs look like they are from the sports newspaper, gazetta dello sport
#' @param base_size Base font size.
#' @param base_family Font family.
#' @export theme_gazettadellosport
theme_gazettadellosport = function(base_size = 12, base_family = "") {

  theme_classic(base_size = base_size, base_family = base_family) %+replace%

    theme(
      # Specify axis options
      panel.grid.major = element_line(color = "grey45", size  =  0.2),
      panel.grid.minor = element_blank(),
      axis.line = element_blank(),
      axis.text.x = element_text(size = base_size*0.8, color = "grey45", lineheight = 0.9),
      axis.text.y = element_text(size = base_size*0.8, color = "grey45", lineheight = 0.9),
      axis.ticks = element_line(color = "grey45", size  =  0.2),
      axis.title.x = element_text(size = base_size, color = "black", margin = margin(10, 10, 0, 0)),
      axis.title.y = element_text(size = base_size, color = "black", angle = 90, margin = margin(0, 10, 0, 0)),
      axis.ticks.length = unit(0.3, "lines"),
      # Specify legend options
      legend.background = element_rect(color = NA, fill = "mistyrose1"),
      legend.key = element_rect(color = "grey45",  fill = "mistyrose1"),
      legend.key.size = unit(1.2, "lines"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = base_size*0.8, color = "grey45"),
      legend.title = element_text(size = base_size*0.8, face = "bold", hjust = 0, color = "grey45"),
      legend.position = "right",
      legend.text.align = NULL,
      legend.title.align = NULL,
      legend.direction = "vertical",
      legend.box = NULL,
      # Specify panel options
      panel.background = element_rect(fill = "mistyrose1", color  =  NA),
      panel.border = element_rect(fill = NA, color = "grey45"),
      # Specify facetting options
      strip.background = element_rect(fill = "mistyrose1", color = "grey45"),
      strip.text.x = element_text(size = base_size, color = "grey45"),
      strip.text.y = element_text(size = base_size, color = "grey45",angle = -90),
      # Specify plot options
      plot.background = element_rect(color = "mistyrose1", fill = "mistyrose1"),
      plot.title = element_text(color = "black", margin = margin(0,0,5,0), hjust = 0, face = "bold", size = base_size*1.4),
      plot.subtitle = element_text(color = "grey45", margin = margin(0,0,5,0), hjust = 0),
      plot.caption = element_text(color = "grey45", size = base_size, face = 'bold', hjust = 1)

    )

}
