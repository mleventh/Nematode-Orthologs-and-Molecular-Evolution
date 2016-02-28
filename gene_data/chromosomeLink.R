#Here's a little toy example:
#install.packages('reshape')
#library(reshape)

read.table('XlinkedOrths.txt', skip=2, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
read.table('XlinkedOrths.txt', skip=4, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
read.table('XlinkedOrths.txt', skip=6, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V1","V3","V5")]
dataFrame[c("V1","V3","V5")] -> xLink
names(xLink) <- c("brenneri", "briggsae", "remanei")




read.table('unsortedOrths.txt', skip=1, stringsAsFactors=FALSE)    -> dataFrame
names(dataFrame)
dataFrame[c("V3","V2","V4")]
dataFrame[c("V3","V2","V4")] -> orthoList
names(orthoList) <- c("brenneri", "briggsae", "remanei")

read.table('autosomalOrths.txt', skip=2, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)

read.table('autosomalOrths.txt', skip=4, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)


read.table('autosomalOrths.txt', skip=6, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V1","V3","V5")] -> autosomal
names(autosomal) <- c("brenneri", "briggsae", "remanei")

pruned1 <- merge(orthoList, autosomal, by="brenneri")
pruned2 <- merge(orthoList, xLink, by="brenneri")

print(pruned2)


