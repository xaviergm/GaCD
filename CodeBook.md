# Code Book for Getting and Cleaning Data
### Getting and Cleaning Data Coursera course, April 2015.

Here you can find a description of the variables, the data and the transformations made to get to the final result.

## Variables that will contain the original data.
The following variables are used during the exercise to transform the data:
1. fileUrl: This is a character variable which holds the URL of the file that needs to be downloaded as the Data Source ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"). It does not contain the original data but it is key in order to download it.
2. X_test: Data frame used to load the data in the X_test.txt file of the unzipped data set. This contains the values of the test data set. Its dimensions are 2947 observations of 561 variables. Contains the normalized values between -1 and +1 of the corresponding variables.
3. X_train: Data frame used to load the data in the X_train.txt file of the unzipped data set. This contains the values of the training data set. Its dimensions are 7352 observations of 561 variables. Contains the normalized values between -1 and +1 of the corresponding variables.
4. y_test: Data frame used to load the data in the y_test.txt file of the unzipped data set. This contains the Activity Classes of the test data set in numerical format from 1 to 6. Its dimensions are 2947 observations of 1 variables.
5. y_train: Data frame used to load the data in the y_train.txt file of the unzipped data set. This contains the Activity Classes of the training data set in numerical format from 1 to 6. Its dimensions are 7352 observations of 1 variables.
6. subject_test: Data frame used to load the data in the subject_test.txt file of the unzipped data set. This contains the subjects that performed each observation in the test data set in numerical format from 1 to 30. Its dimensions are 2947 observations of 1 variables.
7. subject_train: Data frame used to load the data in the subject_train.txt file of the unzipped data set. This contains the subjects that performed each observation in the training data set in numerical format from 1 to 30. Its dimensions are 7352 observations of 1 variables.
8. activity_labels: Data frame used to load the data in the activity_labels.txt file of the unzipped data set. This contains the names of the activities in this data set in numerical format from 1 to 6 and their corresponding descriptive string. Its dimensions are 6 observations of 2 variables. The strings are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.
9. features: Data frame used to load the data in the features.txt file of the unzipped data set. This contains the names of the fields in this data set in numerical format from 1 to 561 and their corresponding descriptive string. Its dimensions are 561 observations of 2 variables.

## Variables used to manipulate the data and come to a single data frame.
1. X_all: Data frame where the observation data of both the training and the test data sets are combined. Its dimensions are 10299 observations of 561 variables.
2. y_all: Data frame where the activity codes of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables.
3. Subject: Data frame where the subject codes of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables.
4. Activity: Data frame where the activity strings of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables. In this variable, the numerical values have already been substituted by the descriptive strings.
5. std_mean: Vector where the numbers of only those columns that include mean or standard deviation values in the data set are captured. Sorted by Column number. It is used as a means to subset the original data set. It is a vector of 79 integers.
6. X_std_mean: Data frame where only those columns that include mean or standard deviation values in the data set are left. Its dimensions are 10299 observations of 79 variables.
7. complete_all: Data frame made from the combination of the Activity data frame, the Subject data frame and the X_std_mean data frame. Its dimensions are 10299 observations of 81 variables.

## Variables used to come to the final requested data frame to be submitted
1. complete_grouped: Data frame resulting from applying the function group_by() to the complete_all data frame in order to group it by Subject and Activity so that the averages of all the other columns can be lately be obtained. Its dimensions are 10299 observations of 81 variables.
2. complete_summarized: Data frame resulting from applying the function summarise_each() to the data frame complete_grouped. Each row contains one activity per subject with the averages of the means and standard deviations of all the observations. Its dimensions are 180 observations of 81 variables.
