####  Load the R library "reshape2" for reshaping the data
library(reshape2)

#### Step1 - reading Activity Lables and List for features from the data files

activity_ds = read.table("UCI HAR Dataset\\activity_labels.txt",col.names=c("activityid","activityname"))
features_ds = read.table("UCI HAR Dataset\\features.txt",col.names=c("featureid","featurename"))

### Train files
### Step2 - reading X measurement data, Y activity id data, Subject id data from the data files
###       - identifying measure column names related to "Mean" and "Stdandard deviation"
###       - extract data related to only "Mean" & "Standard deviation" measurements
###       - merging Activity Id + Subject Id + Messurement values
train_x_ds = read.table("UCI HAR Dataset\\train\\X_train.txt",col.names=features_ds$featurename)
train_y_ds = read.table("UCI HAR Dataset\\train\\Y_train.txt",col.names="activityid")
train_subject_ds = read.table("UCI HAR Dataset\\train\\subject_train.txt",col.names="subjectid")
train_x_measure_ds = train_x_ds[grepl(".*[Mm]ean.*\\(\\)|.*[Ss]td.*\\(\\)",features_ds$featurename)]

train_merge_ds = cbind(train_y_ds,train_subject_ds,train_x_measure_ds)

## Test files
### Step3 - reading X measurement data, Y activity id data, Subject id data from the data files
###       - identifying measure column names related to "Mean" and "Stdandard deviation"
###       - extract data related to only "Mean" & "Standard deviation" measurements
###       - merging Activity Id + Subject Id + Messurement values

test_x_ds = read.table("UCI HAR Dataset\\test\\X_test.txt",col.names=features_ds$featurename)
test_y_ds = read.table("UCI HAR Dataset\\test\\Y_test.txt",col.names="activityid")
test_subject_ds = read.table("UCI HAR Dataset\\test\\subject_test.txt",col.names="subjectid")

test_x_measure_ds = test_x_ds[grepl(".*[Mm]ean.*\\(\\)|.*[Ss]td.*\\(\\)",features_ds$featurename)]

test_merge_ds = cbind(test_y_ds,test_subject_ds,test_x_measure_ds)

## Step4 - Merge Test & Train data
         - Associate Activity Labels to merged data

merge_ds1 = rbind(train_merge_ds,test_merge_ds)
merge_ds2 = merge(activity_ds,merge_ds1,by.x="activityid",by.y="activityid",all=TRUE)

#### Step5 - Preparing tiday dataset
####       - Melt the dataset for ActvityId, ActivityName, SubjectId id colunms + measure columns as variables
####       - prepare tidy data set with the average of each variable for each activity and each subject

id_vars = c("activityid","activityname","subjectid")
measure_vars = colnames(train_x_measure_ds)
dataMelt = melt(merge_ds2,id=id_vars,measure.vars=measure_vars)

tidy_data = dcast(dataMelt, activityname + subjectid ~ variable, mean) 

#### Step6 - Write the tidy data to a file tidy_data.txt in the current working directory

write.table(tidy_data, "tidy_data.txt")
