fileName = 'elegans/remanei.txt'
singleString = readChar(fileName, file.info(fileName)$size)


regexp = "caenorhabditis_elegans.*1"

ortholog = grep(pattern = regexp, x = singleString , value = T)
orthologPosition = grep(pattern = regexp, x = singleString , value = F)

print(ortholog)