## The data files are downloaded locally

##then extracted including folder structure & files to data folder

## the features are read in from a file to a data table called features

### get the test data into a data table from the X_test file

### get & assign the column names to the test data based on the features data table

### get the test activities indicator into a data table from the y_test file

### get the test subject indicator into a data table from the subject_test file

###bind all the subject and activity together into one table
###bind this table with the test data into another table

### get the train activity data into a table from the y_train file

### get the subject data into a table from the subject_train file

### get the train data into a table from the x_train file
### assign the column names from the features table to the train table

###combine train data subject & activity into a data table
###combine subject & activity with the train data data into a new table tftr


###combine test and train into one dataset dt

##extract the columns we care about, e.g. mean or std

###create vector with the columns we want using an 'or' regular expression grep statement (V1, V1.1, mean & std columns)

##create a new data table dtf, containing only the columns subject, activity, mean & std columns

###get activity descriptions for column 2 V1.1

###get activity lables, read file and create and view a vector
###column name vector

## create lookup vector
###assign names back to the data table using the lookup vector

### assign cleaner column names using gsub in various statements
##    names(dtf) <- gsub(x = names(dtf), pattern = "^V1.1", replacement = "Activity") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "^V1", replacement = "Subject") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "^t", replacement = "time.") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "^f", replacement = "frequency.") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "-", replacement = ".") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "BodyBody", replacement = "Body") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "\\(", replacement = "") 
##    names(dtf) <- gsub(x = names(dtf), pattern = "\\)", replacement = "") 

##summarize by taking the mean of all of the observations grouping on subject and activity
##verify results - should be 180 rows with the tidied column names
###  head(dtf.tidy)
###  str(dtf.tidy)