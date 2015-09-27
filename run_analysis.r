# Download appropriate packages
#download.packages("reshape2")
#download.packages("dplyr")
#download.packages("plyr")
#library("reshape2")
#library("dplyr")
#library("plyr")

# Download and unzip the dataset:
filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Load the train and test data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# combine train and test data for x, y and subject
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# load features.txt and activity_labels.txt
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# add the appropiate labels and activity names and bind to full set
colnames(subject) <- "subject"
colnames(y) <- "activity"
y$activity_label <- activity_labels[y[,1],2]
colnames(x) <- features[,2]
full_set <- cbind(subject, y, x)

# Extract only the measurements on the mean and standard deviation for each measurement
keep_these <- grep("mean|st", colnames(full_set))
set <- full_set[,c(1:3,keep_these)]

# Now we have a full, properly labeled set for only the mean and standard deviation for 
# each measurement. The last step is creating the second, independent tidy data set with 
# the average of each variable for each activity and each subject
tidy_set <- ddply(set, .(subject, activity), function(x) colMeans(x[, 4:82]))

write.table(tidy_set, "tidy_set.txt", row.name=FALSE)
