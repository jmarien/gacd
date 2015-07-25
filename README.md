# Introduction

This script is part of an assignment and tries to clean this dataset using R:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
This dataset has been included in the current repository under "UCI HAR Dataset", for convenience.
  
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data was collected in an experiment, a full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
# About the source data

The original experiment has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Once downloaded (by executing run_analysis.R for example), do read these files in the original data set to learn more on the source data structure:

  ./data/UCI HAR Dataset/README.txt

Also read about the features in features_info.txt and features.txt in that same directory. They describe the list of data gathered in the time windows being monitored. 

These are the activity labels being used:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

# Read more

Read more on the cleaned up dataset in the CodeBook.md file. This file describes the variables, the data and what has been done to clean up the data.

# R packages you probably need

- utils
- data.table
- rehsape2
