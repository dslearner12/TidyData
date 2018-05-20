
if (!file.exists("data")){dir.create("data")}

##download locally
zipF<- "C:/Users/dslearner12/Downloads/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
outDir<-"./data"
##extract folder structure & files to data folder
unzip(zipF,exdir=outDir)

features<-read.table("./data/UCI HAR Dataset/features.txt")
##str(features)

### get the test data
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
##str(xtest)
### get & assign the column names
cn<-features[,2]
colnames(xtest)<-cn
##str(xtest)

ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
##str(ytest)

subjecttest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
##str(subjecttest)

t1<-cbind(subjecttest,ytest)
tf<-cbind(t1,xtest)
##names(tf)

### get the train data
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
##str(ytrain)

subjecttrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
##str(subjecttrain)

xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
##str(xtrain)

### assign the column names
colnames(xtrain)<-cn
##str(xtrain)

###combine train data sets
t1<-cbind(subjecttrain,ytrain)
tftr<-cbind(t1,xtrain)
##names(tftr)
###combine test and train into one dataset
dt<-rbind(tf,tftr)

###extract the columns we care about mean or std
##names(dt)

###look at values & create vector
##grep('V1|std+|mean\\(',names(dt), value = TRUE) 
cnf<-grep('V1|std+|mean\\(+',names(dt)) 
##cnf

dtf<-dt[,cnf]
##str(dtf)
##tail(dtf)

###get activity descriptions for column 2 V1.1
###dtf$V1.1

###get activity lables, read file and create and view a vector
acts<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
##str(acts)
###column name vector
cna<-acts[,2]
##lookup vector
l<-dtf$V1.1
###assign names back
dtf$V1.1<-cna[l]
##check the results
##dtf$V1.1
##str(dtf)
##head(dtf)

###better column names
cn<-names(dtf)
##cn
##names(dtf)
##head(dtf)
##cn[1]="Subject"
##cn[2]="Activities"
names(dtf) <- gsub(x = names(dtf), pattern = "^V1.1", replacement = "Activity") 
names(dtf) <- gsub(x = names(dtf), pattern = "^V1", replacement = "Subject") 
names(dtf) <- gsub(x = names(dtf), pattern = "^t", replacement = "time.") 
names(dtf) <- gsub(x = names(dtf), pattern = "^f", replacement = "frequency.") 
names(dtf) <- gsub(x = names(dtf), pattern = "-", replacement = ".") 
names(dtf) <- gsub(x = names(dtf), pattern = "BodyBody", replacement = "Body") 
names(dtf) <- gsub(x = names(dtf), pattern = "\\(", replacement = "") 
names(dtf) <- gsub(x = names(dtf), pattern = "\\)", replacement = "") 

##summarize by taking the mean of the observations grouping on subject and activity
dtf.tidy <- dtf %>% group_by(Subject,Activity) %>% summarise_all(mean)
##verify results
##head(dtf.tidy)
##str(dtf.tidy)
