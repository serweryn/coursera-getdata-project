CodeBook for tidy dataset (Getting and Cleaning Data project)
=============================================================

Author: serweryn<br>
Date: August 22, 2015

This codebook describes variables in *tidy_data.txt*, original data from which it was created and all the transformations that were used to create this tidy dataset.

## Variables

Each row of data consists of *id* variables (Subject, Activity) and a set of numeric variables. *Id* variables are unique for each row and numeric variables contain **average values** of the variables from original dataset for this particular Subject and Activity combination.

#### Id variables

Field label | Variable name | Variable type | Comment
------------|---------------|---------------|--------
Subject | Subject number | numeric | Subjects are numbered from 1 to 30
Activity | Activity name | character | Activities names are LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

#### Numeric variables

Numeric variables contain **average values** of the variables with the same names from the original dataset computed for each Subject and Activity combination.

Description of the numeric variables can be found in original dataset in *UCI HAR Dataset/features_info.txt* file, here's a quote of the part of it:

<pre>
Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at 
a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals 
were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag,
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
</pre>

## Original data

This dataset was created from original dataset: *Human Activity Recognition Using Smartphones Data Set* which available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Original dataset was obtained from Getting and Cleaning Data URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Transformations on original data to get *tidy_data.txt*

All transformations were done by *run_analysis.R* script and they are:

1. Read train and test parts of original dataset
2. Merge train and test parts setting proper column names
3. Extract only mean and standard deviation measures from merged dataset
4. Compute **average value** for each measure grouping by Subject and Activity
5. Write *tidy_data.txt*
