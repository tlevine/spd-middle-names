#!/usr/bin/env Rscript

roster <- read.csv('roster.csv', stringsAsFactors = F)
roster$Has.middle.name <- sapply(strsplit(roster$Name, ' '), length) > 2
conclusion <- paste(sum(roster$Has.middle.name), 'of', nrow(roster), 'SPD employees have middle names.')

print(conclusion)

library(ggplot2)
p <- ggplot(roster) + aes(x = Has.middle.name) +geom_bar() +
  labs(title = conclusion) +
  scale_y_continuous('Number of Seattle Police Department employees') +
  scale_x_discrete('Middle name?', labels = c('No', 'Yes'))

print(p)
