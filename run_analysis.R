# Read the training and test data
xtrain <- read.table("train/X_train.txt",header = FALSE)
xtest <- read.table("test/X_test.txt", header = FALSE)

# Merge training and test sets to one data set
dataset <- rbind(xtrain,xtest)

# Read in the features.txt file which contains a description of each column in the dataset
features <- read.table("features.txt")

# find the index for all features with "mean()" in the description
meanIdx <- grep(features[,2], pattern = "mean()",fixed = TRUE)

# find the index for all features with "std()" in the description
stdIdx <- grep(features[,2], pattern = "std()",fixed = TRUE)

# Combine into master index
msIdx <- c(meanIdx,stdIdx)

# Extract data with mean or std
msData <- dataset[,msIdx]

# Label the columns with descriptive names from the features file
colNames <- features[msIdx,2]

# Convert the unfriendly names with parens
colNames <- lapply( colNames, sub,pattern="-std()",replacement="StandardDeviation",fixed=TRUE)
colNames <- lapply( colNames, sub,pattern="-mean()",replacement="Mean",fixed=TRUE)
colNames <- lapply( colNames, gsub,pattern="-",replacement="",fixed=TRUE)

# Apply the names to the data set
names(msData) = unlist(colNames)

#
# Process the labels
#

# Read the label data
ytrain <- read.table("train/Y_train.txt",header = FALSE)
ytest <- read.table("test/Y_test.txt", header = FALSE)

# Merge training and test labels
labels <- rbind(ytrain,ytest)

# Read the activities labels
activity_labels <- read.table("activity_labels.txt")

# name the fields in the labels and activity_labels tables
names(activity_labels) <- c("idx","activity")
names(labels) <- "idx"

# merge labels and activity labels
namedLabels <- merge(labels,activity_labels)

#
# Handle the subjects
#

# Read the subject data
subjectTrain <- read.table("train/subject_train.txt",header = FALSE)
subjectTest <- read.table("test/subject_test.txt", header = FALSE)

# Merge training and test subjects
subjects <- rbind(subjectTrain,subjectTest)


#
# Put subjects, labels, and mean/std data together
#

# merge subject data with the named labels
namedLabelsWithSubjects <- cbind( namedLabels$activity, subjects )
names(namedLabelsWithSubjects) <- c("activity", "subject")

# merge named labels with the msData
labeledMsData <- cbind(namedLabelsWithSubjects,msData)


#
# Create and save the new small tidy data set with means of all columns by subject and activity
#
tidyDataSet <- aggregate(. ~ subject + activity, data=labeledMsData, mean)
write.table(tidyDataSet,file = "tidyDataSet.txt",row.names = FALSE)
