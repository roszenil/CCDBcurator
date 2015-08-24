CCDBcurator<-function(cleanCCDBsample){
#source("gametophytictranslate.R")
#source("sporophytictranslate.R")	
no.rows<-dim(cleanCCDBsample)[1]

print(1)
cleandataset<-gametophytic.translator(cleanCCDBsample[1,])
cleandataset<-rbind(cleandataset,sporophytic.translator(cleanCCDBsample[1,]))
for(i in 2:no.rows){
	print(i)
	cleandataset<-rbind(cleandataset,gametophytic.translator(cleanCCDBsample[i,]))
	cleandataset<-rbind(cleandataset,sporophytic.translator(cleanCCDBsample[i,]))
}


removingextras<-which(is.na(cleandataset$CountTranslation))

cleandataset<-cleandataset[-removingextras,]
row.names(cleandataset) <- NULL


sporophytic.sample<-which(cleandataset$Type=="sporophytic")
gametophytic.sample<-which(cleandataset$Type=="gametophytic")

makeithaploid<-rep(0,dim(cleandataset)[1])
makeithaploid[sporophytic.sample]<-floor(cleandataset$CountTranslation[sporophytic.sample]/2)
makeithaploid[gametophytic.sample]<-cleandataset$CountTranslation[gametophytic.sample]
Aneuploidy<- rep(0, dim(cleandataset)[1])
Aneuploidy[sporophytic.sample]<-(cleandataset$CountTranslation[sporophytic.sample]%%2)
cleandataset<-data.frame(cleandataset,HaploidNumber=makeithaploid, Aneuplody=Aneuploidy)
return(cleandataset)
}
