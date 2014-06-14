# run_analysis.R
Creates an independent tidy data set with the average of Mean and Standard deviation measure columns of Human Activity Recognition Using Smartphones Dataset, for each activity and each subject. 

To use it, R Script and dataset folder should be in the R working directory as follows:

### R Working Directory:
* run_analysis2.R
* UCI HAR Dataset

### Input Parameters: None
### Input Files: data files under "UCI HAR Dataset" folder
### OutputFiles: tidy dataset will be written to a file "tidy_data.txt" in R working directory

### Details: 
Creates tiday dataset as follows: 


Step1 - reading Activity Lables and List for features from the data files


Step2 - train files - reading X measurement data, Y activity id data, Subject id data from the data files
       - identifying measure column names related to "Mean" and "Stdandard deviation"
       - extract data related to only "Mean" & "Standard deviation" measurements
       - merging Activity Id + Subject Id + Messurement values


Step3 - Test files - reading X measurement data, Y activity id data, Subject id data from the data files
       - identifying measure column names related to "Mean" and "Stdandard deviation"
       - extract data related to only "Mean" & "Standard deviation" measurements
       - merging Activity Id + Subject Id + Messurement values


Step4 - Merge Test & Train data
         - Associate Activity Labels to merged data


Step5 - Preparing tiday dataset
       - Melt the dataset for ActvityId, ActivityName, SubjectId id colunms + measure columns as variables
       - prepare tidy data set with the average of each variable for each activity and each subject


Step6 - Write the tidy data to a file tidy_data.txt in the current working directory


# Human Activity Recognition Using Smartphones Dataset
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

Data Download link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip Description Download link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


# Dependencies:
reshape2 R library
