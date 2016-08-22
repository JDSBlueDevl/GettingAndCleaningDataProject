#Codebook for Course Project for Getting and Cleaning Data

##Explanation of manipulations
The headings were grafted from the "features.txt" file onto the X_test and
X_train files in RStudio.  Each row in the two data frames was identified
according to subject (from subject_test and subject_train files), activity
(from y_test and y_train files), and treatment (a column was appended to
each table to indicate whether the observations were data from testing or
training).  The activity factors replaced their numerical counterparts
in the data frames, and the two were combined using the rbind() function
(neither table had key information that would match one to the other).  
The columns indicating means and standard deviations were subsetted from
the combined table, and this data was then arranged according to the three
factors (subject, activity, and treatment).  The rows were grouped
according to the three factors, which allowed for calculation of the means
on each variable for each unique set of subjects, activities, and
treatments.  Table outputs were saved after the initial merge, the subset,
and the means summary.

##Factors
30 volunteers between the ages of 19-48 were apportioned to two groups: one
for the test data (9 subjects) and one for the training data (21 subjects).
Each person performed six activities:
1. walking (defined by factor level "walking")
2. walking upstairs (defined by factor level "upstairs")
3. walking downstairs (defined by factor level "walking downstairs")
4. sitting (defined by factor level "sitting")
5. standing (defined by factor level "standing")
6. laying (defined by factor level "laying")

##Explanation of data
The Galaxy S II smartphone used in the study contained an embedded
accelerometer and gyroscope, which captured 3-axial linear acceleration
and angular velocity.  Captured data were processed to provide the raw
variable data, which were averaged in each run of the study, with a
standard deviation calculated along with each mean.  Data was cleaned
and manipulated as above to provide summary statistics.

##Variables
###subject: data from an individual volunteer
###activity: class of activity performed by subject
###treatment: group assigned to subject

###tBodyAcc.mean_(X, Y, Z)
Means of time-domain signals due to body acceleration in X, Y, and Z axes
###tBodyAcc.std_(X, Y, Z)
Standard deviations of time-domain body acceleration signal around means
in X, Y, and Z axes
###tGravityAcc.mean_(X, Y, Z)
Means of time-domain signals due to gravitational acceleration in X, Y,
and Z axes
###tGravityAcc.std_(X, Y, Z)
Standard deviations of time-domain signals due to gravitational
acceleration around means in X, Y, and Z axes.
###tBodyAccJerk.mean_(X, Y, Z)
Means of derivations of linear body acceleration signals in X, Y, and Z axes
###tBodyAccJerk.std_(X, Y, Z)
Standard deviations of linear body acceleration signals around means in X,
Y, and Z axes
###tBodyGyro.mean_(X, Y, Z)
Means of time-domain angular velocity signal from the body in X, Y, and Z
axes.
###tBodyGyro.std_(X, Y, Z)
Standard deviations around means of time-domain angular velocity signal
####from body in X, Y, and Z axes
###tBodyGyroJerk.mean_(X, Y, Z)
Means of derivations of angular velocity signal from body in X, Y, and Z axes
###tBodyGyroJerk.std_(X, Y, Z)
Standard deviations of derivations of angular velocity signal from body in
X, Y, and Z axes
###tBodyAccMag.mean
Means of magnitudes from tBodyAcc
###tBodyAccMag.std
Standard deviations of magnitutes from tBodyAcc
###tGravityAccMag.mean
Means of magnitudes from tGravityAcc
###tGravityAccMag.std
Standard deviations of magnitudes from tGravityAcc
###tBodyAccJerkMag.mean
Means of magnitudes from tBodyAccJerk
###tBodyAccJerkMag.std
Standard deviations of magnitudes from tBodyAccJerk
###tBodyGyroMag.mean
Means of magnitudes from tBodyGyro
###tBodyGyroMag.std
Standard deviations of magnitudes from tBodyGyro
###tBodyGyroJerkMag.mean
Means of magnitudes from tBodyGyroJerk
###tBodyGyroJerkMag.std
Standard deviations of magnitudes from tBodyGyroJerk
###fBodyAcc.mean_(X, Y, Z)
Means of Fast Fourier Transform of tBodyAcc
###fBodyAcc.std_(X, Y, Z)
Standard deviations of Fast Fourier Transforms of tBodyAcc
###fBodyAcc.meanFreq_(X, Y, Z)
Weighted means of frequency components to obtain mean frequency on fBodyAcc
###fBodyAccJerk.mean_(X, Y, Z)
Means of Fast Fourier Transforms of tBodyAccJerk
###fBodyAccJerk.std_(X, Y, Z)
Standard deviations of Fast Fourier Transforms of tBodyAccJerk
###fBodyAccJerk.meanFreq_(X, Y, Z)
Weighted means of frequency components to obtain mean frequency on fBodyAccJerk
###fBodyGyro.mean_(X, Y, Z)
Means of Fast Fourier Transform of tBodyGyro
###fBodyGyro.std_(X, Y, Z)
Standard deviations of Fast Fourier Transforms of tBodyGyro
###fBodyGyro.meanFreq_(X, Y, Z)
Weighted means of frequency components to obtain mean frequency onfBodyGyro
###fBodyAccMag.mean
Means of magnitudes from fBodyAcc
###fBodyAccMag.std
Standard deviations of magnitudes from fBodyAcc
###fBodyAccMag.meanFreq
Weighted means of frequency components on magnitudes from fBodyAcc
###fBodyAccJerkMag.mean
Means of magnitudes from fBodyAccJerk
###fBodyAccJerkMag.std
Standard deviations of magnitudes from fBodyAccJerk
###fBodyAccJerkMag.meanFreq
Weighted means of frequency components on magnitudes from fBodyAccJerk
###fBodyGyroMag.mean
Means of magnitudes from fBodyGyro
###fBodyGyroMag.std
Standard deviations of magnitudes from fBodyGyro
###fBodyGyroMag.meanFreq
Weighted means of frequency components on magnitudes from fBodyGyro
###fBodyGyroJerkMag.mean
Means of magnitudes from fBodyGyroJerk
###fBodyGyroJerkMag.std
Standard deviations of magnitudes from fBodyGyroJerk
###fBodyGyroJerkMag.meanFreq
Weighted means of frequency components on magnitudes from fBodyGyroJerk
