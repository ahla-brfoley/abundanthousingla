library(acs)

laco = geo.make(state="CA", county="Los Angeles")
longbeach = geo.make(state="CA", place="Long Beach city")
glendale = geo.make(state="CA", place="Glendale city")
pasadena = geo.make(state="CA", place="Pasadena city")

var_total = "B01001_001"
vars_under18 = list("B01001_003","B01001_004","B01001_005","B01001_006","B01001_027","B01001_028","B01001_029","B01001_030")
var_occupiedunits = "B25002_002"
var_forrent = "B25004_002"
var_forsale = "B25004_004"

#total population minus population under 18

LApop <- c()
LBpop <- c()
GDpop <- c()
PDpop <- c()

for(place in list(laco,longbeach,glendale,pasadena)){
  
  for(yr in 2011:2018){
    total <- acs.fetch(endyear=yr, span=1, geography=place, variable = var_total)
    u18count <- 0
    for(u18var in vars_under18){
      curr_u18 <- acs.fetch(endyear=yr, span=1, geography = place, variable = u18var)
      u18count = u18count + curr_u18@estimate[1][1]
    }
    if(grepl("Los Angeles",place@geo.list[1][1])){
      LApop <- c(LApop, total@estimate[1][1] - u18count)
    }else if(grepl("Long Beach",place@geo.list[1][1])){
      LBpop <- c(LBpop, total@estimate[1][1] - u18count)
    }else if(grepl("Glendale",place@geo.list[1][1])){
      GDpop <- c(GDpop, total@estimate[1][1] - u18count)
    }else if(grepl("Pasadena",place@geo.list[1][1])){
      PDpop <- c(PDpop, total@estimate[1][1] - u18count)
    }
  }
}

LACOCpop <- LApop - LBpop - GDpop - PDpop

#assemble mkt housing
columns = c("2011","2012","2013","2014","2015","2016","2017","2018")
rows = c("occupied","for_rent","for_sale")
LAmkthousing <- matrix(nrow = 3, ncol = 8, dimnames = list(rows, columns))
LBmkthousing <- matrix(nrow = 3, ncol = 8, dimnames = list(rows, columns))
GDmkthousing <- matrix(nrow = 3, ncol = 8, dimnames = list(rows, columns))
PDmkthousing <- matrix(nrow = 3, ncol = 8, dimnames = list(rows, columns))
LACOCmkthousing <- matrix(nrow = 4, ncol = 8, dimnames = list(c("occupied","for_rent","for_sale","total"), columns))


for(place in list(laco,longbeach,glendale,pasadena)){
  for(yr in 2011:2018){
    x <- acs.fetch(endyear=yr, span=1, geography=place, variable = var_occupiedunits)
    y <- acs.fetch(endyear=yr, span=1, geography=place, variable = var_forrent)
    z <- acs.fetch(endyear=yr, span=1, geography=place, variable = var_forsale)
    
    if(grepl("Los Angeles",place@geo.list[1][1])){
      LAmkthousing["occupied", toString(yr)] = x@estimate[1][1]
      LAmkthousing["for_rent", toString(yr)] = y@estimate[1][1]
      LAmkthousing["for_sale", toString(yr)] = z@estimate[1][1]
    }else if(grepl("Long Beach",place@geo.list[1][1])){
      LBmkthousing["occupied", toString(yr)] = x@estimate[1][1]
      LBmkthousing["for_rent", toString(yr)] = y@estimate[1][1]
      LBmkthousing["for_sale", toString(yr)] = z@estimate[1][1]
    }else if(grepl("Glendale",place@geo.list[1][1])){
      GDmkthousing["occupied", toString(yr)] = x@estimate[1][1]
      GDmkthousing["for_rent", toString(yr)] = y@estimate[1][1]
      GDmkthousing["for_sale", toString(yr)] = z@estimate[1][1]
    }else if(grepl("Pasadena",place@geo.list[1][1])){
      PDmkthousing["occupied", toString(yr)] = x@estimate[1][1]
      PDmkthousing["for_rent", toString(yr)] = y@estimate[1][1]
      PDmkthousing["for_sale", toString(yr)] = z@estimate[1][1]
    }
  }
}

##interpolate missing data from glendale and pasadena
GDmkthousing_raw <- GDmkthousing
PDmkthousing_raw <- PDmkthousing

GDmkthousing["for_rent",] <- na_interpolation(GDmkthousing["for_rent",])
GDmkthousing["for_sale",] <- na_interpolation(GDmkthousing["for_sale",])
PDmkthousing["for_rent",] <- na_interpolation(PDmkthousing["for_rent",])
PDmkthousing["for_sale",] <- na_interpolation(PDmkthousing["for_sale",])
mode(GDmkthousing) <- "integer"
mode(PDmkthousing) <- "integer"
LACOCmkthousing = LAmkthousing - LBmkthousing - GDmkthousing - PDmkthousing
LACOCmkthousing <- rbind(LACOCmkthousing, colSums(LACOCmkthousing))
`rownames<-`(LACOCmkthousing, c("occupied","for_rent","for_sale","total"))