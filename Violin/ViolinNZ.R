violNZ.data <- read.csv("~/Downloads/Violin/ViolinTestNZ.csv", header = TRUE, colClasses = c("factor", "factor", "factor", "numeric")) 
aov_result <- aov(Accuracy ~ Group+Letter, data=violNZ.data)
summary(aov_result)

ggplot(violNZ.data, aes(x=Letter, y=Accuracy, fill=Group),cex.lab=10, cex.axis=10, cex.main=10, cex.sub=10) + 
  geom_violinhalf(data = violNZ.data %>% filter(Group == "Mediated")) +
  geom_violinhalf(data = violNZ.data %>% filter(Group == "Non-Mediated"), flip=TRUE) +
  stat_summary(fun.y=mean, geom="point", shape=23, size=2, fill="white") +
  stat_summary(fun.data=mean_cl_normal, geom="errorbar", width=0.2) +
  xlab("Group") +
  ylab("Accuracy")
