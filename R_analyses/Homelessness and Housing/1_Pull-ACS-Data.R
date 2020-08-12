library(acs)

county = geo.make(state="DC")

var_total = "B01001_001"
vars_under18 = list("B01001_003","B01001_004","B01001_005","B01001_006","B01001_027","B01001_028","B01001_029","B01001_030")
var_occupiedunits = "B25002_002"
var_forrent = "B25004_002"
var_forsale = "B25004_004"

#total population minus population under 18

pop <- c()

for(yr in 2011:2018){
  total <- acs.fetch(endyear=yr, span=1, geography=county, variable = var_total)
  u18count <- 0
  for(u18var in vars_under18){
    curr_u18 <- acs.fetch(endyear=yr, span=1, geography =county, variable = u18var)
    u18count = u18count + curr_u18@estimate[1][1]
    }
  pop <- c(pop, total@estimate[1][1] - u18count)
}

View(pop)

#Assemble mkt housing
columns = c("2011","2012","2013","2014","2015","2016","2017","2018")
rows = c("occupied","for_rent","for_sale")
mkthousing <- matrix(nrow = 3, ncol = 8, dimnames = list(rows, columns))

for(yr in 2011:2018){
  x <- acs.fetch(endyear=yr, span=1, geography=county, variable = var_occupiedunits)
  y <- acs.fetch(endyear=yr, span=1, geography=county, variable = var_forrent)
  z <- acs.fetch(endyear=yr, span=1, geography=county, variable = var_forsale)
  
  mkthousing["occupied", toString(yr)] = x@estimate[1][1]
  mkthousing["for_rent", toString(yr)] = y@estimate[1][1]
  mkthousing["for_sale", toString(yr)] = z@estimate[1][1]
}
mkthousing <- rbind(mkthousing, colSums(mkthousing))
`rownames<-`(mkthousing, c("occupied","for_rent","for_sale","total"))

View(mkthousing)

# ##interpolate missing data from glendale and pasadena
# GDmkthousing_raw <- GDmkthousing
# PDmkthousing_raw <- PDmkthousing
# 
# GDmkthousing["for_rent",] <- na_interpolation(GDmkthousing["for_rent",])
# GDmkthousing["for_sale",] <- na_interpolation(GDmkthousing["for_sale",])
# PDmkthousing["for_rent",] <- na_interpolation(PDmkthousing["for_rent",])
# PDmkthousing["for_sale",] <- na_interpolation(PDmkthousing["for_sale",])
# mode(GDmkthousing) <- "integer"
# mode(PDmkthousing) <- "integer"