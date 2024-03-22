library(dplyr)

train_x <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/train/X_train.txt")
test_x <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/test/X_test.txt")

train_y <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/train/y_train.txt")
test_y <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/test/y_test.txt")

train_subject <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/test/subject_test.txt")

x <- rbind(train_x, test_x)
y <- rbind(train_y, test_y)
subject <- rbind(train_subject, test_subject)

features <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/features.txt")
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$V2)
x <- x[, mean_std_features]

activity_labels <- read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/activity_labels.txt")
y$V1 <- activity_labels$V2[y$V1]

names(x) <- features$V2[mean_std_features]
names(y) <- "activity"
names(subject) <- "subject"

data <- cbind(subject, y, x)

tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

read.table("~/Desktop/Research/India Institute of Science/Coursera/Programming Assignment 4/UCI HAR Dataset/tidy_data.txt")
