# Data structures

#vectors----
v1=1:100 #create vector from 1 to 100
v2=c(1,4,5,10)
class(v1)
class(v2)
v3=c('a','santa','banta')
v3 #print the vector
v3=c(TRUE,FALSE,T,F,T)
class(v4)
#summary on vectors
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height)
v2[v2>=5]


x=rnorm(60,mean=60,sd=10)
x
plot(x)
hist(x)
plot(density(x))
abline(v=60)
#rectangles and density together
hist(x,freq=F)
lines(density(x))

hist(x,breaks=10,col=1:10)
lines(density(x))
length(x)
sd(x)


?sample
x1=LETTERS[5:20]
x1

set.seed(1234)
y1=sample(x1)
y1


set.seed(6)
(y2=sample(x1,size=5))

(gender=sample(c('M','F'),size=1000000,replace=TRUE,prob=c(.3,.7)))
(t1=table(gender))
prop.table(t1)
pie(t1)
barplot(t1,col=1:2,horiz=T)

#matrix----
(m1=matrix(1:24,nrow=4))
(m2=matrix(1:24,nrow=4,byrow=T))

(m3=matrix(1:24,ncol=4,byrow=T))
(x=trunc(runif(60,60,100)))
plot(density(x))
(m4=matrix(x,ncol=6))
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4>67]
m4[m4>67&m4<86]
m4[8:10,c(1,3,5)]
rowSums(m4[8:10,c(1,3,5)])
#round, trunc, ceiling, floor


?runif



#array----

#data.frame
#rollno, name, gender, course, marks1, marks2
(rollno=1:60)
(name=paste('student1',1:60,sep = '-'))
name[1:20]
name[c(15,20,37)]
name[-c(1:10)]
rev(name)
name[60:1]
(gender=sample(c('MALE','FEMALE'),size=60, replace=T, prob=c(.3,.7)))
(course=sample(c('BBA','MBA','FPM'),size=60,replace=T,prob=c(.2,.2,.6)))

(marks1=ceiling(rnorm(60,mean=65,sd=7)))
(marks2=ceiling(rnorm(60,mean=65,sd=11)))
(grades=sample(c('A','B','C'),size=60, replace=T))

students=data.frame(rollno,name, gender,course,marks1,marks2,grades, stringsAsFactors=F)
class(students)
summary(students)
students[,c('name')]
students[students$gender=='MALE',c('rollno','gender','marks1')]
students[students$gender=='MALE'& students$grades=='c',c('rollno','gender','marks1')]
students$gender
t1=table(students$gender)
barplot(table(students$course))
student1. student2
students[students$marks>55|students$marks<75,c('name','marks1')]
text(1:3,table(students$course)+5,table(students$course))


str(students)
nrow(students)
names(students)
dim(students)
head(students)
tail(students)
head(students,n=7)
students[10:15,-c(3)]

#avg marks scored by each gender in marks1
#gender, marks1
aggregate(students$marks1,by=list(students$gender),FUN=mean)
aggregate(students$marks2,by=list(students$gender),FUN=max) #max marks scored by each student in course 2
aggregate(students$marks2,by=list(students$course, students$gender),FUN=mean)

#dplyr
library(dplyr)
students%>%group_by(gender)%>%summarise(mean(marks1))
students%>%group_by(course,gender)%>%summarise(mean(marks1))
students%>%group_by(gender)%>%summarise(mean(marks1),min(marks2),max(marks2))
students%>%group_by(course)%>%summarise(mean(marks1))
students%>%group_by(gender)%>%summarise(mean(marks2))
students%>%group_by(course,gender)%>%summarise(meanmarks1=mean(marks1),min(marks2),max(marks2))%>%arrange(desc(meanmarks1))
students%>%arrange(desc(marks1))%>% filter(gender=='MALE')%>%top_n(5)
?sample_frac
sample_frac(students,replace=T,0.1)
?sample_n
sample_n(students, 5, replace = TRUE)
students%>%sample_frac(.1)
students%>%sample_n(10)
students%>%sample_frac(.1)%>%arrange(course)%>%select(name,gender)
students%>%arrange(course,marks1,grades)%>%select(course,gender,marks1)%>%filter(course=='BBA',grades=='B')


#factor
names(students)
students$gender=factor(students$gender)
summary(students$gender)
summary(students$course)
students$course=factor(students$course,ordered=T)
summary(students$course)
students$course=factor(students$course,ordered=T,levels=c('FPM','MBA','BBA'))
summary(students$course)
students$grades
students$grades=factor(students$grades,ordered=T,levels=c('C','B','A'))
summary(students$grades)
students$grades

students
write.csv(students,'./data/iimtrichy.csv')
students2=read.csv('./data/iimtrichy.csv')
students3=read.csv(file.choose())
install.packages('gsheet')



