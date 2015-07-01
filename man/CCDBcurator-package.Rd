\name{CCDBcurator-package}
\alias{CCDBcurator-package}
\alias{CCDBcurator}
\docType{package}
\title{ CCDBcurator package}
\description{
CCDB curator is a small package dedicated to clean chromosome number counts from CCDB dataset http://ccdb.tau.ac.il/.
It calculates haploid number of chromosomes}
\details{
\tabular{ll}{
Package: \tab CCDBcurator\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-07-01\cr
License: \tab GPL-2\cr
}
WARNING: To use this package you will need to edit a little bit the dataset when you download from CCDB.
You can download CCDB using package chromer as follows
library("chromer") 
ang <- chrom_counts(taxa="Angiosperms", rank="majorGroup")

I am providing an already formatted dataset for angiosperms in these package. The file names is ccdbangio.txt.

What do I need to format in  my own dataset to use CCDB curator?
1. From the resolved_binomial column on CCDB you need to create two extra columns one named Genus and another one named Species. It is easy to do in excel by selecting text-to-columns function. You must have those two columns to use the package otherwise it will return errors.
2. Try to erase strings like (i), (ii) and blank spaces in strings like +(space)0-1. This is easy to do in a text editor using replace function
3. Good news, if you are working with angiosperms you don't need to do any of the above just use ccdbangio.txt

How does it curate chromosome counts?
It can do it one line at time or a whole dataset. Check out the examples at.


This package contains three functions
gametophytic.translator()
sporophytic.translator()
CCDBcurator()
}
\author{
Rosana Zenil-Ferguson

Maintainer: Rosana ZF <rzenil@ufl.edu>

}
\references{
This is a product of NESCENT working group "Tempo and Mode of Plant Evolution" (April, 2015)
}

\keyword{ CCDB, chromosome counts }
\seealso{
Check out chromer too for downloading non-angiosperms
~~ \code{\link{https://github.com/ropensci/chromer}} ~~
}
\examples{
Look at the examples at ~~
}
