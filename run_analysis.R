#X = measurements; Y = Activity
#Load libraries
library(dplyr)

#Read all the data necessary
x_train<-read.table("~/Data Cleaning/train/X_train.txt")
y_train<-read.table("~/Data Cleaning/train/Y_train.txt")
subject_train<-read.table("~/Data Cleaning/train/subject_train.txt")

x_test<-read.table("~/Data Cleaning/test/X_test.txt")
y_test<-read.table("~/Data Cleaning/test/Y_test.txt")
subject_test<-read.table("~/Data Cleaning/test/subject_test.txt")

var_name<-read.table("~/Data Cleaning/features.txt")
activity_labels<-read.table("~/Data Cleaning/activity_labels.txt")


#Merge test and train data
X_all<-rbind(x_train, x_test)
Y_all<-rbind(y_train, y_test)
subject_all<-rbind(subject_train, subject_test)


#Select only the mean and the st. dev
selectedvar<-var_name[grep("mean\\(\\)|std\\(\\)",var_name[,2]),]
X_all<-X_all[,selectedvar[,1]]


#Descriptive names for the measurements
colnames(X_all)<-selectedvar[,2]
colnames(Y_all)<-"activity"
colnames(subject_all)<-"subject"
mergeddf<-cbind(subject_all,X_all,Y_all)
head(mergeddf)


#Dataset arranged by subject and activity
totalmean <- mergeddf %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 
write.table(totalmean, file = "~/Data Cleaning/datacleaning/tidydata.txt", row.names = FALSE, col.names = TRUE) 