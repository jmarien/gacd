# CodeBook

## Steps taken for cleaning

These are the steps taken to clean up and create a tidy data set, using the code in run_analysis.R.

### Merging the training and the test sets to create one data set
First, labels are read from the features.txt file and a little cleanup on the label names (removing the -()) is done.
After that, features, activity and subjects info is read into variables for both test and training data.

Test data for features, activity and subjects are combined as columns into test_data and the same is done for training data, in the train_data variable.

Test and training data are then combined into all_data, this time row based.

### Appropriately labeling the data set with descriptive variable names
Feature labels are applied to the combined data and the columns for Activity and Subject are labelled as well.

### Using descriptive activity names to name the activities in the data set
The activity values are replaced with their corresponding labels.

### Extracting only the measurements on the mean and standard deviation for each measurement
The data is filtered and only columns containing "std", "mean" and the Subject and Activity column are retained.

### Creating a second, independent tidy data set with the average of each variable for each activity and each subject
Using the melt function from the reshape2 library and the summarise_each, group_by and funs functions from the dplyr library, the required tidy dataset is created.

The result is written to ./data/result.txt


## The resulting data

The resuling data is a data form with 14 220 rows (30 subjects, 6 activities and 79 measurements = 14 220) and 4 columns.
The columns are:

### Activity
Six activities are possible: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

### Subject
Each volunteer or subject is identified by a unique numeric id (1 - 30)

### Feature
The features or signals as registered durung the experiment. They are listed in full in the feature_info.txt file, in the data zip file.

### Average
The calculated averages for each feaure as registered during a given activity performed by a subject.



