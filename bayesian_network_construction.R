library(magrittr)
library(tidyverse)
library(dplyr)
library(bnlearn)

data <- read_csv("spotify_top_songs_audio_features.csv", col_names = TRUE, num_threads = 4)
head(data)

numeric_columns <- names(data)[sapply(data, is.numeric)]
numeric_columns
numeric_data <- data %>% dplyr::select(numeric_columns)

network_structure <- bnlearn::hc(numeric_data)
plot(network_structure)

bde_score <- bde(network_structure, numeric_data)
