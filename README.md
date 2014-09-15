This project summarizes data collected from accelerometers within a Samsung Galaxy S smartphone.  The full description of the data collection is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The project data is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This repository contains an R script run_analysis.R which extracts data from the dataset and calculates the average of several of the features in the data set, grouped by test subject and test activity.

Generally, the R script performs:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The detailed description of the script follows:

1. Read the training and test data
2. Merge training and test sets to one data set
3. Read in the features.txt file which contains a description of each column in the dataset
4. Find the index for all features with "mean()" or "std()" in the description
5. Use the index on the dataset to extract the desired features
6. Label the columns with descriptive names from the features file
7. Read the label data for training and test data
8. Merge training and test labels
9. Read the activities labels
10. Name the fields in the labels and activity_labels tables
11. Merge labels and activity labels
12. Read the subject data
13. Merge training and test subjects
14. Merge subject data, activity labels, and extracted feature columns
15. Calculate the means of all columns by subject and activity
16. Write the data to output file tidyDataSet.txt

To re-create the resulting tidy data set, download it and the project data into a local directory and execute run_analysis.R.
