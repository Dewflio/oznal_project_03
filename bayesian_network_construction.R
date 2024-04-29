library(magrittr)
library(tidyverse)
library(dplyr)
library(bnlearn)
library(bde)

data <- read_csv("spotify_top_songs_audio_features.csv", col_names = TRUE, num_threads = 4)
head(data)

numeric_columns <- names(data)[sapply(data, is.numeric)]
numeric_columns
numeric_data <- data %>% dplyr::select(numeric_columns)

numeric_correlation_matrix <- cor(numeric_data)
heatmap(numeric_correlation_matrix, 
        col = colorRampPalette(c("blue", "white", "red"))(100),
        symm = TRUE)

network_structure <- bnlearn::hc(numeric_data)
plot(network_structure)

bde_score <- bde(network_structure, numeric_data)
