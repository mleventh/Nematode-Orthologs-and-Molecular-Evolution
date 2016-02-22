install.packages('reshape')
library(reshape)

read.table('1-1_elegans.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansRemanei
#dataFrame[c("V3", "V2")] -> remaneiElegans
names(elegansRemanei) <- c("elegans", "ortholog")
#names(remaneiElegans) <- c("remanei", "ortholog")
elegansRemanei["comparator"] <- "remanei"
#remaneiElegans["comparator2"] <- "elegans"

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
#dataFrame[c("V4", "V2")] -> briggsaeElegans
names(elegansBriggsae) <- c("elegans", "ortholog")
#names(briggsaeElegans) <- c("briggsae", "ortholog")
elegansBriggsae["comparator"] <- "briggsae"
#briggsaeElegans["comparator2"] <- "elegans"

read.table('1-1_briggsae.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V4","V2")]
dataFrame[c("V4","V2")] -> briggsaeRemanei
names(briggsaeRemanei) <- c("remanei", "ortholog")
#briggsaeRemanei["comparator2"] <- "briggsae"

read.table('1-1_briggsae.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> briggsaeBrenneri
names(briggsaeBrenneri) <- c("brenneri", "ortholog")
briggsaeBrenneri["comparator2"] <- "briggsae"

read.table('1-1_remanei.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> remaneiBrenneri
names(remaneiBrenneri) <- c("brenneri", "ortholog")
remaneiBrenneri["comparator2"] <- "remanei"



# Some example data with just a few orthologs (note the column names I used, as well as the 'comparitor' column to help keep track of things)
elegans_remanei <- elegansRemanei
elegans_briggsae <- elegansBriggsae
elegans_brenneri <- elegansBrenneri
briggsae_remanei <- briggsaeRemanei
briggsae_brenneri <- briggsaeBrenneri
#briggsae_elegans <- briggsaeElegans
remanei_brenneri <- remaneiBrenneri
brenneri_elegans <- brenneriElegans

# Concatenate the three sets of orthologs
combined <- do.call(rbind, list(elegans_brenneri, elegans_briggsae, elegans_remanei))

combined2 <- do.call(rbind, list(brenneri_elegans, briggsae_brenneri, remanei_brenneri))

# Now make a single row for each set of orthologs
combined <- cast(combined, elegans ~ comparator, value='ortholog')
combined

combined2 <- cast(combined2, brenneri ~ comparator2, value='ortholog')
combined2

# Remove all of the rows missing a value for one of the four species
combined <- na.omit(combined)
combined

combined2 <- na.omit(combined2)
combined2


pruned1 <- merge(combined, combined2, by="elegans")

print(pruned1)
#print(combined2)

#pruned <- do.call(rbind, list(combined, combined2))
#print(pruned)
#pruned <- cast(pruned, elegans ~ comparator, value='ortholog')
#pruned

#pruned <- na.omit(pruned)
#pruned



