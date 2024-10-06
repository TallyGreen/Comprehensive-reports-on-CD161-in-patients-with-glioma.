library(pheatmap)
dat = read.delim(file.choose(), head=T, row.names = 1) 
anno_col = read.delim(file.choose(), head=T, row.names = 1)
Histology=c('lightgreen','coral1','gold1','lightpink1','firebrick1','bisque','aquamarine1')
names(Histology) = c("A", "AA", "AO", "AOA", "GBM", "O", "OA")

Grade=c('royalblue1','gold2','firebrick1')  
names(Grade) = c("WHO II", "WHO III", "WHO IV")

#Subtype=c('forestgreen','firebrick1','goldenrod1','dodgerblue1')
#names(Subtype) = c("Classical", "Mesenchymal", "Neural", "Proneural")
Gender=c('deeppink1','cyan1')  
names(Gender) = c("Female", "Male")

IDH=c('goldenrod1','darkseagreen2')
names(IDH) = c('Mutant','Wildtype' )

C1p19q=c('darkorange','darkolivegreen2')
names(C1p19q) = c('Codel','Non-codel' )

MGMT=c('darkorchid2','cadetblue2')
names(MGMT) = c('Methylated','un-methylated' )

anno_col$Histology <- factor(anno_col$Histology, levels = names(Histology))
anno_col$Grade <- factor(anno_col$Grade, levels = names(Grade))
anno_col$Gender <- factor(anno_col$Gender, levels = names(Gender))
anno_col$IDH <- factor(anno_col$IDH, levels = names(IDH))
anno_col$C1p19q <- factor(anno_col$C1p19q, levels = names(C1p19q))
anno_col$MGMT <- factor(anno_col$MGMT, levels = names(MGMT))

anno_colors <- list(Histology = Histology, Grade = Grade, Gender = Gender, IDH = IDH, C1p19q = C1p19q, MGMT = MGMT)
plot = pheatmap(dat,
         annotation_col = anno_col,
         border_color = "grey",
         cluster_cols = FALSE,
         cluster_rows = FALSE,
         show_rownames = FALSE,
         annotation_colors = anno_colors,
         show_colnames = FALSE,
         breaks = c(seq(-2.2, 2.2, by = 0.05)))
print(plot)
dat = read.delim(file.choose(), head = T, row.names = 1)
dat$Censor <- as.factor(dat$Censor)
ggplot(data = dat, aes(x = ID, y = OS, colour = Censor)) +
  geom_point(alpha = 0.5, size = 1.75) +
  theme_bw() +
  scale_colour_manual(values = c("dodgerblue", "darkgrey", "firebrick2"))
