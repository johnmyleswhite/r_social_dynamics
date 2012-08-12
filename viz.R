library("entropy")
library("plyr")

committers <- read.csv("committers.tsv", sep = "\t")

ggplot(committers,
       aes(x = Year, y = Commits, group = Committer, color = Committer)) +
  geom_line() +
  xlab("Year") +
  ylab("Number of Commits per Committer") +
  opts(title = "Who Makes Commits to R?")
ggsave("commits.png", height = 7, width = 10)

calculate_entropy <- function(df)
{
  probs <- df$Commits / sum(df$Commits)
  return(entropy(probs))
}

inequality <- ddply(committers, "Year", function (df) {calculate_entropy(df)})

ggplot(inequality, aes(x = Year, y = V1)) +
  geom_line() +
  xlab("Year") +
  ylab("Entropy of Commits") +
  opts(title = "Decreasingly Equal Contributions of R Core Committers")
ggsave("entropy.png", height = 7, width = 10)
