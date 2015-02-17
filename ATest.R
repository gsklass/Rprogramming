#This is a test file
x<-1:30
y<-vector("numeric",5)
z<-c(1,2,3,4,5)
a<-as.character(z)
b<-list(x,y,z,a)
c<-matrix(1:6,2,3)
#check this out
d<-1:10
dim(d)<-c(2,5)
# and this (more common way of creating matricies )
e<-1:5
f<-3*e
g<-cbind(e,f)
h<-rbind(e,f)
attributes(h)
# factors -- much like enums
k<-factor(c("yes","no","yes","yes"))
attributes(k)
table(k) #gives an occurance count
n<-factor(c("yes","no","yes","yes"),level=c("yes","no")) #optional selection of order
#
m<-data.frame(index=1:5,f,e,g)
# remember to compute the rough size of the memory to be read in with read.csv() or read.data
# source() reads in an R file ...e

#
# output dump() and dput() for multiple and single objects, respectively
#
#Connections:
#file, gzfile, bzfile, url
# subsets ..
f[1:3]
g<-f[f>3 & f <12]

fn<-function(a1,a2,a3){
  print("suprise")
}
args(fn)

x<-as.Date("2015-02-15")
unclass(x)

xx