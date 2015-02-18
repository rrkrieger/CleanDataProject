

##	You should create one R script called run_analysis.R that does the following. 

##	1	Merges the training and the test sets to create one data set.

## read in x_test.txt (data)

TestData <- read.table("UCI HAR Dataset/Test/X_test.txt")
head(TestData)
str(TestData)
summary(TestData)

## read in subject_test.txt (subject ID#) 
## column bind into first column of TestData

## read in x_train.txt (data)
## read in subject_train.txt (subject ID#)
## column bind into first column of TrainData

## rowbind Testdata onto TrainData as Data



##	"Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)


##	2	Extracts only the measurements on the mean and standard deviation for each measurement. 
##		

##	3	Uses descriptive activity names to name the activities in the data set
##	4	Appropriately labels the data set with descriptive variable names. 
##	5	From the data set in step 4, creates a second, independent tidy data set with the average of each 
##		variable for each activity and each subject.


