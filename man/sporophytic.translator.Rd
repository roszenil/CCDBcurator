\name{sporophytic.translator}
\alias{sporophytic.translator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sporophytic translator
}
\description{
	It curates sporophytic entries from CCDB
}
\usage{
sporophytic.translator(rowfromCCDB)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rowfromCCDB}{
%%     ~~Describe \code{rowfromCCDB} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rowfromCCDB) 
{
    aux1 <- rowfromCCDB
    species.name <- paste(aux1$Genus, "_", aux1$Species, sep = "")
    genus.name <- aux1$Genus
    aux2 <- as.character(unlist(aux1$sporophytic))
    if (is.na(aux2) == TRUE) {
        print("No Sporophytic Count")
        small.table <- data.frame(genus.name, species.name, NA, 
            "sporophytic", "NA", stringsAsFactors = FALSE)
        names(small.table) <- c("Genus", "Species", "CountTranslation", 
            "Type", "CountOriginal")
        return(small.table)
    }
    else {
        a1 <- unlist(strsplit(aux2, "(1)", fixed = TRUE, perl = FALSE, 
            useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(2)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(3)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(4)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(5)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(1, 1)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(1, 2)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(1, 3)", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a1 <- unlist(strsplit(as.character(a1), "(1, 1, 1)", 
            fixed = TRUE, perl = FALSE, useBytes = FALSE))
        a2 <- unlist(strsplit(as.character(a1), "II", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a2 <- unlist(strsplit(as.character(a2), "III", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a2 <- unlist(strsplit(as.character(a1), "IV", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a2 <- unlist(strsplit(as.character(a1), "V", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a2 <- unlist(strsplit(as.character(a2), "I", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a3 <- unlist(strsplit(as.character(a2), "or", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a3 <- unlist(strsplit(as.character(a3), "B", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        a3 <- unlist(strsplit(as.character(a3), ",", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        long1 <- length(a3)
        for (i in 1:long1) {
            a3[i] <- gsub("(\\+[^0-9])([0-9])", "\\+\\2", a3[i])
            a3[i] <- gsub("([0-9])(\\+[0-9])", "\\1 \\2", a3[i])
        }
        a3 <- unlist(strsplit(as.character(a3), " ", fixed = TRUE, 
            perl = FALSE, useBytes = FALSE))
        remove1 <- grep("\\+[0-9]", a3, ignore.case = TRUE, perl = FALSE, 
            fixed = FALSE, useBytes = FALSE, invert = FALSE)
        if (length(remove1) > 0) {
            a3 <- a3[-remove1]
        }
        long1 <- length(a3)
        a5 <- list()
        for (i in 1:long1) {
            aux4 <- 0
            a4 <- grep("[0-9]-[0-9]", a3[i], ignore.case = FALSE, 
                perl = FALSE, fixed = FALSE, useBytes = FALSE, 
                invert = FALSE)
            longa4 <- length(a4)
            if (longa4 > 0) {
                aux3 <- as.numeric(unlist(strsplit(as.character(a3[i]), 
                  "[^0-9]")))
                if (length(aux3) > 2) {
                  aux3 <- aux3[-is.na(aux3)]
                }
                aux4 <- seq(aux3[1], aux3[2], 1)
            }
            else {
                aux4 <- as.numeric(unlist(strsplit(as.character(a3[i]), 
                  "[^0-9]")))
            }
            a5[[i]] <- aux4
        }
        index <- !is.na(unlist(a5))
        a6 <- as.numeric(unlist(a5)[index])
        aux6 <- which(a6 < 2)
        if (length(aux6) > 0) {
            a6 <- a6[-aux6]
        }
        long3 <- length(a6)
        small.table <- data.frame(rep(genus.name, long3), rep(species.name, 
            long3), a6, rep("sporophytic", long3), rep(aux1$sporophytic, 
            long3), stringsAsFactors = FALSE)
        names(small.table) <- c("Genus", "Species", "CountTranslation", 
            "Type", "CountOriginal")
        return(small.table)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
