  
Args <- commandArgs()
cat("Args  : ",Args[6])

library(ggplot2)
library(gridExtra)

path <- Args[6]

YZJ_data <- read.table(paste(path, "/YZJ_chr_depth_summary.txt", sep=""), header = TRUE,sep='\t')
LSQ_data <- read.table(paste(path, "/LSQ_chr_depth_summary.txt", sep=""), header = TRUE,sep='\t')
YZF_data <- read.table(paste(path, "/YZF_chr_depth_summary.txt", sep=""), header = TRUE,sep='\t')
LST_data <- read.table(paste(path, "/LST_chr_depth_summary.txt", sep=""), header = TRUE,sep='\t')
fushengrong_data <- read.table(paste(path, "/fushengrong_chr_depth_summary.txt", sep=""),header = TRUE,sep='\t')
fushengyi_data <- read.table(paste(path, "/fushengyi_chr_depth_summary.txt", sep=""),header = TRUE,sep='\t')



plot_theme <- theme(axis.text.y = element_text(angle = 90), axis.text=element_text(size=12), legend.position = c(.8,.8), axis.title=element_text(size=15,face="bold"), legend.title = element_text(size = 12,face = "bold"), legend.text = element_text(size = 10,face = "bold"), panel.grid.major = element_blank(), axis.line = element_line(colour = "black"))

#####chromosome depth summary plot
LSQ_dt <- na.omit(data.frame(chrome = LSQ_data$chrome, mean_depth = LSQ_data$chr_depth_sum))
LST_dt <- na.omit(data.frame(chrome = LST_data$chrome, mean_depth = LSQ_data$chr_depth_sum))
YZF_dt <- na.omit(data.frame(chrome = YZF_data$chrome, mean_depth = LSQ_data$chr_depth_sum))
YZT_dt <- na.omit(data.frame(chrome = YZJ_data$chrome, mean_depth = LSQ_data$chr_depth_sum))
fushengrong_dt <- na.omit(data.frame(chrome = fushengrong_data$chrome, mean_depth = LSQ_data$chr_depth_sum))
fushengyi_dt <- na.omit(data.frame(chrome = fushengyi_data$chrome, mean_depth = LSQ_data$chr_depth_sum))


LSQ_plot <- ggplot(LSQ_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")

LST_plot <- ggplot(LST_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")

YZF_plot <- ggplot(YZF_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")


YZJ_plot <- ggplot(YZT_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")

fushengrong_plot <- ggplot(fushengrong_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")

fushengyi_plot <- ggplot(fushengyi_dt, aes(x = chrome, y = mean_depth))+
  geom_bar(stat = "identity")+ plot_theme +
  labs( y = "Mean depth")

ggsave(plot = LSQ_plot, filename = file.path(path, "LSQ_mean_depth.png"), width = 10, height = 6)
ggsave(plot = LST_plot, filename = file.path(path, "LST_mean_depth.png"), width = 10, height = 6)
ggsave(plot = YZF_plot, filename = file.path(path, "YZF_mean_depth.png"), width = 10, height = 6)
ggsave(plot = YZJ_plot, filename = file.path(path, "YZJ_mean_depth.png"), width = 10, height = 6)
ggsave(plot = fushengrong_plot, filename = file.path(path, "fushengrong_mean_depth.png"), width = 10, height = 6)
ggsave(plot = fushengyi_plot, filename = file.path(path, "fushengyi_mean_depth.png"), width = 10, height = 6)
####################################



plot <- ggplot(LSQ_data, aes(depth, qc)) +geom_point(aes(color="LSQ")) +
  geom_point(data =YZF_data, aes(color="YZF") )+
  geom_point(data =YZJ_data, aes(color="YZJ"))+
  geom_point(data =LST_data, aes(color="LST"))+
  geom_point(data =fushengrong_data, aes(color="FSR"))+
  geom_point(data =fushengyi_data, aes(color="FSY"))+
  labs(color="Sample", x = "sequence depth", y = "Fraction of bases (%)", size = 10)


qc_plot  <- plot + theme_bw()  + plot_theme

  
plot1 <- ggplot(LST_data, aes(depth, ac)) +geom_line(aes(color="LST"),size =1.5) +
    geom_line(data =YZJ_data, aes(color="YZJ"),size =1.5)+
    geom_line(data =LSQ_data, aes(color="LSQ"),size =1.5)+
    geom_line(data =YZF_data, aes(color="YZF"),size =1.5)+
    geom_line(data =fushengrong_data, aes(color="FSR"),size =1.5)+
    geom_line(data =fushengyi_data, aes(color="FSY"),size =1.5)+
    labs(color="Sample", x = "cumulative sequence depth", y = "Fraction of bases (%)")

ac_plot <- plot1+ theme_bw() + plot_theme


ggsave(plot = ac_plot, filename = file.path(path, "/ac_pic.png"), width = 10, height = 6)
ggsave(plot = qc_plot, filename = file.path(path, "/qc_pic.png"), width = 10, height = 6)

