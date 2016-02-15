#Here's a little toy example:
install.packages('reshape')
library(reshape)

read.table('1-1_briggsae.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V4")]
dataFrame[c("V2","V4")] -> briggsaeRemanei
names(briggsaeRemanei) <- c("briggsae", "ortholog")
briggsaeRemanei["comparator"] <- "remanei"

read.table('1-1_briggsae.brenneri.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V3","V2")]
dataFrame[c("V3","V2")] -> briggsaeBrenneri
names(briggsaeBrenneri) <- c("briggsae", "ortholog")
briggsaeBrenneri["comparator"] <- "brenneri"

# Some example data with just a few orthologs (note the column names I used, as well as the 'comparitor' column to help keep track of things)
briggsae_remanei <- briggsaeRemanei
briggsae_brenneri <- briggsaeBrenneri

# Concatenate the three sets of orthologs
combined <- do.call(rbind, list(briggsae_remanei, briggsae_brenneri))


# Now make a single row for each set of orthologs
combined <- cast(combined, briggsae ~ comparator, value='ortholog')
#combined


# Remove all of the rows missing a value for one of the four species
combined <- na.omit(combined)
combined
 
print(combined)

