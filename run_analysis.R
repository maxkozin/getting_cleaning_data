#setwd('/Users/max/www/coursera/getting_cleaning_data/UCI HAR Dataset/')

#
# Merges the training and the test sets to create one data set.
#

# read labels
features <- read.table("./features.txt", header=FALSE)
activity_labels <- read.table("./activity_labels.txt", header=FALSE)
colnames(activity_labels) <- c('activity_id','activity_label')

# read train data
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

colnames(x_train) <- features[,2]
colnames(y_train) <- "activity_id"
colnames(subject_train) <- "subject"

# read test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

colnames(x_test) <- features[,2]
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject"

# merge data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
final_data <- cbind(y_data, subject_data, x_data)

#
# Extracts only the measurements on the mean and standard deviation for each measurement.
#
final_colnames <- colnames(final_data)
mean_and_std_features <- grep("activity_id|subject|-(mean|std)\\(\\)", final_colnames)
final_data <- final_data[, mean_and_std_features]

#
# Uses descriptive activity names to name the activities in the data set
#
final_data <- merge(final_data, activity_labels, by='activity_id', all.x=TRUE)

#
# Appropriately labels the data set with descriptive variable names. ???
#
# remove activity_id column and change column order
final_columns <- colnames(final_data)
final_columns[1] <- 'subject'
final_columns[2] <- 'activity_label'
final_data <- final_data[, final_columns[1:length(final_columns)-1]]

#
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# remove 'subject' and 'activity_label' columns
prepared_data = final_data[,names(final_data) != c('subject','activity_label')]
tidy_data <- aggregate(prepared_data, by=list(subject=final_data$subject, activity_label=final_data$activity_label), mean)

# write data
write.table(tidy_data, '../tidy_data.txt', row.names=FALSE)
