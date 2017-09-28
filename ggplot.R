

getwd()
setwd("/Users/amit/Documents/R Programming")
getwd()

movies <- read.csv("Movie-Ratings.csv")
movies
head(movies)
tail(movies)

str(movies)
summary(movies)

colnames(movies) <- c("Film", "Genre", "CriticRatings", "AudienceRatings", "Budget", "Year")
head(movies)

year
movies$Year
movies$Year <- factor(movies$Year)
summary(movies)
movies$year <- NULL
head(movies)



#------------------------- use of ggplot
library(ggplot2)

ggplot(data = movies, aes(x = CriticRatings, y = AudienceRatings)) +
geom_point()

#------------------------- addition of more aesthetics

ggplot(data = movies, aes(x = CriticRatings, y = AudienceRatings, color = Genre, size = Budget, alpha = 0.6)) +
  geom_point()

#------------------------- Adding layeers

p <- ggplot(data = movies, aes(x = CriticRatings, y = AudienceRatings, color = Genre, size = Budget, alpha = 0.6))
p

p + geom_point() 

#------------------------- Overriding aesthetics

p + geom_point(aes(color = Budget))

p + geom_point(aes(size = Budget))

# p remains the same
p  + geom_point()

#------------------------- reduce size of lines
p + geom_point(size = 1) + geom_line(size = 1)


#------------------------- Mapping vs setting

r <- ggplot(data = movies, aes(x= CriticRatings, y= AudienceRatings))
#Mapping:
s <- r + geom_point(aes(color = Genre))
s + geom_point(aes(size = Budget))

#Setting:
r + geom_point(color = "Green")
r + geom_point(size = 10)

#------------------------- Histograms and density charts

s <- ggplot(data = movies, aes(x = Budget))
s + geom_histogram(binwidth = 10)

#add color
s + geom_histogram(binwidth = 10, aes(fill = Genre))

#add border
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")


#------------------------- Starting layer tip

t <- ggplot(data = movies, aes(x = AudienceRatings))
t + geom_histogram(binwidth = 10, fill = "white", color = "blue")

#another way:

t <- ggplot(data = movies)
t + geom_histogram(binwidth = 10,
                   aes(x = AudienceRatings),
                   fill = "white", color = "blue")

t + geom_histogram(binwidth = 10,
                   aes(x = CriticRatings),
                   fill = "white", color = "blue")


#------------------------- Stastistical Transformation

u <- ggplot(data = movies, aes(x =CriticRatings, y = AudienceRatings,
                               color = Genre))
u + geom_point() + geom_smooth(fill = NA)


#------------------------- boxplot

v <- ggplot(data = movies, aes(x =Genre, y = AudienceRatings,
                               color = Genre))

v + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5)

#------------------------- Using facets

u <- ggplot(data = movies, aes(x = Budget))
u + geom_histogram(binwidth = 10, aes(fill = Genre),color = "black") +
  facet_grid(Genre~., scales = "free")

#facets:

w <- ggplot(data = movies, aes(x = CriticRatings, y = AudienceRatings, color = Genre))

w + geom_point(size = 3) + facet_grid(Genre~.) + geom_smooth()

w + geom_point(size = 3) + facet_grid(.~Year) + geom_smooth()


w + geom_point(aes(size= Budget)) + geom_smooth() + facet_grid(Genre~Year)
#------------------------- Coordinates

m <- ggplot(data = movies, aes(x = CriticRatings, y = AudienceRatings,
                               size = Budget, color = Genre))

m + geom_point() + xlim(50,100)
#doesn't woek well always


n <- ggplot(data = movies, aes(x = Budget, fill = Genre))
n + geom_histogram(binwidth = 10, color = "black") +
  xlim(0,100) + ylim(0,100)

#zooming

n + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black") +
  coord_cartesian(ylim = c(0,75))

w + geom_point(aes(size= Budget)) + geom_smooth() + facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

#------------------------- Themes

o <- ggplot(data = movies, aes(x = Budget))
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")
h

#axes labels
h + xlab("Money Axis") + ylab("Number of Movies")

# formatting labels
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "Green", size = 30),
        axis.title.y = element_text(color = "Red", size = 30))
  
#tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "Green", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(color = "Blue", size = 20),
        axis.text.y = element_text(color = "Yellow", size = 20))

#legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "Green", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(color = "Blue", size = 20),
        axis.text.y = element_text(color = "Yellow", size = 20),
        legend.title = element_text(size = 30), legend.text = element_text(size = 20),
        legend.position = c(1,1), legend.justification = c(1,1))

#title
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "Green", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(color = "Blue", size = 20),
        axis.text.y = element_text(color = "Yellow", size = 20),
        legend.title = element_text(size = 30), legend.text = element_text(size = 20),
        legend.position = c(1,1), legend.justification = c(1,1),
        plot.title = element_text(size = 40, color = "Darkblue"))
  



