
# Finishing project
# Assignment: Getting and Cleaning Data Course Project

# this script processes the data from the study:

#==================================================================
#Human Activity Recognition Using Smartphones Dataset
#Version 1.0
#==================================================================
#Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#Smartlab - Non Linear Complex Systems Laboratory
#DITEN - Università degli Studi di Genova.
#Via Opera Pia 11A, I-16145, Genoa, Italy.
#activityrecognition@smartlab.ws
#www.smartlab.ws
#==================================================================

# downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# set the library to the main folder after unzipping (UCI HAR Dataset)

# reading both datasets

test= read.table(file="./test/X_test.txt")
test_act = read.table(file="./test/y_test.txt")
test_sub = read.table(file="./test/subject_test.txt")

train= read.table(file="./train/X_train.txt")
train_act = read.table(file="./train/y_train.txt")
train_sub = read.table(file="./train/subject_train.txt")


# adding descriptive labels to the activity vectors
activities = read.table(file="activity_labels.txt")

test_act2 = merge(test_act, activities, by.x = "V1", by.y="V1")
train_act2 = merge(train_act, activities, by.x = "V1", by.y="V1")

# binding the labels and subject to each dataset 						= Task 2

test2 = cbind(test_sub, test_act2$V2, test)
train2 = cbind(train_sub, train_act2$V2, train)

# merging datasets and setting labels 									= Task 1

colnames(train2)[1] = "Subject" 
colnames(test2)[1]  = "Subject"
colnames(train2)[2] = "Activity" 
colnames(test2)[2]  = "Activity" 
data = rbind(test2, train2)

# setting the rest of the colnames  									 = Task 4

features = read.table(file="features.txt", colClasses = "character")

for(i in 3:length(colnames(data)))
	{
	j = i-2
	colnames(data)[i]= features[j, 2]
	}
	
	
# Extracting only the measurements on the 
# mean and standard deviation for each measurement						= Task 3 

data_clean =  data[grep("Subject|Activity|-mean|-std", names(data))]


# summary statistics for subject and activity							= Task 5

aggdata <-aggregate
				(
				data_clean[,3:81], 
				by=list(data_clean$Subject, data_clean$Activity),
                    FUN=mean
				)
				
# writing out cleaned datasets

write.csv(data_clean, file="data_clean.csv")
write.csv(aggdata, file="aggdata.csv")