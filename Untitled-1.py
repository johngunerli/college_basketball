# %%
# DOWNLOAD https://www.kaggle.com/datasets/andrewsundberg/college-basketball-dataset/download?datasetVersionNumber=4
import polars as pl
import numpy as np
import matplotlib.pyplot as plt


# %%
# # unzip archive.zip and put them into a folder called cbb 
# !unzip archive.zip -d cbb
# # erase the zip file
# !rm archive.zip -y

# %%
cbb = pl.read_csv('cbb/cbb.csv')
cbb.head()

# %%
cbb.describe()

# %%


# %%
# compare the two 
cbb_champions.describe()

cbb_2nd.describe()

# %%
# who has qualified the most times, qualifiying means they're not in NA

cbb.filter(pl.col('POSTSEASON') != 'NA').select(['TEAM', 'YEAR']).sort('YEAR', descending=True).groupby("TEAM").count().sort('count', descending=True)

# %%
# who has made it to the sweet 16 the most? 
s16 = cbb.filter(pl.col('POSTSEASON') == 'S16').select(['TEAM', 'YEAR']).sort('YEAR', descending=True).groupby("TEAM").count()
s16.sort('count', descending=True)

# %%
cbb_2nd.select(['TEAM', 'YEAR']).sort('YEAR', descending=True).groupby("TEAM").count()

# %%
# who's been the most champions?

cbb_champions.select(['TEAM', 'YEAR']).sort('YEAR', descending=True).groupby("TEAM").count()

# %%
# what kind of postseason information do we have?

cbb.groupby('POSTSEASON').count()

# %%
# what about the Georgia teams like uGA (Georgia), Georgia Tech, Georgia State, GA Southern etc.

ga = cbb.filter(pl.col('TEAM').str.contains('Georgia'))

# %%
ga

# %%
good_ranking = ['S16', 'E8', 'F4', '2ND', 'Champions']
# do we have any teams that have been in any of these good rankings?

for r in good_ranking:
    print(r)
    print(ga.filter(pl.col("POSTSEASON") == r).groupby("TEAM").count())

#hope.

# %%
#nope, no hope for Georgia teams. what's the best we did?

ga.filter(pl.col("TEAM").str.contains("Georgia")).groupby("POSTSEASON").count()

# %%
# who did R32?

ga.filter(pl.col("POSTSEASON") == 'R32').groupby("TEAM").count()

# %%
#oh! good job panthers! what year was that? 
ga.filter(pl.col("POSTSEASON") == 'R32').groupby("YEAR").count() # 2015? cool! 

# %%
# what did gatech do?

ga.filter(pl.col("TEAM") == "Georgia").groupby("POSTSEASON").count()

# %%



