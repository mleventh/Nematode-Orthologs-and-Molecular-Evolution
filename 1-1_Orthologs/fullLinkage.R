#install.packages('reshape')
#library(reshape)


read.table("putativeAuto.csv", header=FALSE, sep=",", fill=TRUE) -> dataFrame
names(dataFrame)
dataFrame[c("V1","V2","V3")]
dataFrame[c("V1","V2","V3")] -> auto
names(auto) <- c("brenneri", "briggsae","remanei")


read.table('1-1-1.orthologs.txt', skip=1, stringsAsFactors=FALSE)    -> dataFrame
names(dataFrame)
dataFrame[c("V3","V2","V4")]
dataFrame[c("V3","V2","V4")] -> orthologs
names(orthologs) <- c("brenneri","briggsae","remanei")
#orthologs["comparator"] <- "ortholog"
#auto["comparator"] <- "ortholog"

combined1 <- merge(auto, orthologs, by = c("remanei"))
#print(combined1)
colnames(combined1) <- c("remanei", "brenneri.x", "briggsae.x","brenneri","briggsae")
combined2 <- merge(auto, orthologs, by = "brenneri") 
colnames(combined2) <- c("brenneri", "briggsae.x", "remanei.x","briggsae","remanei")
#print(combined2)
combined3 <- merge(auto, orthologs, by = c("briggsae"))
colnames(combined3) <- c("briggsae", "brenneri.x", "remanei.x","brenneri","remanei")
#print(combined3)

finalForm1 <- merge(combined1, combined2, by = "briggsae")
finalForm2 <- merge(finalForm1, combined3, by = "briggsae")

print(finalForm2[c("briggsae","brenneri","remanei")])


