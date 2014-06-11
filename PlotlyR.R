rm(emp)
rm(a, py)

#These comments
#Are the only things changed
#In this commit
#06/11/2014 at 10AM

#install.packages("devtools")
library(devtools)
#install_github("plotly", "ropensci")
library(plotly)

## Loading required package: RCurl
## Loading required package: bitops
## Loading required package: RJSONIO
## Loading required package: ggplot2

library(ggplot2)

#added for employment data
#install.packages("gcookbook")
library(gcookbook)

#And we need reshape
library(reshape2)

library(zoo)
library(tseries)

library(plyr)

py <- plotly("charleyferrari", "oksysax3g0")

#a <- qplot(conc, uptake, data = CO2, colour = Type) + 
#  scale_colour_discrete(name = "")

#py$ggplotly(a)

#Lets try your own example creating a graph of industry specific employment data

#import the csv

setwd("C:/Users/Charley/Downloads/Courses/Plotlygit/R")

emp <- read.csv("employment.csv")

colnames(emp) <- c("Date", "Mining, Logging, and Construction", "Manufacturing",
                   "Trade, Transportation, and Utilities", "Information", "Financial Activities", 
                   "Professional and Business Services", "Education and Health Services", 
                   "Leisure and Hospitality", "Other Services", "Government")

emp <- melt(emp, id.vars="Date", variable.name="Industry", value.name="Thousands Employed")


emp$Date <- strptime(emp$Date, format="%m/%d/%Y", tz="")

#do we want to make this a zoo?

colnames(emp) <- c("Date", "Industry", "Thousands")


#copied from p65 of r graphing cookbook so look up aes


#a <- ggplot(emp, aes(x=Date, y=Thousands, fill=Industry)) + geom_area()

#py$ggplotly(a)

#----------------------------------------------


#What does ddply do?

ggplot(emp, aes(x=Date, y=Thousands, colour=Industry)) + geom_line()

a <- ggplot(emp, aes(x=Date, y=Thousands, colour=Industry)) + geom_line()

py$ggplotly(a)
