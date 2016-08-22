run_analysis <- function() {
  ## downloading the data
  if(!dir.exists("./data")) {
    dir.create("./data")
  }
  setwd("./data")
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, "dataset.zip", method = "curl")
  unzip("dataset.zip")
  setwd("./UCI HAR Dataset")
  ## opening the tables
  xtest <- read.table("./test/X_test.txt", header = FALSE)
  ytest <- read.table("./test/y_test.txt", header = FALSE)
  subjecttest <- read.table("./test/subject_test.txt", header = FALSE)
  xtrain <- read.table("./train/X_train.txt", header = FALSE)
  ytrain <- read.table("./train/y_train.txt", header = FALSE)
  subjecttrain <- read.table("./train/subject_train.txt", header = FALSE)
  features <- read.table("./features.txt", header = FALSE)
  ## adding the headers and observational information
  names(features) <- c("number", "feature")
  features$feature <- gsub("\\(\\)-", "_", features$feature)
  features$feature <- gsub("\\(\\)", "", features$feature)
  names(ytest) <- "activity"
  names(subjecttest) <- "subject"
  names(ytrain) <- "activity"
  names(subjecttrain) <- "subject"
  names(xtest) <- features$feature
  names(xtrain) <- features$feature
  xtest <- cbind(subjecttest, ytest, "test", xtest)
  names(xtest) <- sub("\"test\"", "treatment", names(xtest))
  xtrain <- cbind(subjecttrain, ytrain, "train", xtrain)
  names(xtrain) <- sub("\"train\"", "treatment", names(xtrain))
  ## combining the tables
  testtrain <- rbind(xtest, xtrain)
  ## setting the activity factor labels
  labels <- read.table("activity_labels.txt", header = FALSE)
  names(labels) <- c("numbers", "activity")
  library(dplyr)
  labels <- labels %>% mutate(activity = tolower(activity)) %>%
    mutate(activity = gsub("walking_", "", activity))
  testtrain$activity <- as.factor(testtrain$activity)
  levels(testtrain$activity) <- labels$activity
  ## arranging the data
  testtrain <- testtrain[order(testtrain$subject, testtrain$activity),]
  rownames(testtrain) <- NULL
  write.table(testtrain, "combinedtable.txt", col.names = TRUE)
  ## subsetting mean and std columns
  meanlist <- grep("mean", names(testtrain))
  std <- grep("std", names(testtrain))
  meanstd <- sort(c(meanlist, std))
  testtrain2 <- subset(testtrain, select = c(1:3, meanstd))
  ## summarizing the data by mean
  testtrainsummary <- testtrain2 %>% group_by(subject, activity, treatment) %>%
    summarize_each(funs(mean))
  ## restores variable names changed by summarize function
  names(testtrainsummary) <- names(testtrain2)
  ## clean final 8 columns of duplicate "Body" term
  names(testtrainsummary)[74:82] <- sub("Body", "", names(testtrainsummary[,74:82]))
  ## final output
  write.table(testtrainsummary, "means_summary.txt", col.names = TRUE, row.name = FALSE)
}
