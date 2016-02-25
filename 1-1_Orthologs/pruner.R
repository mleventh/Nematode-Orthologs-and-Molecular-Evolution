install.packages('reshape')
library(reshape)

read.table('1-1_elegans.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansRemanei
dataFrame[c("V3", "V2")] -> remaneiElegans
names(elegansRemanei) <- c("elegans", "ortholog")
names(remaneiElegans) <- c("remanei", "ortholog")
elegansRemanei["comparator"] <- "remanei"
remaneiElegans["comparator3"] <- "elegans"

read.table('1-1_elegans.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansBrenneri
dataFrame[c("V3","V2")] -> brenneriElegans
names(elegansBrenneri) <- c("elegans", "ortholog")
names(brenneriElegans) <- c("brenneri", "ortholog")
elegansBrenneri["comparator"] <- "brenneri"
brenneriElegans["comparator2"] <- "elegans"

read.table('1-1_elegans.briggsae.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V4")]
dataFrame[c("V2","V4")] -> elegansBriggsae
dataFrame[c("V4","V2")] -> briggsaeElegans
names(elegansBriggsae) <- c("elegans", "ortholog")
names(briggsaeElegans) <- c("briggsae", "ortholog")
elegansBriggsae["comparator"] <- "briggsae"
briggsaeElegans["comparator4"] <- "elegans"

read.table('1-1_briggsae.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V4","V2")]
dataFrame[c("V2","V4")] -> briggsaeRemanei
dataFrame[c("V4","V2")] -> remaneiBriggsae
names(briggsaeRemanei) <- c("briggsae", "ortholog")
names(remaneiBriggsae) <- c("remanei","ortholog")
briggsaeRemanei["comparator4"] <- "remanei"
remaneiBriggsae["comparator3"] <- "briggsae"


read.table('1-1_briggsae.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> brenneriBriggsae
dataFrame[c("V3","V2")] -> briggsaeBrenneri
names(brenneriBriggsae) <- c("brenneri", "ortholog")
names(briggsaeBrenneri) <- c("briggsae", "ortholog")
brenneriBriggsae["comparator2"] <- "briggsae"
briggsaeBrenneri["comparator4"] <- "brenneri"

read.table('1-1_remanei.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V3","V2")] -> remaneiBrenneri
dataFrame[c("V2","V3")] -> brenneriRemanei
names(remaneiBrenneri) <- c("remanei", "ortholog")
names(brenneriRemanei) <- c("brenneri","ortholog")
brenneriRemanei["comparator2"] <- "remanei"
remaneiBrenneri["comparator3"] <- "brenneri"



# Some example data with just a few orthologs (note the column names I used, as well as the 'comparitor' column to help keep track of things)
elegans_remanei <- elegansRemanei
elegans_briggsae <- elegansBriggsae
elegans_brenneri <- elegansBrenneri
briggsae_remanei <- briggsaeRemanei
briggsae_brenneri <- briggsaeBrenneri
briggsae_elegans <- briggsaeElegans
remanei_brenneri <- remaneiBrenneri
brenneri_elegans <- brenneriElegans
remanei_elegans <- remaneiElegans
remanei_brenneri <- remaneiBrenneri
remanei_briggsae <- remaneiBriggsae
brenneri_briggsae <- brenneriBriggsae
brenneri_remanei <- brenneriRemanei

# Concatenate the three sets of orthologs
combined <- do.call(rbind, list(elegans_brenneri, elegans_briggsae, elegans_remanei))

combined2 <- do.call(rbind, list(brenneri_elegans, brenneri_briggsae, brenneri_remanei))

combined3 <- do.call(rbind, list(remanei_elegans, remanei_brenneri, remanei_briggsae))

combined4 <- do.call(rbind, list(briggsae_elegans, briggsae_brenneri, briggsae_remanei))

# Now make a single row for each set of orthologs
combined <- cast(combined, elegans ~ comparator, value='ortholog')
combined

combined2 <- cast(combined2, brenneri ~ comparator2, value='ortholog')
combined2

combined3 <- cast(combined3, remanei ~ comparator3, value='ortholog')
combined3

combined4 <- cast(combined4, briggsae ~ comparator4, value='ortholog')
combined2

# Remove all of the rows missing a value for one of the four species
combined <- na.omit(combined)
combined

combined2 <- na.omit(combined2)
combined2

combined3 <- na.omit(combined3)
combined3

combined4 <- na.omit(combined4)
combined4

pruned1 <- merge(combined, combined2, by="elegans")
pruned2 <- merge(pruned1, combined3, by="elegans")
prunedFinal <- merge(pruned1, pruned2, by="elegans")

print(prunedFinal)
#print(combined2)

#pruned <- do.call(rbind, list(combined, combined2))
#print(pruned)
#pruned <- cast(pruned, elegans ~ comparator, value='ortholog')
#pruned

#pruned <- na.omit(pruned)
#pruned



