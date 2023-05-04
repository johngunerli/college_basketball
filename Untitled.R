```{r}


cbb = read.csv("./cbb/cbb.csv")
head(cbb)
```

```{r}
summary(cbb)
```

```{r}

cbb_filtered <- cbb[cbb$POSTSEASON != "NA", ]

cbb_grouped <- aggregate(list(count = cbb_filtered$POSTSEASON), 
                         by = list(TEAM = cbb_filtered$TEAM), 
                         FUN = length)

cbb_sorted <- cbb_grouped[order(cbb_grouped$count, decreasing = TRUE), ]

cbb_sorted
```

```{r}

cbb_sweet16 <- subset(cbb, POSTSEASON == "S16")

cbb_sweet16_grouped <- aggregate(list(count = cbb_sweet16$POSTSEASON), 
                                 by = list(TEAM = cbb_sweet16$TEAM), 
                                 FUN = length)

cbb_sweet16_sorted <- cbb_sweet16_grouped[order(cbb_sweet16_grouped$count, decreasing = TRUE), ]
cbb_sweet16_sorted




```

```{r}
cbb_champs <- subset(cbb, POSTSEASON == "Champions")

cbb_champs_grouped <- aggregate(list(count = cbb_champs$POSTSEASON), 
                                by = list(TEAM = cbb_champs$TEAM), 
                                FUN = length)

cbb_champs_sorted <- cbb_champs_grouped[order(cbb_champs_grouped$count, decreasing = TRUE), ]
cbb_champs_sorted

```

```{r}

ga_teams <- subset(cbb, grepl("Georgia", TEAM))

print(ga_teams)

good_ranking <- c("S16", "E8", "F4", "2ND", "Champions")

for (rank in good_ranking) {
  print(subset(ga_teams, POSTSEASON == rank))
}


ga_best <- subset(cbb, grepl("Georgia", TEAM) & POSTSEASON != "NA")
ga_best_grouped <- aggregate(list(count = ga_best$POSTSEASON), 
                              by = list(TEAM = ga_best$TEAM), 
                              FUN = length)

print(ga_best_grouped)
ga_tech <- subset(cbb, grepl("Georgia Tech", TEAM))
print(ga_tech)
```
