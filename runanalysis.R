## Script created for the Project Assignment of the Getting and Cleaning Data 
## Coursera course. 2015-04-26

## Before doing anything, load required libraries
library(dplyr)

## Firstly, create working directory structure and move into the directory.
if (!file.exists("./GaCD")) {
        dir.create("./GaCD")
}
setwd("./GaCD")

## Download the required file
fileUrl <- paste("https://d396qusza40orc.cloudfront.net/",
        "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",sep="")
download.file(fileUrl,"./UCI HAR Dataset.zip",method="internal",mode="wb")

## Unzip the required file
unzip("UCI HAR Dataset.zip")

## Load the required Data Files in memory in R.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Merge the training and test data sets into one. This is done by row-binding 
## the training and test data sets together.
X_all <- rbind(X_test,X_train)
y_all <- rbind(y_test,y_train)
Subject <- rbind(subject_test,subject_train)

## Replace the activity IDs in the y_all data frames by their actual string.
Activity <- y_all[,1]
for (i in 1:length(y_all[,1])) {
        Activity[i] <- as.character(activity_labels[y_all[i,1],2])
}

## Use the features vector as the names of the columns in the data set.
names(X_all) <- t(features)[2,]
## Take only those columns with means or standard deviations
std_mean <- sort(c(unlist(grep("std()",names(X_all))),unlist(grep("mean()",
        names(X_all)))))
X_std_mean <- X_all[,std_mean]

## Bind Activity, Subject and the data frame with means and stds only.
complete_all <- cbind(Activity,Subject,X_std_mean)
names(complete_all)[2]<-"Subject"

## Now perform  the required averages using the dplyr package group_by() and
## summarise_each() functions.
complete_grouped <- group_by(complete_all,Subject,Activity)
complete_summarized <- summarise_each (complete_grouped,funs(mean))

## Write table to file
write.table(complete_summarized, file='complete.summarized.txt')