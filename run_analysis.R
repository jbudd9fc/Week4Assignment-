## The first portion of this script aims to address the requirements of question
## 1 by downloading the necessary data, reading it into tables and
## creating one single data set


## READS THE FILES INTO DATA TABLES
library(dplyr)
library(reshape2)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(url, temp)
Unzipdir <- unzip(temp)
train_x <- read.table("UCI HAR Dataset/train/x_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
test_x <-  read.table("UCI HAR Dataset/test/x_test.txt")
test_y <-  read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feature_labels <- read.table("UCI HAR Dataset/features.txt")

## The second portion of this script uses regular expressions to identify the 
## columns that measure a mean or standard deviation for a given measurement and
## addresses question 2. It then uses the remaining columns and data sets to 
## create the single data set requested in question 1. 

x_data <- rbind(train_x,test_x)
colnames(x_data) <- feature_labels$V2
column_subset_list <- grep("-mean()|-std()", colnames(x_data))
y_data <- rbind(train_y,test_y)
sub_data <- rbind(subject_train,subject_test)
masterset <- cbind(x_data,y_data)
masterset <- masterset[,column_subset_list]
masterset$subject <- sub_data$V1

## The third component to the code assigns descriptive activity names to the 
## activities in the data set as requested in question 3

y_data <- merge(y_data,activity_labels, by = "V1")
masterset$activity <- y_data$V2

## The fourth component addresses question 4 by appropriately cleaning up
## the variable names

colnames(masterset) <- tolower(colnames(masterset))
colnames(masterset) <- gsub('\\-|\\(|\\)', '', as.character(colnames(masterset)))

## The fifth component melts the data into a new set and performs the 
## calculation required in the fifth question

final_tidy <- melt(masterset, id = c('subject','activity'))
final_t_mean <- dcast(final_tidy,subject+activity ~ variable, mean)
write.table(final_t_mean, file=file.path("tidy.txt"), row.names = FALSE, 
            quote = FALSE)




