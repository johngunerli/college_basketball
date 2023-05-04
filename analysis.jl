using Pkg 
# Pkg.add("Plots"); Pkg.add("DataFrames"); Pkg.add("CSV")
using Plots; using DataFrames; using CSV

cbb= CSV.read("./cbb/cbb.csv", DataFrame)

first(cbb,5)
describe(cbb)

# get which teams qualified the most
cbb_filtered = filter(row -> row.POSTSEASON != "NA", cbb)
cbb_grouped = combine(groupby(cbb_filtered, [:TEAM]), nrow => :count)
cbb_sorted = sort(cbb_grouped, :count, rev=true)


# who has made it to sweet 16 the most? 
cbb_sweet16 = filter(row -> row.POSTSEASON == "S16", cbb)
cbb_sweet16_grouped = combine(groupby(cbb_sweet16, [:TEAM]), nrow => :count)
cbb_sweet16_sorted = sort(cbb_sweet16_grouped, :count, rev=true)


# who's been the most champions?
cbb_champs = filter(row -> row.POSTSEASON == "Champions", cbb)
cbb_champs_grouped = combine(groupby(cbb_champs, [:TEAM]), nrow => :count)
cbb_champs_sorted = sort(cbb_champs_grouped, :count, rev=true)

# filter georgia teams
ga_teams = filter(row -> occursin("Georgia", row.TEAM), cbb)

good_ranking = ["S16", "E8", "F4", "2ND", "Champions"]
# do we have any teams that have been in any of these good rankings?
for rank in good_ranking
    println(rank)
    println(filter(row -> row.POSTSEASON == rank, ga_teams))
end
#welp 

ga_best = filter(row -> occursin("Georgia", row.TEAM) && row.POSTSEASON != "NA", cbb)
ga_best_grouped = combine(groupby(ga_best, [:TEAM]), nrow => :count)

# get what georgia tech did in all competitions 

ga_tech = filter(row -> occursin("Georgia Tech", row.TEAM), cbb)
