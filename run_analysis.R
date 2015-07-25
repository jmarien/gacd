
# check for required libs
if (!require("reshape2")) {
    install.packages("reshape2") 
    require("reshape2")
}
if (!require("dplyr")) {
    install.packages("dplyr") 
    require("dplyr")
}
if (!require("data.table")) {
    install.packages("data.table") 
    require("data.table")
}



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
features <- read.table("./data/UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
## first do some cleanup on the variable names
features[,2] <- gsub("[-()]", "", features[,2]) 

## read test data (activity and features) from respective files
test_features <- read.table("./data/UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_activity <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_subjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
## now combine them together
test_data <- cbind(test_features, test_activity)
test_data <- cbind(test_data, test_subjects)

## read training data (activity and features) from respective files
train_features <- read.table("./data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_activity <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_subjects <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
## now combine them together
train_data <- cbind(train_features, train_activity)
train_data <- cbind(train_data, train_subjects)

## combine test and training data
all_data <- rbind(test_data,train_data) 

# 4. Appropriately label the data set with descriptive variable names. 
colnames(all_data)<-features$V2
names(all_data)[562] <- "Activity"
names(all_data)[563] <- "Subject"

# 3. Use descriptive activity names to name the activities in the data set
all_data[,562] <- sapply(all_data[,562], function(x) gsub(1, "WALKING", x))
all_data[,562] <- sapply(all_data[,562], function(x) gsub(2, "WALKING_UPSTAIRS", x))
all_data[,562] <- sapply(all_data[,562], function(x) gsub(3, "WALKING_DOWNSTAIRS", x))
all_data[,562] <- sapply(all_data[,562], function(x) gsub(4, "SITTING", x))
all_data[,562] <- sapply(all_data[,562], function(x) gsub(5, "STANDING", x))
all_data[,562] <- sapply(all_data[,562], function(x) gsub(6, "LAYING", x))

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
filters <- grep("mean|std|Activity|Subject", names(all_data))
all_data_filtered <- all_data[,c(filters)]

# 5. From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
data_melted <- melt(all_data_filtered, id = c("Activity", "Subject"), measure.vars = 1:79)
names(data_melted)[c(1:4)] <- c("Activity", "Subject", "Feature", "Average")
data_grouped <- group_by(data_melted, Activity, Subject, Feature)
tidy_data <- summarise_each(data_grouped, funs(mean))


## create the tidy data set created in step 5 as txt file with write.table() using row.name=FALSE
write.table(tidy_data, "./data/result.txt", row.names = FALSE)