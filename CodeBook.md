 this script processes the data from the study:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Two datasets are produced:

"data_clean.csv"
"aggdata.csv"


"data_clean.csv" has been produced by 

- combinding the two original datasets X_test.txt and X_train.txt
- adding activity labels from y_test.txt and y_train.tx and descriptive activity names from activity_labels.txt
- adding the column "subject" based on the files subject_test.txt and subject_train.txt
- adding descriptive feature names based on features.txt
- selecting only the columns activity, subject and all measurements on the mean and standard deviation

features have not been changesn, description can be found in features_info.txt


"aggdata.csv" has been produced by aggegating "data_clean.csv" based on subject and activity, calculating the mean for every feature








