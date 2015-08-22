# Project Task:
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.

library(reshape2) # required for melt, dcast

# directory with UCI dataset, relative to working directory
uciDatasetDir <- "UCI HAR Dataset"

# read and cbind train data
#trainValues <- read.table(paste(uciDatasetDir, "train/X_train.txt", sep="/"))
#trainActivities <- read.table(paste(uciDatasetDir, "train/y_train.txt", sep="/"))
#trainSubjects <- read.table(paste(uciDatasetDir, "train/subject_train.txt", sep="/"))
trainData <- cbind(trainSubjects, trainActivities, trainValues)

# read and cbind test data
#testValues <- read.table(paste(uciDatasetDir, "test/X_test.txt", sep="/"))
#testActivities <- read.table(paste(uciDatasetDir, "test/y_test.txt", sep="/"))
#testSubjects <- read.table(paste(uciDatasetDir, "test/subject_test.txt", sep="/"))
testData <- cbind(testSubjects, testActivities, testValues)

# 1. Merges the training and the test sets to create one data set.
data <- rbind(trainData, testData)
featureNames <- read.table(paste(uciDatasetDir, "features.txt", sep="/"), stringsAsFactors=FALSE)[,2]
names(data) <- c("Subject", "Activity", featureNames)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
featuresOfInterest <- grep("-(mean|std)\\(\\)", featureNames, value=TRUE)
data <- data[,c("Subject", "Activity", featuresOfInterest)]

# 3. Uses descriptive activity names to name the activities in the data set
activityNames <- read.table(paste(uciDatasetDir, "activity_labels.txt", sep="/"))
data$Activity <- activityNames[data$Activity, 2]

# 4. Appropriately labels the data set with descriptive variable names.
# already done in step 1

# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
dataMelt <- melt(data, id.vars=c("Subject", "Activity"), measure.vars=featuresOfInterest)
tidyData <- dcast(dataMelt, Subject + Activity ~ variable, mean)

# write the tidy dataset
write.table(tidyData, "tidy_data.txt", row.names = FALSE)
