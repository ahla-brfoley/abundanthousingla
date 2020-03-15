library(here)
here()
print(here())
a_file = read.csv(here("localdata", "Geocodes2019.csv"), stringsAsFactors = F)
print(head(a_file))

