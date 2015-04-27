# Code Book for Getting and Cleaning Data
### Getting and Cleaning Data Coursera course, April 2015.

Here you can find a description of the variables, the data and the transformations made to get to the final result.

## Variables

# Variables that will contain the original data.

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

# Variables used to manipulate the data and come to a single data frame.

1. X_all: Data frame where the observation data of both the training and the test data sets are combined. Its dimensions are 10299 observations of 561 variables.
2. y_all: Data frame where the activity codes of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables.
3. Subject: Data frame where the subject codes of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables.
4. Activity: Data frame where the activity strings of both the training and the test data sets are combined. Its dimensions are 10299 observations of 1 variables. In this variable, the numerical values have already been substituted by the descriptive strings.
5. std_mean: Vector where the numbers of only those columns that include mean or standard deviation values in the data set are captured. Sorted by Column number. It is used as a means to subset the original data set. It is a vector of 79 integers.
6. X_std_mean: Data frame where only those columns that include mean or standard deviation values in the data set are left. Its dimensions are 10299 observations of 79 variables.
7. complete_all: Data frame made from the combination of the Activity data frame, the Subject data frame and the X_std_mean data frame. Its dimensions are 10299 observations of 81 variables.

# Variables used to come to the final requested data frame to be submitted

1. complete_grouped: Data frame resulting from applying the function group_by() to the complete_all data frame in order to group it by Subject and Activity so that the averages of all the other columns can be lately be obtained. Its dimensions are 10299 observations of 81 variables.
2. complete_summarized: Data frame resulting from applying the function summarise_each() to the data frame complete_grouped. Each row contains one activity per subject with the averages of the means and standard deviations of all the observations. Its dimensions are 180 observations of 81 variables.

## Data description

The data description is here copied from the description files within the downloaded set.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

# The dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

# The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Notes: 
* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## Transformations on the data in order to come to the final result

Firstly, I create working directory structure and move into the directory. This is done in relative terms. So, from wherever the script is located, the directory is created and we move into it.
Next, the required file is downloaded and unzipped.
The required and only the required data files are loaded in R. These are the training and test normalized files, the variable  names, the activities and the subjects.

Then, the two data sets are joined together by means of row binding.

The IDs in the "y_all" data frame are then replaced by their descriptive strings (activity_labels) by the means of a for loop which walks through the entries and replaces the number from 1 to 6 by the string.

Next, we transpose the features data frame and use it as the names for the data set and subset the data to only those columns that are means or standard deviations of the observations. This brings the number of variables down from 561 to 79. 

We then extend the data set by binding to it the Activity and Subject data, which makes then up to 81 variables.

By using then the group_by() and summarise_each() functions from the dplyr package we can obtain the required data set which can be then written to file and uploaded for grading.
