require(tidyverse)

dat <- read_csv('data/fiveYear.csv')
names(dat) <- tolower(names(dat))

if(file.exists("data/gqTot.RData")) load("data/gqTot.RData") else{
  if(sum(dat$gq==3)>0){
    gqTot <- dat%>%
      select(gq,diffhear,age,perwt)
    save(gqTot,file='data/gqTot.RData')
  } else stop("better start over")
}

if(sum(dat$gq==3)>0){
  dat <- dat%>%
    filter(gq%in%c(1,2,5)) ### not in group quarters
}

### data on deaf missingness:
deafMissDat <- dat%>%
  select(diffhear,qdifhear)
save(deafMissDat,file='data/deafMissDat.RData')

### only interested in families w/ deaf member
dat <- dat%>%
  group_by(serial)%>%
  mutate(ndeaf=sum(diffhear==2,na.rm=TRUE))%>%
  filter(ndeaf>0)%>% ### only look at HH with at least 1 deaf person
  ungroup()
save(dat,file="data/deafFams.RData")