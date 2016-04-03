##Coursera: Getting and Cleaning Data. Course Project code book.

### Description
This code book describes the variables, the data, and all transformations performed to clean up the data collected from the accelerometers from the Samsung Galaxy S smartphone. 

### Source Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes:

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The sourse data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description of the data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

- features.txt: List of all features.
- activity_labels.txt: Links the class labels with their activity name.
- train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- train/X_train.txt: Training set.
- train/y_train.txt: Training labels.
- test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.

### Transformations
The script run_analysis.R performs folowing steps:

####Step 1. Merges the training and the test sets to create one data set.
- `features` contains feature names read from 'features.txt'
- `activity_labels` contains names of activities read from 'activity_labels.txt'
- `subject_train`, `x_train`, `y_train`, `subject_test`, `x_test`, `y_test` contain data from downloaded dataset.
- `subject_data`, `x_data`, `y_data` are merges by rows corresponding traing and test datasets.
- `final_data` - data merged `y_data`, `subject_data`, `x_data` by columns.

####Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
- `mean_and_std_features` - names of columns that includes substrings '-str()' and '-mean()'. Columns 'activity_id' and 'subject' added too.
- `final_data` - a result dataset contains only columns from `mean_and_std_features`.

####Step 3. Uses descriptive activity names to name the activities in the data set
- `final_data` - a result dataset with the additional column 'activity_label' made by merging with `activity_labels`

####Step 4. Appropriately labels the data set with descriptive variable names.
- `final_data` - a result dataset with the column 'activity_id' removed and the column 'activity_label' made second.

####Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- `prepared_data` - the dataset from the previous step with coumns 'activity_label' and 'subject' removed.
- `tidy_data` - the final dataset with the average of each variable for each activity and each subject.


### The result dataset description.

Fields:

- subject               
- activity_label
- tBodyAcc-mean()-X/Y/Z
- tBodyAcc-std()-X/Y/Z
- tGravityAcc-mean()-X/Y/Z
- tGravityAcc-std()-X/Y/Z    
- tBodyAccJerk-mean()-X/Y/Z
- tBodyAccJerk-std()-X/Y/Z
- tBodyGyro-mean()-X/Y/Z
- tBodyGyro-std()-X/Y/Z
- tBodyGyroJerk-mean()-X/Y/Z
- tBodyGyroJerk-std()-X/Y/Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X/Y/Z
- fBodyAcc-std()-X/Y/Z
- fBodyAccJerk-mean()-X/Y/Z
- fBodyAccJerk-std()-X/Y/Z
- fBodyGyro-mean()-X/Y/Z
- fBodyGyro-std()-X/Y/Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()