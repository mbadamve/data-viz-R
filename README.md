# Spotify's Top Artists, Songs, Trends

## Poster Description:

Spotify is an international brand of music listeners. It has variety of music in any genre, podcasts, radio and more. So, getting insights
from a vast community of music listeners data is meaningful and motivating for ther music listeners. So, what genre is listened by people
around the world, and how are top genres doing over the years and who are their favorite artists are the main questions which we find out in here.

**Audience:** Anyone who is interested to find out which kind of music is listened on Spotify and want to know more.

## Dependencies:
1. RStudio with R installed.
2. tidyverse
3. ggwordcloud 
4. ggpubr
5. Adobe Illustrator (optional) for customizing the poster.

All the above are R packages, they can be installed by using the command install.packages('<package_name>') inside RStudio. For example, to install tidyverse, the command would be install.package('tidyverse')

## The Data Description
The dataset is extracted from
Kaggle containing top songs
of Spotify from 1950 till 2019.
However, I included only recent
songs and popularity greater
than 72. There are around 1992
rows and columns with
different characteristics of
songs and metadata. Of this,
mainly genre, artist, year are
useful for this visualization.

## The Story:
The central figure portrays a variety of trends mainly increase in listeners of 'pop' genre and 'rock' genres. The top genres are derived from considering only popular songs as noted by Spotify. The text figure called 'wordcloud' shows the popular artists in the recent years. The popularity of greenish pinkish genres had been consistent even though the fluctuations in the top geenres. '**Ed Sheeran**' is the listener's favorite.

## Files in the repo:

There is the poster pdf file, .csv data file and the R code file that generates the plots included in the poster.
