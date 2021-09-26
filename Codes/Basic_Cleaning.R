# Cleaning Data

# Sampling using random binomial generation with just 2% probability

set.seed(222)
t <- rbinom(length(twitter_lines), 1, prob = .02)
b <- rbinom(length(blog_lines), 1, prob = .02)
n <- rbinom(length(news_lines), 1, prob = .02)

#subsetting
twitter <- subset(twitter_lines, as.logical(t))
blog <- subset(blog_lines, as.logical(b))
news <- subset(news_lines, as.logical(n))

# Cleaning work space or Ram
rm(list=setdiff(ls(), c("twitter","blog", 'news')))


# divsion of TRAIN and TEST 
mycorpus <- corpus(c(twitter,blog,news))

set.seed(122)
test_index <- rbinom(length(mycorpus), 1, prob = .25)
test <- corpus_subset(mycorpus, as.logical(test_index))
train <- corpus_subset(mycorpus, !as.logical(test_index))

# Cleaning
# load tm package
library(tm)

mycorpus <- VCorpus(VectorSource(c(twitter, news, blog)))
#The result is a structure of type VCorpus ('virtual corpus' that is, loaded into memory)
print(mycorpus)

# perform data cleasing into "myCorpus"" variable
toSpace <- content_transformer(function(x, pattern) gsub(pattern," ", x))

# Removing hyperlink
mycorpus <- tm_map(mycorpus, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")

# Removing tag
mycorpus <- tm_map(mycorpus, toSpace, "@[^\\s]+")
# Making lowercase
mycorpus <- tm_map(mycorpus, content_transformer(tolower))
# Removing stopwords
updatedStopwords <- c(stopwords('en'), "can", "will", "want", "just", "like") 
mycorpus <- tm_map(mycorpus, removeWords, updatedStopwords)
# Removing punctuation
mycorpus <- tm_map(mycorpus, removePunctuation)
# Removing digit
mycorpus <- tm_map(mycorpus, removeNumbers)
# Removing whitespace
mycorpus <- tm_map(mycorpus, stripWhitespace)
#mycorpus <- tm_map(mycorpus, PlainTextDocument)

print(mycorpus)