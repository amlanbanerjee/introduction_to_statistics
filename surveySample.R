library(openintro)
data(COL)

set.seed(52)
myPNG("surveySample.png",
      1000,
      800,
      mar = rep(0, 4))

plot(c(0, 2),
     c(0, 1.1),
     type='n',
     axes=FALSE)
temp <- seq(0, 2 * pi, 2 * pi / 100)
x <- 0.5 + 0.5 * cos(temp)
y <- 0.5 + 0.5 * sin(temp)
lines(x, y)

s <- matrix(runif(700), ncol = 2)
S <- matrix(NA, 350, 2)
j <- 0
sub <- rep(FALSE, 1000)
for (i in 1:nrow(s)) {
    if (sum((s[i,] - 0.5)^2) < 0.23) {
        j <- j + 1
        S[j, ] <- s[i, ]
    }
    if (sum((s[i, ] - c(-0.15, 0.05) - 0.5)^2) < 0.115) {
        sub[j] <- TRUE
    }
}
points(S, col = COL[1, 4 - 2 * sub], pch = 20)
text(0.5, 1, 'population of interest', pos = 3)
lines((x - 0.5) * 2 * sqrt(0.115) + 0.35,
      (y - 0.5) * 2 * sqrt(0.115) + 0.55)

set.seed(7)
N <- sample((1:j)[sub], 25)
lines((x - 0.5) / 2 + 1.5,
      (y - 0.5) / 2 + 0.5,
      pch=20)

SS <- (S[N, ] - 0.5) / 2 + 0.5
these <- c(2, 5, 6, 7, 15)
points(SS[these, 1] + 1,
       SS[these, 2],
       col = COL[4, 2],
       pch = 20,
       cex = 1.5)
text(1.5, 0.75, 'sample', pos=3)

for(i in these){
    arrows(S[N[i], 1],
           S[N[i], 2],
           SS[i, 1] + 1 - 0.03,
           SS[i, 2],
           length=0.08,
           col=COL[5],
           lwd=1.5)
}
rect(0.145, 0.195, 0.775, 0.11,
     border="#00000000",
     col="#FFFFFF88")
rect(0.31, 0.018, 0.605, 0.11,
     border="#00000000",
     col="#FFFFFF88")
text(0.46, 0.5 + 0.06 - sqrt(0.115),
     'population actually\nsampled',
     pos=1,
     cex=0.8)
dev.off()
