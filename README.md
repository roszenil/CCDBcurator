
![](Figures/transparent.png)


CCDB Tutorial
===========================================
author: Rosana Zenil-Ferguson
date: October 27, 2018



## 1. Download chromosome number records from CCDB
First you will have to download a dataset from CCDB and use chromer  before hand.

Download your dataset at  http://ccdb.tau.ac.il/

You can use package chromer from Matt Pennell to download datasets from https://github.com/ropensci/chromer
```{r}
install.packages(chromer)

library(chromer)
anemia.counts <- chrom_counts(taxa="Anemia", rank="genus")
```

## 2. Curating all my records and accessing all curated records (Oct 2018)

There are possible tens of thousands of patterns that appear in CCDB records. As much as (one-womanly) possible, I have integrated the most common regular expressions. However, you should expect some errors still in CCDBcurator please report them using open issue in GitHub (github.com/roszenil/CCDBcurator)


Load the library of CCDB curator
```{r}
install_github("roszenil/CCDBcurator")
library("CCDBcurator")
anemia.cleancounts<-CCDBcurator(anemia.counts)
anemia.cleancounts
```

Access all the records in angiosperms and ferns cleaned available in October 2018 using the ``data()`` function
```{r}
data(angiorecordsclean2018)
data(fernrecordsclean2018)
```

Acess all the records in angiosperms and ferns by genus available in October 2018
```{r}
data(angiocsomefulltable)
angiocsomefulltable$Physalis # All chromosome numbers for Physalis

data(ferncsomefulltable)
ferncsomefulltable$Anemia # All chromosome numbers for Anemia
```

## 3. Curating a gametophytic chromosome number
You can clean a single gametophytic entry from CCDB using the function `gametophytic.translator()`. This function will create a table with  5 columns
1.Genus= Genus name, 
2.Species= Species name (format usable to match with phylogenies)
3.CountTranslation (numeric)= A numeric vector with the counts ready to use for analyses
4.Type= Gametophytic
5. CountOriginal= The original record in CCDB. This is done to control for errors. 

**Example 1**
```{r}
gametophytic.translator(anemia.counts[1,])
```
## 4. Curating a sporophytic chromosome number
You can clean a single gametophytic entry from CCDB using the function `sporophytic.translator()`. This function will create a table with  5 columns
1.Genus= Genus name, 
2.Species= Species name (format usable to match with phylogenies)
3.CountTranslation (numeric)= A numeric vector with the counts ready to use for analyses
4.Type= Gametophytic
5. CountOriginal= The original record in CCDB. This is done to control for errors. 

**Example 2**
```{r}
sporophytic.translator(anemia..counts[2,])
```

