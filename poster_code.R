install.packages("tidyverse")
library(tidyverse)
library(ggwordcloud)
library(ggpubr)
## Data download link: https://www.kaggle.com/iamsumat/spotify-top-2000s-mega-dataset
data_t <- read.csv('Spotify-2000.csv', stringsAsFactors = FALSE)
head(data_t)
dim(data_t)

hist(data_t$Popularity, xlab = 'Popularity Score', main = 'Frequency of Popularity Scores')
hist(data_t$Year[data_t$Year >= 2010], xlab = 'Year', main = 'Number of songs over the years')

p1 <- data_t %>% filter(Year >= 2010, Popularity > 72) %>% ggplot(aes(Year)) + 
  geom_bar(aes(fill = Top.Genre), width = 0.9)+
  scale_x_discrete(limits = (2010:2019))+
  labs(fill = 'Genre', title = 'Most-listened Songs')+
  ylab('Number of Songs')+
  theme_minimal()+
  theme(panel.grid = element_blank(), 
        legend.position = 'right',
        legend.direction = 'vertical',
        legend.justification = 'right')

word_cloud<- data_t %>% 
  filter(Year >= 2010, Popularity > 72) %>% 
  group_by(Artist) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count))

set.seed(1222)
#p2 <- wordcloud(words = word_cloud$Artist, freq = word_cloud$count,
#          max.words = 200, random.order = FALSE, min.freq = 1,
#         colors = brewer.pal(8, 'Dark2'))

p2 <- ggplot(word_cloud, 
       aes(label = Artist, size = count, 
           color = count)) +
  geom_text_wordcloud_area(eccentricity = 1) +
  scale_size_area(max_size = 50, trans = power_trans(1/.7)) +
  theme_minimal()+
  scale_color_continuous()+
  labs(title = 'Top Artists over the years')

data_top_genre  <- data_t %>% 
                      filter(Year >= 2010, Popularity > 72) %>%
                      group_by(Top.Genre) %>% 
                      summarise(count = n()) %>% 
                      arrange(desc(count))

top_genres <- data_top_genre[(1:5),1]$Top.Genre
data_w_top_genres <- data_t %>% 
  filter(Year >= 2010, Popularity > 72, Top.Genre %in% top_genres) 

p3 <- data_w_top_genres %>% 
  ggplot(aes(x = Year, fill = Top.Genre))+
  geom_density(alpha = 0.5, adjust = 0.5)+
  facet_wrap(~Top.Genre, ncol = 1)+
  scale_x_discrete(limits = (2010:2019))+
  labs(fill = 'Genre', title = 'Trends of Top 5 genres')+
  ylab('Number of Songs')+
  theme_minimal()+
  theme(panel.grid = element_blank(), 
        legend.position = 'none',
        axis.text.y = element_blank())

ggarrange(p1, ggarrange(p3, p2, ncol = 2), nrow = 2, heights = 1)
