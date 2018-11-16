# 1. Merges the training and the test sets to create one data set.
train_raw <- read.table("./UCI_HAR_Dataset/train/X_train.txt",sep="",header=F,nrows=7352,comment.char='',stringsAsFactors=F)
test_raw <- read.table("./UCI_HAR_Dataset/test/X_test.txt",sep="",header=F,nrows=2947,comment.char='',stringsAsFactors=F)
names(train_raw) <- 1:561
names(test_raw) <- 1:561

train <- train_raw
test <- test_raw
train$type <- 'train'
train$index <- 1:7352
test$type <- 'test'
test$index <- 1:2947

all_data <- rbind(train,test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI_HAR_Dataset/features.txt",sep="",header=F,nrows=561,comment.char="",stringsAsFactors=F)
names(features) <- c('id_feature','feature')
features$id_feature <- as.integer(features$id_feature)

extract_features <- features[grep('.*(mean|std).*',features$feature), ]
all_data <- all_data[ ,c(extract_features[['id_feature']],'type','index')]

# 3. Uses descriptive activity names to name the activities in the data set
for(old_name in extract_features[['id_feature']]){
    new_name <- extract_features[['feature']][extract_features['id_feature']==old_name]
    names(all_data)[names(all_data)==old_name] <- new_name
}

# 4. Appropriately labels the data set with descriptive variable names.
activity_label <- read.table( "./UCI_HAR_Dataset/activity_labels.txt")
names(activity_label) <- c("activity_id","activity")
                              
train_activity <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
names(train_activity) <- "activity_id"
train_activity$type <- "train"
train_activity$index <- 1:7352
                              
test_activity <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
names(test_activity) <- "activity_id"
test_activity$type <- "test"
test_activity$index <- 1:2947

train_activity <- merge(train_activity, activity_label, by="activity_id",all=F)
test_activity <- merge(test_activity, activity_label, by="activity_id",all=F)
all_activity <- rbind(train_activity, test_activity)
all_data <- merge(all_data, all_activity, by=c("type","index"),all=T)

train_subject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
names(train_subject) <- "subject"
train_subject$type <- "train"
train_subject$index <- 1:7352

test_subject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
names(test_subject) <- "subject"
test_subject$type <- "test"
test_subject$index <- 1:2947

all_subject <- rbind(train_subject,test_subject)
all_data <- merge(all_data, all_subject, by=c("type","index"),all=T)

all_data <- all_data[,!(names(all_data) %in% c("activity_id","index"))]


# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
all_data_2 <- all_data[,!(names(all_data) %in% "type")]
library(reshape2)
melt_data <- melt(all_data_2,id=c("activity","subject"))
tidy_data <- dcast(melt_data,activity + subject ~ variable,mean)

write.table(tidy_data,"tidy.txt",row.names = F,quote = F)





