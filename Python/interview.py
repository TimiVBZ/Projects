# importing csv file, and other data analysis stuff
import numpy as np
import pandas as pd
import matplotlib

data = pd.read_csv("~/Documents/Datasets/Netflix_Userbase.csv") #you can add nrows=[number] to limit the number of rows
print(data)

print(data.loc[:20]) #use this to get the first 20 indexes of rows

print(data.groupby(['Device']).size()) #use this to group data

print(data.head(5)) #get first five rows

print(data.describe()) #get the statistical summary of the variables

categorical = data.dtypes[data.dtypes == "object"].index
print(categorical)
print(data[categorical].describe()) #this block is get description of categorical columns

# del data["insert column name"] is used to delete a column

print(sorted(data["Country"])[0:21]) #this shows the first 15 sorted countries


#-------------transforming data------------

new_subplan = pd.Categorical(data["Subscription Type"])
new_subplan = new_subplan.rename_categories(["First Plan", "Second Plan", "Third Plan"])
print(new_subplan.describe()) #This block to rename categories to understand data better if original wasnt clear

data["Subscription Type"] = new_subplan #This is to overwrite the Subscription type variable

print(data["Country"].unique()) #Use this to return unique variables

missing = np.where(data["Country"].isnull() == True)
print(missing) #This block is to find and list any row with missing data (this is to look for missing countries)

print(data.hist(column='Age', figsize=(9,6), bins=20)) #This is to show the age distribution in form of a histogram.


new_age_var = np.where(data["Age"].isnull(), #Logical check for null values
                       29, #Value if check is true
                       data["Age"]) #Value if check is false
data["Age"] = new_age_var
print(data["Age"].describe()) #This block is to replace null values in column 'Age' with the value of 28

print(data["Age"].describe()) #Statistical summary of Age column

index = np.where(data["Device"] == "Laptop")
print(data.loc[index]) #This is a way to filter a datasets.

data["Rent"] = data["Monthly Revenue"] * 5 #This is to create a new column
print(data["Rent"].describe())
print(data)


#------------Plotting data with Matplotlib----------

data.hist(column="Age", #column to plot histogram
          figsize=(8,8), #plot size
          color="red");

data.boxplot(column="Age"); #column to plot boxplot

data.plot(kind="bar",
          figsize=(8,8)); #bar graph

data.plot(kind="bar",
          figsize=(8,8),
          stacked=True); #stacked bar chart

age_table = pd.crosstab(index=data["Country"],
                        columns=data["Monthly Revenue"])
print(age_table) #This block is to get a cross table of specific columns.

data.plot(kind="bar",
          figsize=(8,8),
          stacked=False); #clustered bar chart

data.plot(kind="scatter",
          x="Monthly Revenue",
          y="Age",
          figsize=(10,10)); #Create a scatterplot

data.plot(x="",
          y="",
          figsize=(9,9)); #plot a line graph over time/period



#-------saving a plot figure--------------

my_plot = data.hist(column="Age", #column to plot histogram
          figsize=(8,8), #plot size
          color="red");

my_fig = my_plot.get_figure()

my_fig.savefig("histogram_example.png") #save to file

