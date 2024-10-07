library(GSVA)
data=read.delim(file.choose(),row.names = 1,header = T)#read gene_express_list
genelist=read.delim(file.choose(),row.names = 1,header=F)#read gene_list_richment
nrow = nrow(genelist)
data = data.matrix(data)
genelist[genelist == ""] = NA  ## Define empty values in genelist as NA

genesets = list()

# Create gene sets list
for (i in 1:nrow) {
  a = genelist[i,]
  a = a[!is.na(a)]  ### Remove NA values
  a = list(as.character(as.matrix(a)))  ### Convert row to list format
  genesets[[rownames(genelist)[i]]] = a[[1]]
}

# Calculate overlap number
overlap_num <- sapply(genesets, function(g) length(intersect(rownames(data), g)))

# Filter gene sets with overlap
index <- overlap_num > 0
genesets_filtered <- genesets[index]
d = rownames(genelist)[index]

# Create GSVA parameter objec

result = gsvaParam(data, genesets_filtered)


# Convert result to a matrix and assign row and column names
result <- gsva(result)
rownames(result) = d
colnames(result) = colnames(data)

# Save the result to a file
write.table(result, file = "GSVA_result.txt", quote = FALSE, sep = "\t")
