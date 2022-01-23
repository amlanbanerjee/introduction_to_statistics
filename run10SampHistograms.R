
library(openintro)
data(COL)
data(run10)
run10Samp <- run10[sample(nrow(run10), 100), ]
d <- run10Samp

myPNG("run10SampHistograms.png", 500, 400,
      mar = c(3.5, 3.5, 0.5, 1.5),
      mgp = c(2.2, 0.55, 0))
histPlot(d$time,
         xlab = "Time (minutes)",
         ylab = "Frequency",
         col = COL[1],
         main = paste0("mean = ", round(mean(d$time),2))
        )
axis(1, at = seq(50, 150, 10))
dev.off()
