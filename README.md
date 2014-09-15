This project summarizes data collected from accelerometers within a Samsung Galaxy S smartphone.  The full description of the data collection is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The project data available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This repository contains an R script run_analysis.R which extracts data from the dataset and calculates the average of several of the features in the data set, grouped by test subject and test activity.

Specifically, the R script does:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
