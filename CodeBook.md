#Code book

## Objects description

Object **dataCore** contains train and test measurements joined in one data set. Each column represents the measure of one feature for one subject and one activity. For more information about features, see *UCI HAR Dataset/features_info.txt*

In addition, the data set contains a new couple of data:

* **SUBJECT** is the id of the person who carry de phone when the measurements was taken. Can take values form 1 to 30.

* **ACTIVITY_LABEL** describes de action that the subject was doing when the measurements were taken. Can take values from see *UCI HAR Dataset/activity_label.txt*

Object **dataCore.statistics** contais, for each feature, the mean (row named *MEAN*) and the standar deviation (row named *STANDARDEVIATION*).

Object **dataCore.aggdata** (and *UCI HAR Dataset/average_subject_activity.txt* file) contais the average of each variable for each activity and each subject. 

## How tu run.

1. Donwload and unzip [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Change the **RStudio workspace to UCI HAR Dataset folder**. Use menu Session->Set working directory or edit `run_analysis.R` and modify the first line: `setwd("path_to/UCI HAR Dataset")`
	
3. Run the script.

## Tecnical data:

* RStudio Version 0.98.1102
* R.Version()
	* $platform "i686-pc-linux-gnu"
	* $arch "i686"
	* $os "linux-gnu"
	* $system "i686, linux-gnu"
	* $status ""
	* $major "3"
	* $minor "0.2"
	* $year "2013"
	* $month "09"
	* $day "25"
	* $'svn rev' "63987"
	* $language "R"
	* $version.string "R version 3.0.2 (2013-09-25)"
	* $nickname "Frisbee Sailing"
