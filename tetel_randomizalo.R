
######## SET PARAMETERS FOR RANDOMIZATION HERE ##########

# set which tetelsor to use, possible entries: "magyar_2015" "magyar_2019" "angol_2015"  "angol_2019" 

which_tetelsor = "magyar_2019"   

######## SET PARAMETERS FOR RANDOMIZATION HERE ##########



library(gsheet)
library(tidyverse)
library(stringr)

data = gsheet2tbl("https://docs.google.com/spreadsheets/d/1Pv_njmoRFVc6Dnnglmky8KUB1cKLwqiWJ6JKcQBvLOM/edit?usp=sharing")

data_filtered = data %>% 
  filter(tetelsor == which_tetelsor)

result = data_filtered$tetel_cim[sample(data_filtered$tetel_sorszam, 1)]

print(result)

par(mar = c(0,0,0,0))
plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
text(x = 0.5, y = 0.5, str_wrap(result, width = 40), 
     cex = 1.6, col = "black")

