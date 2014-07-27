##run_analysis.R
##This code pulls, cleans, and organizes data from
##the Human Activity Recognition Using Smartphones experiment

##Download data
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
}

##Unzip file
if (!file.exists("UCI HAR Dataset")) {
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

##Load Train Data
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                            header=FALSE)
trainx <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainy <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)

##Combine Train Data
traindata <- cbind(trainsubjects,trainy,trainx)

##Load Test Data
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                           header=FALSE)
testx <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
testy <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)

##Combine Test Data
testdata <- cbind(testsubjects,testy,testx)

##Combine All Data
alldata <- rbind(traindata,testdata)

##Load Supplementary Data
features <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                             header=FALSE)

##Label columns
colnames(alldata) <- c("subject","activity",features[,2])

##Subset just Mean and StDev columns
toMatch <- c("mean()","std()")
meanandstd <- unique(grep(paste(toMatch,collapse="|"),features[,2],value=TRUE))
colMatch <- subset(features,features$V2 %in% meanandstd)
cleandata <- alldata[,colnames(alldata) %in% c("subject","activity",colMatch$V1)]

##Append activity labels
cleandata$activitylabel <- activitylabels[cleandata$activity,2]


