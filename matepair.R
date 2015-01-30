
pairshow<-function(a){
        
        
        #jpeg(as.character(a), width= 1920, height=1080)
        load(file.choose())
        data<-data.frame(GL$L[,1],GL$L[,2],unlist((GL$G)[[9]][[3]]))
        names(data)<-c('x', 'y', 'name')
        pair<-unlist(lapply(as.character(data$name), function(x) substr(x, 1, nchar(x)-1)))
        mate<-unlist(lapply(as.character(data$name), function(x) substr(x, nchar(x), nchar(x))))
        
        data<-data.frame(data, as.integer(pair), mate, rep('black', nrow(data)), stringsAsFactors=F)
        
        #str(data)
        head(data)
        
        names(data)<-c('x','y','name','pair','mate', 'col')
        
        paired<-data$pair[duplicated(data$pair)]
        
        pairs<-data[data$pair %in% paired,]
        
        
        
        pairs<-pairs[order(pairs$pair),]
        data$col[!(data$pair %in% paired)]<-'red'
        par(mfrow=c(2,2))
        
        plot(data$x,data$y, type='p', pch=19, cex=0.1, main='Nodes', axes=F, xlab='', ylab='')
        
        plot(data$x,data$y, type='n', pch=19, main='Pairs', axes=F, xlab='', ylab='')
        for(i in 1:(nrow(pairs)/2)){
                points(c(pairs$x[i*2], pairs$x[i*2-1]), c(pairs$y[i*2], pairs$y[i*2-1]), type='l', col='grey40')
                #  print(i)
        }
        
        plot(data$x,data$y, type='n', pch=19, main='Singlets', axes=F, xlab='', ylab='')
        points(y~x, data=data[data$col=='red',], col='red', pch=19, cex=0.2)
        #points(data$x,data$y, type='p', pch=19, cex=0.1)
        
        
        
        
        #for(i in 1:(nrow(pairs)/2)){
        #  points(c(pairs$x[i*2], pairs$x[i*2-1]), c(pairs$y[i*2], pairs$y[i*2-1]), type='l')
        #  print(i)
        #}
        #points(y~x, data=singlets, col='red', cex=0.5, pch=19)
        
        
        
        ##calculate differences
        #if(nrow(pairs)>0){
         #       diffs<-c(abs(pairs[1,]$x-pairs[2,]$x),abs(pairs[1,]$y-pairs[2,]$y))
        #        
        #        
        #        
        #        for(i in 2:(nrow(pairs)/2)){
        #                diffs<-rbind(diffs, c(abs(pairs[i*2-1,]$x-pairs[i*2,]$x),abs(pairs[i*2-1,]$y-pairs[i*2,]$y)))
        #        }
        #        diffs<-cbind(diffs,sqrt(diffs[,1]**2+diffs[,2]**2))
        #        plot(diffs[,2]~diffs[,1], pch=19, cex=0.2, asp=1)
        #        
        #} else {
        #        print('No paires in cluster.')
        #        diffs<-c(0,0,0)
        #}  
        
        no_reads<-nrow(data)
        no_in_pairs<-(nrow(pairs)/nrow(data)*100)
        print (paste(no_reads, 'reads'))
        print (paste(round(no_in_pairs, digits=2), '% in pairs'))
        
        plot(c(1:6),c(1:6), axes=F, ylab='', xlab='', type='n')
        text(2,5, paste(no_reads, 'reads'), cex=2, pos=4)
        text(2,3, paste(round(no_in_pairs, digits=2), '% in pairs'), cex=2, pos=4)
        
        
        par(mfrow=c(1,1))
        print ("Done.")
        #dev.off()
        #return(diffs)
}

pairshow()
