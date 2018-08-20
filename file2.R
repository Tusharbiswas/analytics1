library(gsheet)
library(dplyr)
url='https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco=as.data.frame(gsheet2tbl(url))
head(denco)
str(denco)
denco %>% count(custname,sort=TRUE)
denco %>% group_by(custname) %>% summarise(n=n()) %>% arrange(desc(n))
#summarise by partnum

df3a=aggregate(denco$revenue,by=list(denco$partnum), FUN=sum)
denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))
#which part have highest profit :partno-sum(profit)
names(sales)
df4a=aggregate(margin ~ partnum, data=
                                                       