library(ggplot2)
library(gridExtra)
x_range <- range(c(dat_bp$P, dat_cc$P, dat_mf$P))

#bp
plot1 <- ggplot(dat_bp, aes(x = P, y = reorder(Term, P), size = Count, col = P, fill = P)) +
  geom_point(shape = 21) + 
  theme_bw() + 
  scale_color_gradient(low = "skyblue", high = "blue") + 
  scale_fill_gradient(low = "skyblue", high = "blue") +
  labs(x = "P-value", y = "Term (Ranked by P-value)", 
       title = "BP: Dot Plot of Terms Ranked by P-value") +
  xlim(x_range) +
  coord_fixed(ratio = 0.5)  # Adjust the ratio as needed
#cc
dat_cc = read.delim("D:/BIOstat/Project/CD161 RNA_sequence analysis/function_analysis/GOTERM_CC_DIRECT_R_read.txt")
plot2 <- ggplot(dat_cc, aes(x = P, y = reorder(Term, P), size = Count, col = P, fill = P)) +
  geom_point(shape = 21) + 
  theme_bw() + 
  scale_color_gradient(low = "lightgreen", high = "darkgreen") + 
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  labs(x = "P-value", y = "Term (Ranked by P-value)", 
       title = "CC: Dot Plot of Terms Ranked by P-value") +
  xlim(x_range) +
  coord_fixed(ratio = 0.5)  # Adjust the ratio as needed
#mf
dat_mf = read.delim("D:/BIOstat/Project/CD161 RNA_sequence analysis/function_analysis/GOTERM_MF_DIRECT_R_read.txt")
plot3 <- ggplot(dat_mf, aes(x = P, y = reorder(Term, P), size = Count, col = P, fill = P)) +
  geom_point(shape = 21) + 
  theme_bw() + 
  scale_color_gradient(low = "plum1", high = "purple") + 
  scale_fill_gradient(low = "plum1", high = "purple") +
  labs(x = "P-value", y = "Term (Ranked by P-value)", 
       title = "MF: Dot Plot of Terms Ranked by P-value") +
  xlim(x_range) +
  coord_fixed(ratio = 0.5)  # Adjust the ratio as needed
grid.arrange(plot1, plot2, plot3, ncol = 1)


