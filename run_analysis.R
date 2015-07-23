# get the data if it is not already available
if (!file.exists("./data")) {
    # create data dir 
    dir.create("./data")
    # set the URL to download the dataset from
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    # download the actual file
    download.file(fileURL, destfile = "./data/UCI-HAR-Dataset.zip", method = "curl")
    # unzip the file
    unzip("./data/UCI-HAR-Dataset.zip", exdir = "./data")
}

# 1. Merge the training and the test sets to create one data set.

## read the labels, used for the the column headers in the data
features <- read.table("./data/UCI HAR Dataset/features.txt")

## read test data (activity and features) from respective files
test_features <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
## combine them together
test_data <- cbind(test_features, test_activity)

## read training data (activity and features) from respective files
train_features <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
## combine them together
train_data <- cbind(train_features, train_activity)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# 3. Use descriptive activity names to name the activities in the data set

# 4. Appropriately label the data set with descriptive variable names. 

# 5. From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

## create the data set as txt file with write.table() using row.name=FALSE
