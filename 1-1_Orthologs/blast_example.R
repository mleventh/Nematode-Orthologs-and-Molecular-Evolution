#Here's a little toy example:
install.packages('reshape')
library(reshape)

read.table('1-1_elegans.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansRemanei
names(elegansRemanei) <- c("elegans", "ortholog")
elegansRemanei["comparator"] <- "remanei"

read.table('1-1_elegans.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansBrenneri
names(elegansBrenneri) <- c("elegans", "ortholog")
elegansBrenneri["comparator"] <- "brenneri"

read.table('1-1_elegans.briggsae.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V4")]
dataFrame[c("V2","V4")] -> elegansBriggsae
names(elegansBriggsae) <- c("elegans", "ortholog")
elegansBriggsae["comparator"] <- "briggsae"



# Some example data with just a few orthologs (note the column names I used, as well as the 'comparitor' column to help keep track of things)
elegans_remanei <- elegansRemanei
elegans_briggsae <- elegansBriggsae
elegans_brenneri <- elegansBrenneri

# Concatenate the three sets of orthologs
combined <- do.call(rbind, list(elegans_brenneri, elegans_briggsae, elegans_remanei))

# Now make a single row for each set of orthologs
combined <- cast(combined, elegans ~ comparator, value='ortholog')
combined

# Remove all of the rows missing a value for one of the four species
combined <- na.omit(combined)
combined

print(combined)


