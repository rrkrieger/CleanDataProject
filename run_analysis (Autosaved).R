

##	You should create one R script called run_analysis.R that does the following. 

##	1	Merges the training and the test sets to create one data set.

## read in x_test.txt (TestData)
TestData <- read.table("UCI HAR Dataset/test/X_test.txt")

## read in subject_test.txt (subjectID) 
TestSubID <- read.table("UCI HAR Dataset/test/subject_test.txt")

## add $subjectID to TestData
TestData <- cbind(TestData,TestSubID)

## read in Y_test.txt (ActivityID) 
TestActID <- read.table("UCI HAR Dataset/test/Y_test.txt")

## add $ActID to TestData
TestData <- cbind(TestData,TestActID)

## read in x_train.txt (TrainData)
TrainData <- read.table("UCI HAR Dataset/train/X_train.txt")

## read in subject_train.txt (subjectID)
TrainSubID <- read.table("UCI HAR Dataset/train/subject_train.txt")

## add $subjectID to TrainData
TrainData <- cbind(TrainData,TrainSubID)

## read in Y_train.txt (ActivityID) 
TrainActID <- read.table("UCI HAR Dataset/train/Y_train.txt")

## add $ActID to TrainData
TrainData <- cbind(TrainData,TrainActID)

## merge Testdata & TrainData on subjectID as Data
Data <- rbind(TrainData,TestData)


##	2	Extracts only the measurements on the mean and standard deviation for each measurement. 
##		
features <- read.table("UCI HAR Dataset/features.txt")
meancol <- grep("mean\\(",features$V2)			## find columns for mean
stdcol <- grep("std\\(",features$V2)			## find columns for STD
short <- sort(c(meancol,stdcol,562,563))		## combined subset inc. sub. & act.

Data.tidy <- Data[,short]


##	3	Uses descriptive activity names to name the activities in the data set
##	"Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
## Brute force...
Data.tidy$V1.2 <- gsub(1,"walking",Data.tidy$V1.2)
Data.tidy$V1.2 <- gsub(2,"walkingupstairs",Data.tidy$V1.2)
Data.tidy$V1.2 <- gsub(3,"walkingdownstairs",Data.tidy$V1.2)
Data.tidy$V1.2 <- gsub(4,"sitting",Data.tidy$V1.2)
Data.tidy$V1.2 <- gsub(5,"standing",Data.tidy$V1.2)
Data.tidy$V1.2 <- gsub(6,"laying",Data.tidy$V1.2)


##	4	Appropriately labels the data set with descriptive variable names. 
##		using "features.txt" to rename the columns from "V1", "V2", etc. to "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", etc

features$V2 <- gsub("[-()]","",features$V2)		## remove special char
features[562:563,2] <- c("subject", "activity")	## add subject and activity to name list
names(Data.tidy) <- features[short,2]			## rename data set


##		melt the data into narrow set adding "Variable" column equal to the feature measure name
library(reshape2)
Data.narrow <- melt(Data.tidy, id.vars = c("subject","activity"), measure.vars = names(Data.tidy[1:66]))


##	5	From the data set in step 4, creates a second, independent tidy data set with the average of each 
##		variable for each activity and each subject.
ResultTidyData <- dcast(Data.narrow,subject + activity ~ variable,fun.aggregate = mean)
dim(ResultTidyData)
write.table(ResultTidyData,file = "ResultTidyData.txt", row.name = FALSE)


