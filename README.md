---
output: pdf_document
---
CCDB Tutorial
===========================================
author: Rosana Zenil-Ferguson
date: July 1, 2015


### WARNING: To use this package you will have  a dataset from CCDB and clean it before hand.

Download your dataset at  http://ccdb.tau.ac.il/

You can use package chromer from Matt Pennell to download datasets from https://github.com/ropensci/chromer

###How do I clean my dataset?
1. From the resolved_binomial column on CCDB download you need to create two extra columns one named Genus and another one named Species. It is easy to do in excel by selecting text-to-columns function. You must have those two columns to use the package otherwise it will return error (check the capitalization in the Genus and Species column name)
2. Try to erase strings like (i), (ii) and blank spaces in strings like +(space)0-1. This is easy to do in a text editor using replace function. 

You have to do this because  there are so many particular cases that are being scan in the internal functions of CCDB. I try to add all of the cases, and enumerate them below. However, you should expect some errors still in CCDBcurator v1.

### Good news: If you need any angiosperm genus you don't need to do any of the steps above. I am providing an already revised dataset in this version.

Load the library of CCDB curator
```{r}
library("CCDBcurator")
```

Access the angiosperm database
```{r}
data(AngiospermsCCDB)
angiospermdata[1,]  
#This is the first row of the angiosperm dataset notice it has the Genus and Species columns
```

You can notice that `angiospermdata[1,]` has the following columns
1. resolved_binomial= it is the species name. Comes from chromer download.
2. gametophytic= string representing chromosome counts in gametophytes. Usually complicated strings that need cleaning (check examples below). Download from chromer
3. sporophytic= string representing chromosome counts in sporophytes. Usually complicated strings that need cleaning (check examples below). Download from chromer.
4. resolved_name= Species name from chromer resolved.
1-4 is what you obtain using chromer download.

5. Examples= You won't need this column, it is only for the examples I am showing in here. noneed to add
6. Genus, Species, Var, Subespiciesname columns= **You create this ahead in excel by using the text to columns function from resolved_name. **

All angiosperm genera are included here, so no need of editing if you need them.


## 1. Cleaning a gametophytic chromosome number
You can clean a gametophytic entry from CCDB using the function `gametophytic.translator()`. This function will create a table with  5 columns
1.Genus= Genus name, 
2.Species= Species name (format usable to match with phylogenies)
3.CountTranslation (numeric)= A numeric vector with the counts ready to use for analyses
4.Type= Gametophytic
5. CountOriginal= The original record in CCDB. This is done to control for errors. 

**Example 1**
```{r}
# This has two counts in gametophytic  column 11 and 22, but they are listed as characters
angiospermdata[56725,]

# Corrected record
gametophytic.translator(angiospermdata[56725,])
```

**Example 2**
```{r}
# This has three counts in gametophytic  and possible B chromosomes, that are not be accounted for. The goal is to remove that pattern 20+0-1B

angiospermdata[67997,]

# Corrected record
gametophytic.translator(angiospermdata[67997,])
```


**Example 3**
```{r}
# This has 4 different counts with B chromosomes and fragments, that are not be accounted for. 

angiospermdata[123476,]

# Corrected record
gametophytic.translator(angiospermdata[123476,])
```

**Example 4**
```{r}
# This has four records, interval-like  with B chromosomes. Intervals are a sequence so 10-13 are considered as chromosome counts 10,11,12,13

angiospermdata[166557,]

# Corrected record
gametophytic.translator(angiospermdata[166557,])
```

**Example 5**
```{r}
# This has three records and a reference of the type (1,1,1) that needs to be removed 
angiospermdata[90026,]

# Corrected record
gametophytic.translator(angiospermdata[90026,])
```

**Example 6**
```{r}
# This has two records and a pattern (2-8 f that needs to be removed
angiospermdata[237124,]

# Corrected record
gametophytic.translator(angiospermdata[237124,])
```

As you can see I have done my best to remove most of the patterns that should not be counts. However in a dataset this big many things could go wrong. To detect any mistakes I have added the column CountOriginal so you can compare the original record with the translation. Please let me know if you find other patterns undetected at rzenil@ufl.edu

## 2.Cleaning a sporophytic chromosome number
Simmilarly to the gametophytic clean, you can do sporophytic cleanings through  the function `sporophytic.translator()`. This function will create a table with  5 columns
1.Genus= Genus name, 
2.Species= Species name (format usable to match with phylogenies)
3.CountTranslation (numeric)= A numeric vector with the counts ready to use for analyses
4.Type= sporophytic
5. CountOriginal= The original record in CCDB. This is done to control for errors. 

**Example 1**
```{r}
# This has one record and B chromosomes
angiospermdata[1831,]

# Corrected record
sporophytic.translator(angiospermdata[1831,])
```

## 3. Creating clean records for a genus or all angiosperms.
If you want to clean a whole genus or subset you want to use the function `CCDBcurator()` . The input for this function needs either one row or multiple rows from your dataset.
**Example1**
```{r}
# Clean all the chromosome counts for genus Acanthus
index<-which(angiospermdata$Genus=="Acanthus") #which data in angiospermdata are Acanthus?

acanthus.sample<-angiospermdata[index,] # this are all the Acanthus in angiospermdata

Acanthus.clean<-CCDBcurator(acanthus.sample) # Prints a warning when there are no sporophytic or gametophytic entries in a record
```

So the  clean records and Haploid number of chromosomes and the possibility of aneuploidy (sporophyte record non-divisible by 2) are stored in the object
```{r}
Acanthus.clean
```

With this output you can do multiple things for example check by genus how many haploid numbers you have and how many times they appear
```{r}
genus.table<- table(Acanthus.clean$Genus,Acanthus.clean$HaploidNumber)
genus.table
```
Or check how many records by species
```{r}
species.table<-table(Acanthus.clean$Species, Acanthus.clean$HaploidNumber)
species.table
```

You can plot to detect the most likely x-number and if the gametophytic and sporophytic counts match
```{r}
small<-as.data.frame(table(Acanthus.clean$HaploidNumber,Acanthus.clean$Type)) # Acanthus.clean is used here
names(small)<-c("HaploidNumber","Type","Freq") # The rest remains the same for any other example

small_ordered = small[with(small, order(HaploidNumber,Type)),]
data_ordered=matrix(small_ordered$Freq, ncol=2,byrow=TRUE)
colnames(data_ordered)=levels(small_ordered$Type)
rownames(data_ordered)=levels(small_ordered$HaploidNumber)
colorsplot<-c("lightblue")
barplot(t(data_ordered), col=c("blue","gray"), main="Acanthus",xlab="Haploid Number",ylab="Frequency")
legend("topright",fill=c("blue","gray"),legend=colnames(data_ordered))
```
