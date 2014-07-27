This is submitted as course project for the course [**Getting and Cleaning Data**](https://class.coursera.org/getdata-005/). 

#### Background
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

#### Raw Data Set
The raw data set is collected from the accelerometers from the Samsung Galaxy S smartphone.
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### R Script and Code Book
The contents of the project work are described below.

1. run_analysis.R
   
   This R script processes the raw data set and generates the tidy data set.
   It does the following.
   * Merges the training and the test sets to create one data set.
   * Extracts only the measurements on the mean and standard deviation for each measurement.
   * Uses descriptive activity names to name the activities in the data set.
   * Appropriately labels the data set with descriptive variable names.
   * Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
2. CodeBook.md

   This code book describes each variable and its values in the tidy data set.
   
#### Instruction list
1. Download and extract the raw data set as a directory on your hard disk.
2. Using R console or R-Studio, set the working directory to the above directory.
3. Run the above script.
4. The tidy data set will be created in the same directory with the name as tidydata.txt

#### Tidy Data Set
This is the output of the above script and is created as a file named tidydata.txt. It contains the average of each variable for each activity and each subject. The code book describes these variables.
