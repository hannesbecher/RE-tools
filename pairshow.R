

####################
## If you don't want to click your way though to the actual
## cluster folders everytime you execute the pairshow function,
## you can set the folder that contains all clusters as the working directory.
##
## Than execute the whole script and run pairshow2d() or pairshow3d().
## The latter requires a recent version of the package 'rgl'.
####################

library(rgl)

#setwd('/home/hannes/6in1Mnew/seqClust/clustering/clusters/')

pairshow2d <- function() {
  load(file.choose())
  
  data<-data.frame(GL$L,unlist((GL$G)[[9]][[3]]))
  names(data)<-c('x', 'y', 'z1', 'z2', 'z3', 'z4', 'name')
  pair<-unlist(lapply(as.character(data$name), function(x) substr(x, 1, nchar(x)-1)))
  mate<-unlist(lapply(as.character(data$name), function(x) substr(x, nchar(x), nchar(x))))
    
  data<-data.frame(data, pair, mate, rep('black', nrow(data)), stringsAsFactors=F)
  names(data)<-c('x', 'y', 'z1', 'z2', 'z3', 'z4', 'name','pair','mate', 'col')
  
  paired<-data$pair[duplicated(data$pair)]
  pairs<-data[data$pair %in% paired,]
  pairs<-pairs[order(pairs$pair),]
  data$col[!(data$pair %in% paired)]<-'red'
  no_reads<-nrow(data)
  no_in_pairs<-(nrow(pairs)/nrow(data)*100)
  print (paste(no_reads, 'reads'))
  print (paste(round(no_in_pairs, digits=2), '% in pairs'))
  
  par(mfrow=c(2,2))
  plot(data$x,data$y, type='p', pch=19, cex=0.1, main='Nodes', axes=F, xlab='', ylab='')

  plot(data$x,data$y, type='n', pch=19, main='Pairs', axes=F, xlab='', ylab='')
  s <- 1:(nrow(pairs)/2)*2
  segments(pairs$x[s*2], pairs$y[s*2], pairs$x[s*2-1], pairs$y[s*2-1], col='grey40')

  plot(data$x,data$y, type='n', pch=19, main='Singlets', axes=F, xlab='', ylab='')
  points(y~x, data=data[data$col=='red',], col='red', pch=19, cex=0.2)

  plot(c(1:6),c(1:6), axes=F, ylab='', xlab='', type='n')
  text(2,5, paste(no_reads, 'reads'), cex=2, pos=4)
  text(2,3, paste(round(no_in_pairs, digits=2), '% in pairs'), cex=2, pos=4)
  
  par(mfrow=c(1,1))
  print ("Done.")

  
}




pairshow3d <- function() {
  load(file.choose())
  
  
  data<-data.frame(GL$L,unlist((GL$G)[[9]][[3]]))
  names(data)<-c('x', 'y', 'z1', 'z2', 'z3', 'z4', 'name')
  pair<-unlist(lapply(as.character(data$name), function(x) substr(x, 1, nchar(x)-1)))
  mate<-unlist(lapply(as.character(data$name), function(x) substr(x, nchar(x), nchar(x))))
  
  
  data<-data.frame(data, pair, mate, rep('black', nrow(data)), stringsAsFactors=F)
  
  names(data)<-c('x', 'y', 'z1', 'z2', 'z3', 'z4', 'name','pair','mate', 'col')
  
  paired<-data$pair[duplicated(data$pair)]
  pairs<-data[data$pair %in% paired,]
  
  pairs<-pairs[order(pairs$pair),]
  data$col[!(data$pair %in% paired)]<-'red'
  
  
  no_reads<-nrow(data)
  no_in_pairs<-(nrow(pairs)/nrow(data)*100)
  print (paste(no_reads, 'reads'))
  print (paste(round(no_in_pairs, digits=2), '% in pairs'))
  
  with(data, plot3d(x, y, z2, size=1))
  
  with(data[data$col=='red',] , points3d(x, y, z2, col='red'))
  
  segments3d(pairs[,c(1,2,4)], col='grey40')
  
}


#pairshow2d()



#pairshow3d()
