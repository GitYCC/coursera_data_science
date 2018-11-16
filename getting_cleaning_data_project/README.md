# Coursera Data Science: Getting and Cleaning Data - Course Project

This is the project for the Getting and Cleaning Data Coursera course. Target of this project is transformation from raw data into tidy data. 

Directory "UCI_HAR_Dataset" include all of raw data. R script "run_analysis.R" is used to transfrom raw data into tidy data. The "tidy.txt" is the result of the tidy data.

## UCI_HAR_Dataset

The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Following is brief of data we used

* "./UCI_HAR_Dataset/features.txt": Show 561 * Features 
* "./UCI_HAR_Dataset/features_info.txt": Detail of Features 
* "./UCI_HAR_Dataset/activity_labels.txt": Show 6 * Activities

Train Data:

* "./UCI_HAR_Dataset/train/subject_train.txt": 30 * Subjects(factor), 7352 * Training set(row)
* "./UCI_HAR_Dataset/train/y_train.txt": 6 * Activities(factor), 7352 * Training set(row)
* "./UCI_HAR_Dataset/train/X_train.txt": 561 * Features(col), 7352 * Training set(row)

Test Data:

* "./UCI_HAR_Dataset/test/subject_test.txt": 30 * Subjects(factor), 2947 * Test set(row)
* "./UCI_HAR_Dataset/test/y_test.txt": 6 * Activities(factor), 2947 * Test set(row)
* "./UCI_HAR_Dataset/test/X_test.txt": 561 * Features(col), 2947 * Test set(row)

## run_analysis.R

Following is processing of data

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## tidy.txt

This table is the result after processing data. To each activity and each subject, each measurement on the mean and standard deviation is averged in this tidy data.

Detail showed in "CodeBook.md"




