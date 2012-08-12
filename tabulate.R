library("plyr")

committers <- read.csv("committers.tsv", sep = "\t")

total.commits <- ddply(committers, "Committer", function (df) {sum(df$Commits)})
total.commits[rev(order(total.commits$V1)), ]
