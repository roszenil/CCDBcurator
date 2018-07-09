#angioccdb<-read.table(file="~/Dropbox/CCDBcuratorexample/ccdbAngiospermsJune2018.txt",as.is=TRUE,header=TRUE,sep="$", comment.char="&")
#head(angioccdb)
#save(angioccdb, file="data/angiospermsCCDBJune2018.RData")
#angiorecordsclean2018<-read.delim(file="~/Dropbox/CCDBcuratorexample/allangiospermrecordsclean2018v2.txt")
#HaploidNumber<-angiorecordsclean2018$CountTranslation
#sporophytic<-which(angiorecordsclean2018$Type=="sporophytic")
#gametophyic<-which(angiorecordsclean2018$Type=="gametophytic")
# HaploidNumber[sporophytic]<-floor(angiorecordsclean2018$CountTranslation[sporophytic]/2)
# Aneuploidy<-rep(0,dim(angiorecordsclean2018)[1])
# Aneuploidy[sporophytic]<-(angiorecordsclean2018$CountTranslation[sporophytic]%%2)
# Aneuploidy[gametophytic]<-(angiorecordsclean2018$CountTranslation[gametophytic]%%2)
# angiorecordsclean2018<-cbind(angiorecordsclean2018,HaploidNumber=HaploidNumber,Aneuploiy=Aneuploidy)
# save(angiorecordsclean2018, file="data/angiorecordsclean2018.RData")
# ?dfill.empty<-which(angioccdb$gametophytic=="")
# angioccdb$gametophytic[fill.empty]=NA
# fill.empty<-which(angioccdb$sporophytic=="")
# angioccdb$sporophytic[fill.empty]=NA
# zero.empty<-which(angioccdb$gametophytic=="0")
# angioccdb$gametophytic[zero.empty]=NA
# zero.empty<-which(angioccdb$sporophytic=="0")
# angioccdb$sporophytic[zero.empty]=NA
# angioccdb$sporophytic[1604]<-110
# Remove362273= angoccdb2[206133,]
#angioccdb2<-angioccdb[c(156139:206133,206135:362273),]

#aux1<-angioccdb[27333,]## Examples Jun 2018: 6744, 73487,33003,92450, 104971,112258,  21258,183247, 16143, 37914, 91138,112303,112616,112663,143577, 27333

#CCDBcurator(aux1)
#sporophytic.translator(aux1)
#gametophytic.translator(aux1)

