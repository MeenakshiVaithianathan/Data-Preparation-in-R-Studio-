##DATA PREPARATION

##Converting different file formats into data frames to prepare the data for analysis 

## EXCEL FILE: 

#Read an Excel file
library(readxl)
xlemployees <- read_excel("employees.xlsx", sheet = "Sheet1", range = "A1:C4")
xlemployees

##CSV FILE:
# /** A Comma Separated Values (CSV) file is a plain text file that stores data by delimiting data entries with commas. 
# CSV files are often used when data needs to be compatible with many different programs like text editors, spreadsheets,
# or other specialized applications**/

#Read a comma separated values file
employees <- read.csv("employees.csv", header = TRUE, sep = ",")
employees


##XML FILE:
# /** XML is a dedicated data-description language used to store data in listed hierarchy.
# A file with the .xml file extension is an Extensible Markup Language (XML) file. These are really just 
# plain text files that use custom tags to describe the structure how it should be stored and transported over the internet
# elements are arranged in a hierarchy, which means that elements can contain other elements.
# The topmost element is called the "root" element, and contains all other elements, which are called "child" elements**/

#Read an XML file to a list and convert to a data frame
library(XML)
library(plyr)
xmldata <- xmlToList("marathon.xml")
marathondata <- ldply(xmldata, function(x) {data.frame(x)})
marathondata 

#Read an XML file directly to a data frame
library(XML)
marathondata <- xmlToDataFrame("marathon.xml")
marathondata


##HTML FILE:   
# /**The HyperText Markup Language or HTML is a language that focuses on the presentation of content,
# is the standard markup language for documents designed to be displayed in a web browser, 
# assissted by technologies such as CSS. JAVA Script for web designing**/
  
#Read an HTML file
htmldata <- paste(readLines("sample.html"), collapse = "\n")
htmldata

#Read an HTML file using the xml2 library to convert it to XML
library(xml2)
htmldata2 <- read_html("sample.html")
htmldata2

  
##JSON FILE:
# /**JavaScript Object Notation (JSON) is a standard text-based format for representing
# structured data based on JavaScript object syntax. It is commonly used for transmitting
# data in web applications (e.g., sending some data from the server to the client, 
# so it can be displayed on a web page, or vice versa).
# JSON is an open standard file format and data interchange format that uses human-readable
# text to store and transmit data objects consisting of attribute–value pairs and arrays.
# It is a common data format with diverse uses in electronic data interchange, including 
# that of web applications with servers**/
 
#Read a JSON file and convert it to a data frame
library(rjson)
document <- fromJSON(file = "sample.json", method = "C")
document <- as.data.frame(document)
document

#Alternative approach to read a JSON file and convert to a data frame
document2 <- fromJSON(file = "webscrape_links.json", method = "C")
document2 <- ldply(document2, function(x) {data.frame(x)})
document2

#Merging datasets - JOINTS
donors <- read.csv("donors.csv", header = TRUE, sep = ",")
provinces <- read.csv("provinces.csv", header = TRUE, sep = ",")

innerjoin <- merge(donors, provinces, by = "Province")
leftjoin <- merge(donors, provinces, by = "Province", all.x = TRUE)
rightjoin <- merge(donors, provinces, by = "Province", all.y = TRUE)
fulljoin <- merge(donors, provinces, by = "Province", all = TRUE)

#Reading CSV data into a data table
library(data.table)
data <- fread("ccFraud.csv", header = TRUE, verbose = FALSE, showProgress = FALSE)

## END ##
