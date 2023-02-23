viol.data <- read.csv("ViolinTest.csv", header = TRUE, colClasses = c("factor", "factor", "factor", "numeric")) 
aov_result <- aov(Accuracy ~ Group+Letter, data=viol.data)
summary(aov_result)

# Create violin plot
library(ggplot2)
library(tidyverse)
library(see)

ggplot(violAM.data, aes(x=Letter, y=Accuracy, fill=Group),cex.lab=10, cex.axis=10, cex.main=10, cex.sub=10) + 
  geom_violinhalf(data = violAM.data %>% filter(Group == "Mediated")) +
  geom_violinhalf(data = violAM.data %>% filter(Group == "Non-Mediated"), flip=TRUE) +
  stat_summary(fun.y=mean, geom="point", shape=23, size=2, fill="white") +
  stat_summary(fun.data=mean_cl_normal, geom="errorbar", width=0.2) +
  xlab("Group") +
  ylab("Accuracy")


