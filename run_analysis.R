# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#X = measurements; Y = Activity

#Read Train Data
x_train<-read.table("~/Data Cleaning/train/X_train.txt")
y_train<-read.table("~/Data Cleaning/train/Y_train.txt")
subject_train<-read.table("~/Data Cleaning/train/subject_train.txt")

#Read Test Data
x_test<-read.table("~/Data Cleaning/test/X_test.txt")
y_test<-read.table("~/Data Cleaning/test/Y_test.txt")
subject_test<-read.table("~/Data Cleaning/test/subject_test.txt")

#Read Descriptions
var_name<-read.table("~/Data Cleaning/features.txt")

#Merge Trial and Train data
X_all<-rbind(x_train, x_test)
Y_all<-rbind(y_train, y_test)
subject_all<-rbind(subject_train, subject_test)

#Select mean and st. dev for each measurements

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_total <- X_total[,selected_var[,1]]