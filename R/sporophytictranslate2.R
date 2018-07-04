angioccdb<-read.table(file="~/Dropbox/CCDBcuratorexample/ccdbAngiospermsJune2018.txt",as.is=TRUE,header=TRUE,sep="$", comment.char="&")
head(angioccdb)
save(angioccdb, file="data/angiospermsCCDBJune2018.RData")
fill.empty<-which(angioccdb$gametophytic=="")
angioccdb$gametophytic[fill.empty]=NA
fill.empty<-which(angioccdb$sporophytic=="")
angioccdb$sporophytic[fill.empty]=NA
zero.empty<-which(angioccdb$gametophytic=="0")
angioccdb$gametophytic[zero.empty]=NA
zero.empty<-which(angioccdb$sporophytic=="0")
angioccdb$sporophytic[zero.empty]=NA
angioccdb$sporophytic[1604]<-110
# Remove362273= angoccdb2[206133,]
#angioccdb2<-angioccdb[c(156139:206133,206135:362273),]

aux1<-angioccdb[27333,]## Examples Jun 2018: 6744, 73487,33003,92450, 104971,112258,  21258,183247, 16143, 37914, 91138,112303,112616,112663,143577, 27333

CCDBcurator(aux1)
sporophytic.translator(aux1)
gametophytic.translator(aux1)

