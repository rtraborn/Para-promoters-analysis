isPresentOP <- function(opDb, tssDb, sppIDs) {
  if (is.list(opDb)==FALSE) {
    stop("opDb must be of class 'list'")
  }
  
  if (is.list(tssDb)==FALSE) {
    stop("tssDb must be of class 'list'")
  }
  
  if (is.character(sppIDs)==FALSE) {
    stop("sppIDs must be of class 'character'")
  }
  
  message("Generating table of OP presence-absence using tssDb and opDb.")
  
opDb <- Para.orthoPara
my.OP <- unlist(opDb)

my.matrix <- matrix(my.OP, nrow=length(names(opDb)), ncol=28, byrow=FALSE) 

colnames(my.matrix) <- c("Pbi.1", "Pbi.2", "Pdec.1", "Pdec.2", "Pdodec.1", "Pdodec.2", "Pjenn.1", "Pjenn.2", "Pnov.1", "Pnov.2", "Poct.1", "Poct.2", "Ppent.1", "Ppent.2", "Pprim.1", "Pprim.2", "Pquad.1", "Pquad.2", "Psept.1", "Psept.2", "Psex.1", "Psex.2", "Pson.1", "Pson.2", "Ptet.1", "Ptet.2", "Ptred.1", "Ptred.2")
rownames(my.matrix) <- names(opDb)

my.cols <- colnames(my.matrix)


#sppIDs <- c("Pdec","Poct","Pnov", "Pjenn", "Pdodec", "Ptet", "Ptred", "Pprim")
col.matches <- unique(grep(paste(sppIDs,collapse="|"), 
                           colnames(my.matrix), value=TRUE))

print(col.matches)

this.match <- match(col.matches, my.cols)
print(this.match)	    

#print(head(my.matrix))

reduced.ma <- my.matrix[,na.omit(this.match)]
reduced.df <- as.data.frame(reduced.ma)
#print(head(reduced.df))
print(dim(reduced.df))

new.matrix <- matrix(NA, nrow = length(names(opDb)), ncol=length(col.matches))
colnames(new.matrix) <- colnames(reduced.ma)

sp.len <- length(sppIDs)
tot.len <- (sp.len*2)
sp.seq <- seq(2,tot.len, 2)

#for (i in 1:length(sppIDs)) {
for (i in 1:sp.len) {
  print(i)
  this.slot <- sp.seq[i]
  this.name <- names(tsrDb)[i]
  print(head(this.name))
  this.name.1 <- paste(this.name,1, sep=".")
  this.name.2 <- paste(this.name,2, sep=".")
  tsr.vec <- names(tsrDb[[this.name]])
  print(head(tsr.vec))
  df.1 <- as.character(unlist(reduced.df[this.name.1]))
  df.2 <- as.character(unlist(reduced.df[this.name.2]))
  this.vec <- df.1
  #print("head(df.1)")
  #print(head(df.1))
  vec.match.1 <- match(df.1,tsr.vec)
  #print("vec.match.1")
  print(head(vec.match.1))
  match.1.out <- this.vec[vec.match.1]
  #print(head(match.1.out))
  length(match.1.out)
  new.matrix[,(this.slot-1)] <- this.vec[match.1.out]

  this.vec <- df.2
  vec.match.2 <- match(df.2, tsr.vec)
  print(length(na.omit(vec.match.2)))
  match.2.out <- this.vec[vec.match.2]
  print(match.2.out)

  new.matrix[,this.slot] <- this.vec[match.2.out]
  }

print(head(new.matrix))

opNames <- rownames(my.matrix)

rownames(new.matrix) <- opNames

print(this.name.1)
 
return(new.matrix)
}