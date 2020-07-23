# Week4Assignment-
Course Project for Getting and Cleaning Data

This script aims to achieve the outcomes requested in the week 4 Coursera assignment. 

The first portion of this script aims to address the requirements of question
1 by downloading the necessary data, reading it into tables and creating one single data set. The second
portion of this script uses regular expressions to identify the 
columns that measure a mean or standard deviation for a given measurement and
addresses question 2. It then uses the remaining columns and data sets to 
create the single data set requested in question 1. The third component to the code assigns 
descriptive activity names to the activities in the data set as requested in question 3

The fourth component addresses question 4 by appropriately cleaning up
the variable names. The fifth component melts the data into a new set and performs the 
calculation required in the fifth question.

The variables used in this project include the following:

train_x // A table of based on the x values of the training set
train_y // A table of based on the y values of the training set
test_x // A table of based on the x values of the test set
test_y // A table of based on the y values of the test set
subject_test // A table of based on the subject values of the test set
subject_train // A table of based on the subject values of the train set
activity_labels // A table of based on the activity values of the train set
feature_labels // A table of based on the feature values of the train set
masterset // a consolidated dataframe of the train and test data
final_tidy // a melted version of masterset melting based on activity and subject
final_t_mean // a table of mean values of the melted table
