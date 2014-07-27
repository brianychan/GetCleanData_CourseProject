GetCleanData_CourseProject
==========================

###Synopsis
The script is for an analysis of activity tracking data from the UCI experiment on 
Human Activity Recognition Using Smartphones. Data is pulled, cleaned, and transformed with
the end product of a tidy dataset.

###Procedure
1. Download the UCI HAR Dataset
2. Unzip the dataset
3. Load data

>    a. Training data
>        - Subjects: 'subject_train.txt'
>        - Measurements: 'X_train.txt'
>        - Activity: 'Y_train.txt'
>    b. Test data
>        - Subjects: 'subject_test.txt'
>        - Measurements: 'X_test.txt'
>        - Activity: 'Y_test.txt'
>    c. Features data: 'features.txt'
>    d. Activity Labels data: 'activity_labels.txt'

4. Combine training data into one dataframe using cbind
5. Combine test data into one dataframe using cbind
6. Combine all data using rbind
7. Name all columns based on Features data
8. Subset just Mean and StDev measurement columns


