# Cleaning 
library(quanteda)
library(dplyr)

# Stored as corpus
mycorpus <- corpus(c(twitter,blog,news))

#â???o is "Mojibake" for " (double -quotes)
mycorpus <- gsub('â???o?','', mycorpus)

mycorpus <- mycorpus %>% tokens(remove_punct = TRUE, remove_numbers = TRUE, 
               remove_url = TRUE, remove_separators = TRUE, 
               remove_symbols = TRUE) %>%
        tokens_wordstem() %>% tokens_tolower()

mycorpus <- tokens_select(mycorpus, stopwords(), selection = 'remove')
mycorpus <- gsub("#", "", mycorpus)


#mycorpus <- tokens_select(mycorpus, 'â' , selection = 'remove')

dfm <- dfm(mycorpus)
dfmtrimmed <- dfm_trim(dfm, min_docfreq = 10, min_termfreq = 20, verbose = TRUE)


#dfm <- dfm(mycorpus) %>%
 #       dfm_remove(stopwords('en')) %>% 
  #      dfm_trim(mycorpus, min_count = 10, min_docfreq = 5)


#textplot_wordcloud(dfm, min_count = 5, max_words = 100, max_size = 8,color = c('blue', 'red') )

library(wordcloud)
mat <- as.matrix(dfmtrimmed)
v <- sort(colSums(mat),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

# wordcloud
png('quanteda_worldcloud.jpg')
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
                       max.words=200, random.order=FALSE, rot.per=0.35, 
                       colors=brewer.pal(8, "Dark2"))
 dev.off()