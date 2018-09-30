## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Install and load relevant packages
install.packages('dplyr')
library(dplyr)

## Download data

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile = 'SmartphoneData.zip')
unzip('SmartphoneData.zip')
setwd('UCI HAR Dataset/')


# read in data
testData <- read.table('test/X_test.txt')
trainData <- read.table('train/X_train.txt')

testSubjects <- read.table('test/subject_test.txt')
trainSubjects <- read.table('train/subject_train.txt')

testLabels <- read.table('test/y_test.txt')
trainLabels <- read.table('train/y_train.txt')

activityLabels <- read.table('activity_labels.txt')
features <- read.table('features.txt')



# (1) Combine datasets
allData <- rbind(testData, trainData)
allSubjects <- rbind(testSubjects, trainSubjects)
allLabels <- rbind(testLabels, trainLabels)

# (4) Name variable columns
colnames(allData) <- features[,2]

# (2) Subset mean and std
subsettedData <- allData[,grep("mean\\(\\)|std\\(\\)", features[,2])]

# (3) Replace numbers with names for activity labels
activityLabels[,2] <- as.character(activityLabels[,2])

for(i in 1:length(activityLabels[,1])) {
    allLabels[which(allLabels == i),] <- activityLabels[which(activityLabels[,1] == i), 2]
}

colnames(allLabels) <- "Activity_Type"
colnames(allSubjects) <- "Subject_ID"

# Combine subsetted data with subjects and activities
tidyData <- cbind(allSubjects, allLabels, subsettedData)

# (5) Calculate average of each variable for each activity for each subject
tidyData <- tidyData %>% group_by(Activity_Type, Subject_ID) %>% summarise_all(funs(mean))
write.table(tidyData, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)