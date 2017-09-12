  
library(ggplot2)
library(gridExtra)

Args <- commandArgs()
path <- Args[6]
mfile <- Args[7]

str <- paste("/", mfile, sep="")
sData <- read.table(paste(path, str, sep=""), header = TRUE,sep='\t')

plot_theme <- theme(axis.text.y = element_text(angle = 90), axis.text=element_text(size=12), legend.position = c(.8,.8), axis.title=element_text(size=15,face="bold"), legend.title = element_text(size = 12,face = "bold"), legend.text = element_text(size = 10,face = "bold"), panel.grid.major = element_blank(), axis.line = element_line(colour = "black"))

#####chromosome depth summary plot

chr_dt <- na.omit(data.frame(chrome = sData$chrome, mean_depth = sData$chr_depth_sum))

chr_plot <- ggplot(chr_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity", fill= "red")+ plot_theme +
 labs( y = "Mean depth")

ggsave(plot = chr_plot, filename = file.path(path, "mean_depth.png"), width = 10, height = 6)
####################################



#plot <- ggplot(LSQ_data, aes(depth, qc)) +geom_point(aes(color="LSQ")) +
#  geom_point(data =YZF_data, aes(color="YZF") )+
#  geom_point(data =YZJ_data, aes(color="YZJ"))+
#  geom_point(data =LST_data, aes(color="LST"))+
#  geom_point(data =fushengrong_data, aes(color="FSR"))+
#  geom_point(data =fushengyi_data, aes(color="FSY"))+
#  labs(color="Sample", x = "sequence depth", y = "Fraction of bases (%)", size = 10)


#qc_plot  <- plot + theme_bw()  + plot_theme

  
#plot1 <- ggplot(LST_data, aes(depth, ac)) +geom_line(aes(color="LST"),size =1.5) +
#    geom_line(data =YZJ_data, aes(color="YZJ"),size =1.5)+
#    geom_line(data =LSQ_data, aes(color="LSQ"),size =1.5)+
#    geom_line(data =YZF_data, aes(color="YZF"),size =1.5)+
#    geom_line(data =fushengrong_data, aes(color="FSR"),size =1.5)+
#    geom_line(data =fushengyi_data, aes(color="FSY"),size =1.5)+
#    labs(color="Sample", x = "cumulative sequence depth", y = "Fraction of bases (%)")

#ac_plot <- plot1+ theme_bw() + plot_theme


#ggsave(plot = ac_plot, filename = file.path(path, "/ac_pic.png"), width = 10, height = 6)
#ggsave(plot = qc_plot, filename = file.path(path, "/qc_pic.png"), width = 10, height = 6)

