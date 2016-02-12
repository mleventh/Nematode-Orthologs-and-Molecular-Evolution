#Here's a little toy example:
install.packages('reshape')
library(reshape)

read.table('1-1_elegans.remanei.txt', skip=1, stringsAsFactors=FALSE)      -> dataFrame
names(dataFrame)
dataFrame[c("V2","V3")]
dataFrame[c("V2","V3")] -> elegansRemanei
names(elegansRemanei) <- c("elegans", "ortholog")
elegansRemanei["comparator"] <- "remanei"

# Some example data with just a few orthologs (note the column names I used, as well as the 'comparitor' column to help keep track of things)
elegans_remanei <- data.frame('elegans'=c('gene1', 'gene2', 'gene3'), 'ortholog'=c('geneX', 'geneY', 'geneZ'), 'comparitor'='remanei', stringsAsFactors=FALSE)
elegans_briggsae <- data.frame('elegans'=c('gene1', 'gene2', 'gene4'), 'ortholog'=c('geneP', 'geneD', 'geneQ'), 'comparitor'='briggsae', stringsAsFactors=FALSE)
elegans_brenneri <- data.frame('elegans'=c('gene2', 'gene3', 'gene4'), 'ortholog'=c('geneA', 'geneB', 'geneC'), 'comparitor'='brenneri', stringsAsFactors=FALSE)

# Concatenate the three sets of orthologs
combined <- do.call(rbind, list(elegans_brenneri, elegans_briggsae, elegans_remanei))
print(combined)

# Now make a single row for each set of orthologs
combined <- cast(combined, elegans ~ comparitor, value='ortholog')
combined

# Remove all of the rows missing a value for one of the four species
combined <- na.omit(combined) 
combined