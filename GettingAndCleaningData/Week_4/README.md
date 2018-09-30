# Getting and Cleaning Data Week 4 Assignment

This repo contains my finished code for the week 4 assignment of the Getting and Cleaning Data Coursera course. To use the code please follow these steps in order.
* Download and unzip the data file into your R working directory
* Download the run_analysis.R source code file into your R working Directory
* Execute this file to generate the tidy dataset

### Description of dataset
This data contains sensor readings taken from 30 subjects who wore waist-mounted smartphones whilst performing 6 different activities. The data was used for machine learning and as such is split into training (70%) and test (30%) sets.

### Code explanation
This code recombines the training and test datasets, extracts all measurements of the mean and standard deviation of the sensor signals, and then calculates the mean for each variable for each activity for each subject and stores this in a new dataset.

