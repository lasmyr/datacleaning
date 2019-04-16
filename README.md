# datacleaning
Scripts for Peer Graded Assignment for JHU's Getting and Cleaning Data Week 4

To clean this data, I started with reading the data necessary using the read.csv function.
I combined the train and test data sets by the rbind function
I filtered out non mean and standard deviation measurements by subsetting, and using the grep function
I merged subject_all, X_all, and Y_all after specifying each column name in order to creata complete data frame where columns are named descriptively
I used the arrange function in the dplyr package to arrange by subject and activity
then wrote it into a text file named tidydata.txt
