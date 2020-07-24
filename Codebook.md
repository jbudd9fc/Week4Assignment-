The run_analysis.R script conducts the necessary data cleaning and standardization necessary to perform the steps outlined in the week 4 peer-graded assignment and creates
the appropriate tidy dataset. It does so by completing the following steps:

1. Downloading the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

2. Reading the data and assigning each item to variables
feature_labels <- features.txt : 561 observations, 2 variables ## the dimensions tracked by the wearable
activity_labels <- activity.txt : 6 observations of 2 variables ## the types of activities that the subjects were performing when measured
subject_test <- test/subject_test.txt : 2947 observations, 1 variable ## the subjects associated with each row of the test data set
test_x <- test/X_test.txt : 2947 observations, 561 variables ## the test data set x values
test_y <- test/y_test.txt : 2947 observations, 1 variables ## the test data set of y values
subject_train <- test/subject_train.txt : 7352 observations, 1 variable ## the subjects associated with each row of the train data set
train_x <- test/X_train.txt : 7352 observations, 561 variables ## the training data set of x values
train_y <- test/y_train.txt : 7352 observations, 1 variable ## the training data set of y values

3,4,5. Merging the training the test sets to create one data set, assigns appropriate labels and tidys the data and creates the mean tidy sets requested
Masterset : 10299 observations of 81 variablesmasterset ## a consolidated dataframe of the train and test data
final_tidy ## a melted version of masterset melting based on activity and subject
final_t_mean ## a table of mean values of the melted table
