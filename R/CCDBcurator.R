#' Cleans all chromosome records
#' @details CCDBcurator cleans all gametophytic and sporophytic counts of CCDB dataset (downloaded by chromer R package). Creates a dataframe with haploid chromsome number and possible aneuploidy column
#'
#' @param cleanCCDBsample Input is a sample of CCDB rows downloaded by chromer
#' @export
#' 
#' 
CCDBcurator<-function(cleanCCDBsample){
#source("gametophytictranslate.R")
#source("sporophytictranslate.R")	
cleandataset<-data.frame()
no.rows<-dim(cleanCCDBsample)[1]
for(i in 1:no.rows){
  print(i)
b1<-gametophytic.translator(cleanCCDBsample[i,])
b2<-sporophytic.translator(cleanCCDBsample[i,])
ifelse(b1!="No Gametophytic Count",cleandataset<-rbind(cleandataset,b1),print("no gametophytic count"))
ifelse(b2!="No Sporophytic Count",cleandataset<-rbind(cleandataset,b2),print("no sporophytic count"))
write.table(cleandataset,file="allangiospermrecordscleanJune2018.txt",sep="$",row.names=FALSE,col.names=TRUE)
}
  

makeithaploid<-rep(0,dim(cleandataset)[1])
sporophytic.sample<-which(cleandataset$Type=="sporophytic")
makeithaploid[sporophytic.sample]<-floor(cleandataset$CountTranslation[sporophytic.sample]/2)
gametophytic.sample<-which(cleandataset$Type=="gametophytic")
makeithaploid[gametophytic.sample]<-cleandataset$CountTranslation[gametophytic.sample]
Aneuploidy<- rep(0, dim(cleandataset)[1])
Aneuploidy[sporophytic.sample]<-(cleandataset$CountTranslation[sporophytic.sample]%%2)
cleandataset<-cbind(cleandataset,HaploidNumber=makeithaploid, Aneuploidy=Aneuploidy)
write.table(cleandataset,file="allangiospermrecordscleanJune2018.txt",sep="$",row.names=FALSE,col.names=TRUE)
return(cleandataset)
}
