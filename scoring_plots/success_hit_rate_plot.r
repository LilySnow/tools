# plot success rate and hit rate
# Li Xue
# Aug. 16th 2017

# INPUT file:

# generate by ./SuccessHitRate.py
# total num of targets: 64
# top	HaddockScore	method1	method2
# 0 	0.0	    0.0	    0.0
# 1 	0.003	0.008	0.006
# 2 	0.006	0.020	0.010



rm(list=ls())
library('ggplot2')
library("reshape2")

#--- 1. plot hit rate

RateFL='hitRate.tsv' # 'successRate.tsv'
data = read.delim(RateFL, comment.char ='#')
head(data)


data_long <- melt(data, id="top",variable.name = "Methods" ) 
head(data_long)


ggplot(data_long,aes(x=top, y=value, colour=Methods)) +geom_line(size=2) + 
  labs(title = 'Hit Rate', x='top ranks', y='hit rate') +
  theme_grey(base_size = 20)
ggsave('hitRate.png')

#--- 2. plot success rate

RateFL='successRate.tsv'
data = read.delim(RateFL, comment.char ='#')
head(data)

data_long <- melt(data, id="top",variable.name = "Methods" ) 
head(data_long)


ggplot(data_long,aes(x=top, y=value, colour=Methods)) +geom_line(size=2) + 
  labs(title = 'Success Rate', x='top ranks', y='success rate') +
  theme_grey(base_size = 20)
ggsave('successRate.png')
