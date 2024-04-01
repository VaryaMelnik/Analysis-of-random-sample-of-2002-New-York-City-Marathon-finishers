library(dplyr)
data(nym.2002, package="UsingR")
males <- filter(nym.2002, gender=="Male")
females <- filter(nym.2002, gender=="Female")

plot(males$age,males$time,xlab="Age",ylab="Time to finish",main=paste("Correlation between age and marathon finishing time for women =",signif(cor(males$age,males$time),2)))
plot(females$age,females$time,xlab="Age",ylab="Time to finish",main=paste("Correlation between age and marathon finishing time for men =",signif(cor(females$age,females$time),2)))

mgroups <- split(males$time,round(males$age)) 
boxplot(mgroups, xlab="Age",ylab="Time to finish", main="Men")

fgroups <- split(females$time,round(females$age)) 
boxplot(fgroups, xlab="Age",ylab="Time to finish", main="Women")

mypar(2,1)
males$age_cut <- cut(as.numeric(males$age), 
      breaks = c(5, 25, 30, 35, 40, 50, 60, 70, 81), 
      labels = c("5-25", "25-30", "30-35", "35-40", "40-50", "50-60", "60-70", "70-81"), right = FALSE)
boxplot(time~age_cut, males, main="Time to finish for different age groups of men")

females$age_cut <- cut(as.numeric(females$age), 
                     breaks = c(5, 25, 30, 35, 40, 50, 60, 70, 81), 
                     labels = c("5-25", "25-30", "30-35", "35-40", "40-50", "50-60", "60-70", "70-81"), right = FALSE)
boxplot(time~age_cut, females, main="Time to finish for different age groups of women")


