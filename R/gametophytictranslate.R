
gametophytic.translator<-function(rowfromCCDB){
	
	aux1<-rowfromCCDB #Examples 67997, 56725, 123476, 166557, 90026, 237124
#aux1<-CCDBv1[2,]
     species.name<-paste(aux1$Genus,"_",aux1$Species,sep="")
     genus.name<-aux1$Genus
aux2<-as.character(unlist(aux1$gametophytic))
if(is.na(aux2)==TRUE){
	print("No Gametophytic Count")
	small.table<-data.frame(genus.name, species.name,NA,"gametophytic","NA",stringsAsFactors=FALSE) #Making a table that is returned where we can see the translatio and the original
names(small.table)<-c("Genus","Species","CountTranslation", "Type","CountOriginal")
	return(small.table)
}else{
a1<-unlist(strsplit(aux2, "(1)", fixed = TRUE, perl = FALSE, useBytes = FALSE)) #Removes (1) characters
a1<-unlist(strsplit(as.character(a1), "(2)", fixed = TRUE, perl = FALSE, useBytes = FALSE))# Removes (2) characters
a1<-unlist(strsplit(as.character(a1), "(3)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(4)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(5)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(1, 1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(1, 2)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(1, 3)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a1<-unlist(strsplit(as.character(a1), "(1, 1, 1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
a2<-unlist(strsplit(as.character(a1),"II",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a2<-unlist(strsplit(as.character(a2),"III",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a2<-unlist(strsplit(as.character(a1),"IV",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a2<-unlist(strsplit(as.character(a1),"V",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a2<-unlist(strsplit(as.character(a2),"I",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a3<-unlist(strsplit(as.character(a2), "or", fixed=TRUE,perl=FALSE,useBytes=FALSE))
a3<-unlist(strsplit(as.character(a3),"B",fixed=TRUE,perl=FALSE,useBytes=FALSE))
a3<-unlist(strsplit(as.character(a3),"," ,fixed=TRUE,perl=FALSE, useBytes=FALSE))

#####Here the inverval listings and the B-chromosomes are removed or plus listings are separated
long1<-length(a3)
for(i in 1:long1){
	a3[i]<-gsub("(\\+[^0-9])([0-9])","\\+\\2",a3[i])
    a3[i]<-gsub("([0-9])(\\+[0-9])", "\\1 \\2", a3[i])
	}
a3<-unlist(strsplit(as.character(a3)," " ,fixed=TRUE,perl=FALSE, useBytes=FALSE))#you have to repea
remove1<-grep("\\+[0-9]",a3, ignore.case=TRUE, perl=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE) # Remove plus little intervals
if(length(remove1)>0){
a3<-a3[-remove1]}

long1<-length(a3)
a5<-list()
for(i in 1:long1){
	aux4<-0	
	a4<-grep("[0-9]-[0-9]",a3[i], ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE) # Make intervals with the remainders
		longa4<-length(a4)
		if(longa4>0){
			aux3<-as.numeric(unlist(strsplit(as.character(a3[i]),"[^0-9]")))
			if(length(aux3)>2){
				aux3<-aux3[-is.na(aux3)]
			}
			aux4<-seq(aux3[1],aux3[2],1) #Intervals: are there a sequence or first and last??
			}else{
				 aux4<-as.numeric(unlist(strsplit(as.character(a3[i]),"[^0-9]"))) } # The rest are numbers
				 
a5[[i]]<-aux4
}



index<-!is.na(unlist(a5)) #Remove everything that is left like quotations or symbols
a6<-as.numeric(unlist(a5)[index])
aux6<-which(a6==0)

if(length(aux6)>0){ #If there are some zeros left
a6<-a6[-aux6]} # make it a numerical vector
long3<-length(a6)

small.table<-data.frame(rep(genus.name,long3), rep(species.name,long3),a6,rep("gametophytic",long3),rep(aux1$gametophytic,long3),stringsAsFactors=FALSE) #Making a table that is returned where we can see the translatio and the original
names(small.table)<-c("Genus","Species","CountTranslation", "Type","CountOriginal")
return(small.table)
}
	
}