# NLP-Next-Word-Prediction-SBO-Stupid Back-Off Smothing


## Overview

Around the world, people are spending an increasing amount of time on their mobile devices for email, social networking, banking and a whole range of other activities. But typing on mobile devices can be a serious pain.

Next word prediction app generates four predicted next words based on the text you input. The prediction algorithm relies on word frequencies in the English twitter, blogs, and news datasets  provided by Swiftkey.

The word prediction algorithm used in my Next Word Prediction app is a simplified version of Katz's Back-Off algorithm, referred to as Stupid Back-Off (SBO).

## Tasks

- Understanding the problem
- Data acquisition and cleaning
- Exploratory analysis
- Statistical modeling
- Predictive modeling
- Creating a data product
- Creating a short slide deck pitching my product

## Web App page 

![Next Word Pediction (SBO)](https://user-images.githubusercontent.com/73766757/138612282-79f8784e-c3c2-4f32-8546-06948bf80277.png)


## Notes / Learned

- I used sbo package which was availble in R and These objects are a "raw" equivalent of a text predictor.

- Also I didn't Removed Punctuation as it was indicating End of sentences in the model, employed for sentence tokenization (moreover, text belonging to different entries of the preprocessed input vector are understood to belong to different sentences).

- I didn't remove stopwords as it is useful for predicting next word which is usually done in bag of words model  

- Running time of Model Building sbo_predtable is  2.90852351586024  min.  Maxium time is taken for converting VCorpus to corpus in Model building  11.4243470152219  min 


## Contents

### Codes
- Next_Word_Prediction_SBO :- App directory 
  - server.r, ui.r :- Codes of app Server and User interface is present here 
  - Next_Word_Prediction_SBO/Output/ :-  It contain file necessary for app sbo_model.rda & evaluate.rda which is actual model file and prediction over test data respecively also time.rda has time needed to running model in my system

  
 - Exploratory_Analysis_Week_2_assignment.Rmd :- In this Markdown File I did some cleaning and Exploratory analysis on data.\
 - Exploratory_Analysis_Week_2_assignment.html :- html output of above Rmarkdown file
 - Bar plots.R :- Code of bar plot 
 - Basic_Cleaning.R :- cleaning using tm package in R
 - cleaning with quanteda.R :- Trying to achieve cleaning using quanteda package


### Output
- mycorpus.txt :- Corpus created after cleaning raw data
- quanteda_worldcloud.jpg :- Word cloud related to high frequency and with removing stopwords
- Rplot004.png :- Barplot for most frequent trigram words present in sample corpus




## Link

- App : <https://rishikesh.shinyapps.io/Next_Word_Prediction_SBO/>
- Github : <https://github.com/Rishikesh0714/NLP-Next-Word-Prediction-SBO->
- Pitch Pressentation : <https://rpubs.com/RishikeshPillay/814148>
  

