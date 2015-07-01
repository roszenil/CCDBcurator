\name{CCDBcurator}
\alias{CCDBcurator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{CCDBcurator
}
\description{
It creates a dataframe with 5 columns
Genus Species Count Translation Type CountOriginal HaploidNumber Aneuploidy
}
\usage{
CCDBcurator(cleanCCDBsample)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cleanCCDBsample}{
%%     ~~Describe \code{cleanCCDBsample} here~~
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
function (cleanCCDBsample) 
{
    no.rows <- dim(cleanCCDBsample)[1]
    cleandataset <- gametophytic.translator(cleanCCDBsample[1, 
        ])
    cleandataset <- rbind(cleandataset, sporophytic.translator(cleanCCDBsample[1, 
        ]))
    for (i in 2:no.rows) {
        cleandataset <- rbind(cleandataset, gametophytic.translator(cleanCCDBsample[i, 
            ]))
        cleandataset <- rbind(cleandataset, sporophytic.translator(cleanCCDBsample[i, 
            ]))
    }
    removingextras <- which(is.na(cleandataset$CountTranslation))
    cleandataset <- cleandataset[-removingextras, ]
    row.names(cleandataset) <- NULL
    sporophytic.sample <- which(cleandataset$Type == "sporophytic")
    gametophytic.sample <- which(cleandataset$Type == "gametophytic")
    makeithaploid <- rep(0, dim(cleandataset)[1])
    makeithaploid[sporophytic.sample] <- floor(cleandataset$CountTranslation[sporophytic.sample]/2)
    makeithaploid[gametophytic.sample] <- cleandataset$CountTranslation[gametophytic.sample]
    Aneuploidy <- rep(0, dim(cleandataset)[1])
    Aneuploidy[sporophytic.sample] <- (cleandataset$CountTranslation[sporophytic.sample]\%\%2)
    cleandataset <- data.frame(cleandataset, HaploidNumber = makeithaploid, 
        Aneuplody = Aneuploidy)
    return(cleandataset)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
