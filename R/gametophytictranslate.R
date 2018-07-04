#' Cleans gametophytic counts
#' @details gametophytic.translator cleans the gametophytic counts of CCDB dataset (downloaded by chromer R package)
#'
#' @param rowfromCCDB Input is a row of CCDB downloaded by chromer
#' @export
gametophytic.translator<-function(rowfromCCDB){
	  aux1<-rowfromCCDB #Examples Jun 2018: 92450, 104971,112258,  21258,183247, 16143, 37914, 91138,112303,112616,112663
    #aux1<-CCDBv1[2,]
    aux<-unlist(strsplit(aux1$resolved_binomial,"_"))
    genus.name<- aux[1]
    species.name<-aux[2]
    aux2<-aux1$gametophytic
    if(is.na(aux2)==TRUE){
      return("No Gametophytic Count")
      #small.table<-data.frame(genus.name, species.name,NA,"gametophytic",aux1$gametophytic, aux1$resolved_name,stringsAsFactors=FALSE) #Making a table that is returned where we can see the translation and the original
      #names(small.table)<-c("Genus","Species","CountTranslation", "Type","CountOriginal","OriginalNAME")
      #return(small.table)	
    }else{
      aux2<-gsub("(.*)(No. of cell examined)(.*)","\\1",aux2)
      aux2<-gsub("(.*)(No. of cells examined)(.*)","\\1",aux2)
      aux2<-gsub("(.*)(No. PMCs examined)(.*)","\\1",aux2)
      aux2<-gsub("\\)\\([0-9]{1,} \\(","",aux2)
      aux2<-gsub("\\([0-9]{1,} \\(","",aux2)
      a1<-unlist(strsplit(aux2, "(1)", fixed = TRUE, perl = FALSE, useBytes = FALSE)) #Removes (1) characters
      a1<-unlist(strsplit(as.character(a1), "(0)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(2)", fixed = TRUE, perl = FALSE, useBytes = FALSE))# Removes (2) characters
      a1<-unlist(strsplit(as.character(a1), "(3)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(4)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(5)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(6)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(7)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(8)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(9)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(43)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1, 1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1, 2)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1, 3)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1, 1, 1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(1, 1, 1, 4, 1, 1)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "(5, 4)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), " (2, 5)", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a1<-unlist(strsplit(as.character(a1), "*", fixed = TRUE, perl = FALSE, useBytes = FALSE))
      a2<-unlist(strsplit(as.character(a1), "or", fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BI",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BII",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BIII",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BIV",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"Bs",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BI",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BII",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BIII",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"BIV",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"B",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"2C",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"1C",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"f",fixed=TRUE,perl=FALSE,useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"," ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),";" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"2x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"3x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"4x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"5x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"6x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"7x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"8x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"9x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      a2<-unlist(strsplit(as.character(a2),"10x" ,fixed=TRUE,perl=FALSE, useBytes=FALSE))
      
      #####Here the inverval listings and the B-chromosomes are removed or plus listings are separated
      long1<-length(a2)
      if(long1==0){
        return("Non informative gametophytic count")
      }else{
        a3<-rep(0,long1)
      
      ### This thread is really sensitive, if we are not careful on what we clean first this can leave cells without cleaning patterns.
      ### Here I am cleaning things like 11II into 22, 11I+10II= 31, I=univalent, II=bivalent, III=trivalent, etc
      for(i in 1:long1){
        if(grepl("([0-9]{1,3})I[+]([0-9]{1,3})II",a2[i])==TRUE){ # match 1 to 3 numbers then I then + then 1 to 3 numbers then II example 11I+18II we need the parentheses to specify which is \\1 or \\2
          a3[i]<-gsub("([0-9]{1,3})I[+]([0-9]{1,3})II","\\1*1+0+\\2*2",a2[i])}else{
            if(grepl("([0-9]{1,3})II[+]([0-9]{1,3})I",a2[i])==TRUE){
              a3[i]<-gsub("([0-9]{1,3})II[+]([0-9]{1,3})I","\\1*2+0+\\2*1",a2[i])}else{
                if(grepl("([0-9]{1,3})II[+]([0-9]{1,3})III",a2[i])==TRUE){
                  a3[i]<-gsub("([0-9]{1,3})II[+]([0-9]{1,3})III","\\1*2+0+\\2*3",a2[i])}else{ 
                    if(grepl("([0-9]{1,3})II[+]([0-9]{1,3})V",a2[i])==TRUE){
                      a3[i]<-gsub("([0-9]{1,3})II[+]([0-9]{1,3})V","\\1*2+0+\\2*5",a2[i])}else{
                        if(grepl("([0-9]{1,3})IV[+]([0-9]{1,3})II",a2[i])==TRUE){
                          a3[i]<-gsub("([0-9]{1,3})IV[+]([0-9]{1,3})II","\\1*4+0+\\2*2",a2[i])}else{
                            if(grepl("([0-9]{1,3})III",a2[i])==TRUE){
                              a3[i]<-gsub("([0-9]{1,3})III","\\1*3",a2[i])}else{
                                if(grepl("([0-9]{1,3})II",a2[i])==TRUE){
                                  #a3[i]<-gsub("([0-9])\sI","\\1",aux3)
                                  a3[i]<-gsub("([0-9]{1,3})II","\\1*2",a2[i])}else{
                                    if(grepl("([0-9]{1,3})I",a2[i])==TRUE){
                                      # a3[i]<-gsub("([0-9])\sII","\\1*2",a2[i])
                                      a3[i]<-gsub("([0-9]{1,3})I","\\1",a2[i])}else{
                                        if(grepl("([0-9]{1,3})IV",a2[i])==TRUE){
                                          #a3[i]<-gsub("([0-9])\sIII","\\1*3",a3[i])
                                          a3[i]<-gsub("([0-9]{1,3})IV","\\1*4",a2[i])
                                          #a3[i]<-gsub("([0-9])\sIV","\\1*4",a2[i])
                                        }else{
                                          a3[i]<-a2[i]
                                        }
                                        
                                      }
                                  }                         
                              }                    
                          }                
                      }        
                  }      
              }
          }
      }
      long1<-length(a3)
      a4<-rep(0,long1)
      for(i in 1:long1){
        a4[i]<-gsub("(\\+[^0-9])([0-9])","\\+\\2",a3[i])
        aux3<-a3[i]
        if(grepl("([0-9]{1,3})[+]0[+]([0-9]{1,3})",aux3)==TRUE){
          aux3=aux3
        }else{
          if(grepl("[0-9]-[0-9]",a3[i], ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE)==TRUE){
            a4[i]<-gsub("([0-9])(\\+[0-9]-[0-9])", "\\1", a3[i])
          }else{
            a4[i]<-gsub("([0-9])(\\+[0-9])", "\\1", a3[i])
          }
        }
      }
      a4<-unlist(strsplit(as.character(a4)," " ,fixed=TRUE,perl=FALSE, useBytes=FALSE))#you have to repeat
      
      #remove1<-grep("\\[+][0-9]",a4, ignore.case=TRUE, perl=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE) # Remove plus little intervals
      ## a4<-a4[-remove1]}
      
      long1<-length(a4)
      for (i in 1:long1){
        print(i)
        if(grepl("*",a4[i])==TRUE){
          try(a4[i]<- eval(parse(text=a4[i])), silent=TRUE)
        }
      }
      
      aux8<-grep("%",a4)
      if(length(aux8)>0){
        a4<-a4[-aux8]
      }
      a6<-list()
      for(i in 1:long1){
        aux4<-0	
        a5<-grep("[0-9]-[0-9]",a4[i], ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE, invert=FALSE) # Make intervals with the remainders
        longa4<-length(a5)
        if(longa4>0){
          aux3<-as.numeric(unlist(strsplit(as.character(a4[i]),"[^0-9]")))
          if(length(aux3)>2){
            r1<-which(is.na(aux3)==TRUE)
            aux3<-aux3[-r1]
          }
          aux4<-c(aux3[1],aux3[2]) #First and last of that interval
        }else{
          aux4<-as.numeric(unlist(strsplit(as.character(a4[i]),"[^0-9]"))) } # The rest are numbers
        
        a6[[i]]<-aux4
      }
      
      index<-!is.na(unlist(a6)) #Remove everything that is left like quotations or symbols
      a7<-as.numeric(unlist(a6)[index])
      aux6<-which(a7==0)
      
      if(length(aux6)>0){ #If there are some zeros left
        a7<-a7[-aux6]
      }
      # make it a numerical vector
      
      remove2<- union(which(a7%%1!=0),which(a7>312)) # remove no integers, csomes larger than 624 or smaller than 4 because those are wrong
      remove2<- union(remove2,which(a7<2))
      aux7<-length(remove2)
      if(aux7>0){
        a7<-a7[-remove2]
      }
      long3<-length(a7)  
      if(long3>0){
        small.table<-data.frame(rep(genus.name,long3), rep(species.name,long3),a7,rep("gametophytic",long3),rep(aux1$gametophytic,long3),rep(aux1$resolved_name,long3),stringsAsFactors=FALSE) #Making a table that is returned where we can see the translatio and the original
        names(small.table)<-c("Genus","Species","CountTranslation", "Type","CountOriginal","OriginalNAME")
        return(small.table)
      }else{print("can't clean gametophytic record")}
      }
    }
  }
  