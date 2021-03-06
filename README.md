# Coursera-GettingAndCleaningData-CourseProject

This README describes how run_analysis.r completes the following 5 steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for       each activity and each subject.

The script does not follow the steps in the same order as above. First, the data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Then:
- Load the train and test data
- Combine train and test data for x, y and subject
- Load features.txt and activity_labels.txt
- Add the appropiate labels and activity names and bind to full set
- Extract only the measurements on the mean and standard deviation for each measurement
- Creating the second, independent tidy data set with the average of each variable for each activity and each subject
