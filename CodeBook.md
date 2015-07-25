# CodeBook

These are the steps taken to clean up and create a tidy data set, using the code in run_analysis.R.

## Merging the training and the test sets to create one data set
First, labels are read from the features.txt file and a little cleanup on the label names (removing the -()) is done.
After that, features, activity and subjects info is read into variables for both test and training data.

Test data for features, activity and subjects are combined as columns into test_data and the same is done for training data, in the train_data variable.

Test and training data are then combined into all_data, this time row based.

## Appropriately labeling the data set with descriptive variable names
Feature labels are applied to the combined data and the columns for Activity and Subject are labelled as well.

## Using descriptive activity names to name the activities in the data set
The activity values are replaced with their corresponding labels.

## Extracting only the measurements on the mean and standard deviation for each measurement
The data is filtered and only columns containing "std", "mean" and the Subject and Activity column are retained.

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject
Using the melt and dcast functions from the reshape2 library, the required tidy dataset is created.

The result is written to ./data/result.txt