## CleanDataProject
Courseera getting and cleaning data course project


### The Four Things you should have
1.  The raw data
2.  A tidy data set
3.  A code book describing each variable and its values in the tidy data set
4.  An explicit and exact recipe you used to go from 1 -> 2, 3.

### The Recipe:

The raw data is exactly how it is unzipped with testing data being in the test directory and training data in the train directory.  First generate the “Test” complete data.  Read in the x_test.txt data.  Read in the subject_test.txt data. Attach the subject data to raw data.  read in the Activity data (y_test.txt).  Attach the activity data to the raw data.  Testing data is now complete but unlabeled.

Next generate the “Train” complete data.  Read in the x_train.txt data.  Read in the subject_train.txt data. Attach the subject data to raw data.  read in the Activity data (y_train.txt).  Attach the activity data to the raw data.  Training data is now complete but unlabeled.

Row bind the training data with testing data to create a complete (unlabeled) data set.

Read in the features.txt file to get all of the feature labels.  Identify all rows that have a measure including “mean(“.  I did not include the 7 additional vectors obtained by averaging at the end.  Identify all of the rows that have a measure including “std(“.  I then combined these two results, sorted, and added the two additional columns added for subject and activity.

I then used the resulting measures vector to subset the large data set into a tidy data set.

The next step was to rename the activities from a numeric value to a descriptive label.  As there were only 6 activities, I just did 6 find & replace substitutions.

the next step was to label the columns with the appropriate feature label.  As the features.txt was already read in I just needed to remove the R special characters and force the last two items to be “subject” and “activity”.  The shortening vector used to create the smaller data set could now be used to extract the correct names for the tidy data.

I then melted the wide data set into a narrow data set keeping subject and activity as ids and all other features as measures.

the last step was to recast the narrow data set into an independent tidy data set with the average of each variable for each subject / activity combination.