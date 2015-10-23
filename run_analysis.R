setwd("D:/viferonza/rStudio/gettingAndCleaningData/project/UCI HAR Dataset")

# Reads the main files and load the mesurements into a data.frame.
loadDataFromFiles <- function(file, subjects, activities, features="features.txt") {
    # Read data from measurements file
    data <- read.table(file)
    # Read and append subject for each measurement
    data <-cbind(data, subject=read.table(subjects))
    # Read and append id activity for each measurement
    data <-cbind(data, subject=read.table(activities))

    # Set column names
    names(data)<- read.table(features)[,2]
    names(data)[562]<-"subject"
    names(data)[563]<-"id_activityLabel"

    data
}

# STEP 01,  STEP 04
# Merges the training and the test sets to create one data set (dataCore).

# Load test data
dataCore <-  loadDataFromFiles(file="test/X_test.txt", subject="test/subject_test.txt", activities="test/y_test.txt")

# Load train data
temp <- loadDataFromFiles(file="train/X_train.txt", subject="train/subject_train.txt", activities="train/y_train.txt")

# Merge test and train data
dataCore <- rbind(dataCore, temp)

# STEP 02
# Extracts only the measurements on the mean and standard deviation for each measurement. 
dataCore.statistics <- data.frame( mean = sapply(dataCore[, 1:561], mean), standarDeviation = sapply(dataCore[, 1:561], sd))

# STEP 03
# Load the activity labels
activityLabels <- read.table("activity_labels.txt")

# Merge each measurement with his 
dataCore <- merge(dataCore, activityLabels, by.x= "id_activityLabel",  by.y= "V1", all=TRUE, sort=FALSE)

# Delete id_activityLabel
dataCore$id_activityLabel <- NULL

# Rename activity label column
colnames(dataCore)[563]<-"activity_label"

# STEP 05
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
dataCore.aggdata <-aggregate(dataCore[, 1:561], by=list(subject=dataCore$subject, activity_label=dataCore$activity_label), FUN=mean, na.rm=TRUE)

# Write file
write.table(dataCore.aggdata, file="../average_subject_activity.txt", row.names=FALSE)

# Delete temporal objects
rm(temp)
rm(activityLabels)
