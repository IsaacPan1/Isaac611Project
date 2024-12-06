library(pROC)
library(gbm)
library(tidyverse)

set.seed(123)

s <- read.csv('derived_data/euroasia.csv') 

train_ii <- runif(nrow(s)) < .75
train <- s %>% filter(train_ii)
test <- s %>% filter(!train_ii)
model <- gbm(class ~ Latitude + Longitude, data=train, distribution = "bernoulli")

predict_part <- predict(model, newdata = test, type = "response")
roc_curve <- roc(test$class, predict_part)

png("figures/euroasiaroc.png")
plot(roc_curve, main = paste("ROC: AUC =", round(auc(roc_curve), 4)))
dev.off()
