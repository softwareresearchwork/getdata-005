library(data.table)
library(reshape2)

#Logger function to help in debugging
log <- function(x, ...){
    print(x, ...)
}

#Read activity labels from the input file
activitylabels <- read.table("activity_labels.txt")

#Returns the activity label given a number
getactivitylabel <- function(number){
    activitylabels[number, ][[2]]
}

#Read features from the input file
readfeatures <- function(){
    path <- "features.txt"
    features <- read.table(path)
    headers <- features[, c(2)]
    headers
}

#Read the data set for the experiment measurements form the input file
readdata <- function(type){
    path <- file.path(type, paste0("X_" , type, ".txt"))
    table <- read.table(path)
    
    #Apply the features as column names for the data table
    colnames(table) <- readfeatures()
    
    #Keep only the columns which have 'mean' or 'std'
    table[, grep("(mean|std)", colnames(table))]
}

#Read activity labels from the input file
readactivitylabels <- function(type){
    path <- file.path(type, paste0("Y_" , type, ".txt"))
    table <- read.table(path)
    #Store descriptive activity name instead of the number
    table$activity <- getactivitylabel(table[, c(1)])
    table[, c(1)]  <- NULL
    table
}

#Read subjects from the input file
readsubjects <- function(type){
    path <- file.path(type, paste0("subject_" , type, ".txt"))
    table <- read.table(path)
    colnames(table) <- c("subject")
    table
}

#Read a set of experiment data, activity labels and subject data
#and combine them into a single table
readdataset <- function(type){
    data <- readdata(type)
    labels <- readactivitylabels(type)
    subjects <- readsubjects(type)
    
    fulltable <- cbind(data,labels,subjects)
}

#Read test and train data and combine them into a single table
read <- function(){
    train <- readdataset("train")
    test <- readdataset("test")
    
    entire <- rbind(train, test)
}

#Creates tidy data set as per subject and activity label
tidy <- function(table) {
    longtable <- melt(table, id.vars = c("activity","subject"))
    tidytable <- dcast(longtable, activity + subject ~ variable, mean)
    tidytable
}

data <- read()
tidydata <- tidy(data)
write.table(tidydata, "tidydata.txt", row.names = F)
