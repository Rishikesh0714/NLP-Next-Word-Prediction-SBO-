# Barplots
# Unigram
ggplot(freq1[1:10, ], aes(reorder(word,-freq), freq)) +
        labs(x = 'Unigram', y = "Words Frequencies") +
        theme(axis.text.x = element_text(
                angle = 60,
                size = 10,
                hjust = 1
        )) +
        geom_bar(stat = "identity", fill = I("#3ED9ED")) +
        coord_flip() +  ggtitle("Most frequent Unigram words") +
        theme(plot.title = element_text(hjust = 0.5)) +
        theme(plot.title = element_text(size = 15))

#Bigram
ggplot(freq2[1:10, ], aes(reorder(word,-freq), freq)) +
        labs(x = 'Bigram', y = "Words Frequencies") +
        theme(axis.text.x = element_text(
                angle = 60,
                size = 10,
                hjust = 1
        )) +
        geom_bar(stat = "identity", fill = I("#3ED9ED")) +
        coord_flip() +  ggtitle("Most frequent Bigram words") +
        theme(plot.title = element_text(hjust = 0.5)) +
        theme(plot.title = element_text(size = 15))

# Trigram
ggplot(freq3[1:10, ], aes(reorder(word,-freq), freq)) +
        labs(x = 'Trigram', y = "Words Frequencies") +
        theme(axis.text.x = element_text(
                angle = 60,
                size = 10,
                hjust = 1
        )) +
        geom_bar(stat = "identity", fill = I("#3ED9ED")) +
        coord_flip() +  ggtitle("Most frequent Trigram words") +
        theme(plot.title = element_text(hjust = 0.5)) +
        theme(plot.title = element_text(size = 15)) 