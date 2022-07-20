# Preparation

library(ggplot2)
library(tidyverse)
library(here)

sciclasses <- read.csv(here("data", "sci-online-classes.csv"))
glimpse(sciclasses)
length(unique(sciclasses$subject))
length(unique(sciclasses$semester))


# Create side-by-side bar plots -- one group per subject, then bars for each semester

## First we need a contingency table, and convert it to a data frame

results <- data.frame(table(sciclasses$subject, sciclasses$semester))

## Now build the plot

ggplot(data = results, aes(x = Var1, y = Freq, fill = Var2)) + 
  geom_bar(stat = "identity", position = position_dodge(), alpha = 0.75)  +
  ylim(0,150) + 
  labs(x = "Course", y = "Enrollment", title = "Enrollments per semester" )

# Part 2

ggplot(sciclasses, aes(x = TimeSpent_hours, y = percentage_earned)) + 
  geom_point() + 
  labs(x = "Time spent (hours)", y = "Grade (percentage)", caption = "Does one's grade relate to the time spent on the course?")
