library(tidyverse)
#library(ff)
source('generalCode/estimationFunctions.r')

#dat <- read_csv('../../data/ipums/usa_00001.csv', n_max=20)
#dat <- read.csv.ffdf(file='../../data/ipums/usa_00001.csv')

dat <- read_csv('deafHHdata.csv')

names(dat) <- tolower(names(dat))

dat <- dat%>%
    filter(gq%in%c(1,2)) ### not in group quarters

gc()

dat1 <- dat%>%
    group_by(serial)%>%
      mutate(ndeaf=sum(diffhear==2,na.rm=TRUE))%>%
        filter(ndeaf>0)%>% ### only look at HH with at least 1 deaf person
          ungroup()


rm(dat)
gc()

save(dat1,file='deaf.RData')

famDat <- dat1%>%
  group_by(serial)%>%
    summarize(nfams=nfams[1],nmothers=nmothers[1],nfathers=nfathers[1],npop=sum(poploc>0),
              nmom=sum(momloc>0),ownchildren=any(nchild>0),nkid=sum(age<17),
              ndeafkid=sum(age<17&diffhear==2),ndeaf=sum(diffhear==2),nppl=n())




deafKids <- dat1%>%
  group_by(serial)%>%
    arrange(pernum)%>%
      mutate(
        pn2=1:n(),
        hasDad=poploc>0,hasMom=momloc>0,
        hasParent=hasDad|hasMom,
        deafDad=ifelse(hasDad,diffhear[poploc]==2,FALSE),
        deafMom=ifelse(hasMom,diffhear[momloc]==2,FALSE),
        deafDad2 = ifelse(poploc2==0,FALSE,diffhear[poploc2]==2),
        deafMom2 = ifelse(momloc2==0,FALSE,diffhear[momloc2]==2),
        numParents=I(momloc>0)+I(poploc>0)+I(momloc2>0)+I(poploc2>0),
        deafParent=deafMom|deafDad|deafDad2|deafMom2,
        deafDad=deafDad|deafDad2,
        deafMom=deafMom|deafMom2,
        numAdults=sum(age>17),
        numDeafAdults=sum(age>17 & diffhear==2),
        anyDeafAdults=numDeafAdults>0,
        numDeafParents=deafDad+deafDad2+deafMom+deafMom2,
        twoDeafParents=numDeafParents>=2,
        numOtherDeafChildren=sum(age<18&diffhear==2)-1
         )

## just to check
mean(deafKids$pernum==deafKids$pn2)

deafKids <- filter(deafKids,diffhear==2,age<=17)

deafKids%>%group_by(age)%>%summarize(hasParent=mean(hasParent))%>%ggplot(aes(age,hasParent))+geom_point()+ylim(0,1)+geom_smooth()

### estimate the total # in a subgroup & the % of non-GQ deaf kids who are in subgroup
## rounding rules based on https://arxiv.org/ftp/arxiv/papers/1301/1301.1034.pdf
estSubst <- function(subst,name){
  N <- svTot(deafKids,subst,w1='perwt',wrep=paste0('repwtp',1:80))
  N <- prettyNum(c(round(N[1:2],-floor(log(N['se'],10))+1),N[3]),big.mark=',')
  per <- estSEstr(subst,w1='perwt',wrep=paste0('repwtp',1:80),sdat=deafKids)
  roundPer <- ifelse(per['se']==0,0,-floor(log(per['se']*100,10))+1)
  per <- c(
      formatC(round(per[c(1,2)]*100,roundPer),roundPer,format='f'),
      prettyNum(per[3],big.mark=',')
  )
  cbind(tibble(`living with...`=c(name,''),`N/%`=c('N','%')),rbind(N,per))
}

############################################################################################################
#### Questions
### from https://docs.google.com/document/d/1LbjhZl6ZdEJJMl7wfSLOhn7OYDXLNXvaV7RXCK5_oMo/edit

## Among deaf children (17 or younger) living in non-institutionalized/group quarters,

### living with deaf adults:
## how many of them live with deaf adults 18+?
## How many live with more than one deaf adult?
## How many live with at least one deaf parent?
## How many live with two deaf parents?

### living with (other) deaf children:
## how many of them live with other deaf children?
## How many with more than one other deaf child?
############################################################################################################

### total # of deaf children <18 (excl. GQ)
total <- round(svTot(deafKids,w1='perwt',wrep=paste0('repwtp',1:80)))


### proportions deaf kids
kidEst <- bind_rows(
    estSubst('age<18','TOTAL (non-GQ deaf children)'),
    estSubst('numDeafParents>0','at least 1 deaf parent'),
    estSubst('numDeafParents==1','exactly 1 deaf parent'),
    estSubst('numDeafParents==2','exactly 2 deaf parents'),
    estSubst('numDeafAdults>0','at least 1 deaf adult'),
    estSubst('numDeafAdults>1','at least 2 deaf adults'),
    estSubst('numOtherDeafChildren>0','at least 1 other deaf kid'),
    estSubst('numOtherDeafChildren>1','at least 2 other deaf kids'))%>%
    add_case(`living with...`="NOTES:")%>%
    add_case(`living with...`=paste("Year=",paste(unique(dat1$year),collapse=', ')))%>%
    add_case(`living with...`="Excluding deaf children in group quarters")%>%
    add_case(`living with...`="Child: <18; Adult: 18+")%>%
    add_case(`living with...`="Denominator for % is all deaf children")

kidEst[is.na(kidEst)] <- ''

write.csv(kidEst,'deafKidsWdeafParentsAndKids.csv',row.names=FALSE)






