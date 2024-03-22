
This script first reads the testing and training data from the working directory and assigns them to variables to make them easier to work with

Then the datasets are merged according to x and y values so now there is one variable each for the x and y variables and the subject variable

Only the important information pertaining to the project is extracted by reading the features text and then taking the mean and std variables from that text

The data from the beginning is then organized according to the important variables from the features and then one dataset is created using all these values

the tidy data is then created by running through all the values and sorting them by subject and activity and then summarising their means

The tidy_data text is then created in the folder using these values and organizational methods