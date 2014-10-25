CodeBook

The R program assume the data is already downloaded to the working directory with a name getdata-projectfiles-UCI HAR Dataset.zip

Variables for run_analysis.R,

train_test  <- Merged Training and Test data a
meanStdData <- Meand and Std Deviation for merged dataset from above variable
average <- Creates a second, independent tidy data set with the average of each variable for each activity and each subject

Generates tidy_data.txt files

For train_test merged data, we take data from the following text files:

     labelsTxt will give us the local variable, activity_labels containing all the different types of activities: WALKING, WALKING_UPSTAIRS, SITTING, etc
     featureTxt will give us the features selected for this database  from the accelerometer and gyroscope 3-axial raw signals
     subjecttrainTxt will give us the local variable, subject_train containing all the possible subject data inside the training set.
     xtrainTxt will give us the local variable, train_data containing all the columns of raw data in the training set
     ytrainTxt will give us the local variable, y_train containing all the possible label data inside the training set.
     subjecttestTxt  will give us the local variable, subject_test containing all the possible subject data inside the test set.
     xtestTxt will give us the local variable, test_data containing all the columns of raw data in the test set
     ytestTxt will give us the local variable, y_test containing all the possible label data inside the test set.
