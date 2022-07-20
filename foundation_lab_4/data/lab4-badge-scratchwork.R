library(dplyr)
library(here)

install.packages("plyr")
library(plyr)

survey <- read.csv("~/GitHub/foundational-skills/foundation_lab_4/data/inst_practices.csv")
summary(survey)
glimpse(survey)
head(survey)
?revalue()

#example2 <- revalue(example, c("Daily"= "3", "Never"= "-3", "Often"= "1",
"Very Often"= "2", "Important" = "3", "Very Important"= "3",
"Neutral"= "0", "Not Important"= "-3" ))  

test_revalue <- revalue(survey$liveqa, c("Very infrequently" = 1, 
                                         "Infrequently" = 2,
                                         "A moderate amount" = 3,
                                         "Frequently" = 4,
                                         "Very frequently" = 5))

glimpse(test_revalue)

# To do this right: 
# - Remove NA's and "not applicables" 
# - Revalue
# - But do it so that the results are numbers not strings 

test_revalue_2 <- survey %>%
  filter(!grepl("Not applicable to my course"), liveqa)
