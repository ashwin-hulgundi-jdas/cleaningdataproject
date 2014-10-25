require(plyr)
##Get Directories and files


labelsTxt <- paste('UCI HAR Dataset', "/activity_labels.txt", sep = "")
featureTxt <- paste('UCI HAR Dataset', "/features.txt", sep = "")
subjecttrainTxt <- paste('UCI HAR Dataset', "/train/subject_train.txt", sep = "")
xtrainTxt <- paste('UCI HAR Dataset', "/train/X_train.txt", sep = "")
ytrainTxt <- paste('UCI HAR Dataset', "/train/y_train.txt", sep = "")
subjecttestTxt <- paste('UCI HAR Dataset',"/test/subject_test.txt", sep = "")
xtestTxt  <- paste('UCI HAR Dataset', "/test/X_test.txt", sep = "")
ytestTxt <- paste('UCI HAR Dataset', "/test/y_test.txt", sep = "")

##Load Data

activity_labels <- read.table(labelsTxt, col.names = c("ActivityId", "Activity"))
features <- read.table(featureTxt, colClasses = c("character"))
subject_train <- read.table(subjecttrainTxt)
x_train <- read.table(xtrainTxt)
y_train <- read.table(ytrainTxt)
subject_test <- read.table(subjecttestTxt)
x_test <- read.table(xtestTxt)
y_test <- read.table(ytestTxt)

##Merge data
train_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
train_test <- rbind(train_data, test_data)

# Label columns
train_test_label <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(train_test) <- train_test_label

##Get Meand Std Dev
meanStdData <- train_test[,grepl("mean|std|Subject|ActivityId", names(train_test))]

meanStdData <- join(meanStdData, activity_labels, by = "ActivityId", match = "first")
meanStdData <- meanStdData[,-1]

average = ddply(meanStdData, c("Subject","Activity"), numcolwise(mean))
write.table(average, file = "tidy_data.txt",row.names=FALSE)


