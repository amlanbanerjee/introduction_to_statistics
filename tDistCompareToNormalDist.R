library(openintro)
data(COL)

myPNG('tDistCompareToNormalDist.png', 430, 200,
      mar = c(1.8, 1, 0, 1),
      mgp = c(5, 0.6, 0))
plot(c(-4.2, 4.2),
     c(0, dnorm(0)),
     type = 'n',
     axes = FALSE)
axis(1)
abline(h = 0)

X <- seq(-5, 5, 0.01)
Y <- dnorm(X)
lines(X, Y, lty = 3, lwd = 2.5, col = COL[4])

Y <- dt(X, 2)
lines(X, Y, lwd = 1.8, col = COL[1])

dev.off()