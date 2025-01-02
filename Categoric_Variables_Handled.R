library(data.table)
library(tidyverse)
library(magrittr)
library(plotly)
library(ggplot2)

library(broom) # for tidy statistical summaries
library(caret) # for regression performance measures
library(psych) # for pairwise comparisons
library(GGally) # for pairwise comparisons
library(lindia) # for qqplots
library(car)
odata <- fread("http://raw.githubusercontent.com/elifsakcay/ad48g-proje/refs/heads/main/ObesityDataSet_raw_and_data_sinthetic%5B1%5D.csv")
odata_factor_floored <- copy(odata)

knifefunc <- function(the_list){
  the_name <- names(the_list)
  the_unique_quantile <- the_list %>% unlist %>% quantile %>% unique
  the_list %>% unlist %>% as.numeric %>% cut( breaks = the_unique_quantile  , labels = c(1:(length(the_unique_quantile)-1)), include.lowest = T)        
}
odata_normalized <- odata %>% mutate_at(vars(FAF, FCVC, NCP, CH2O, TUE), BBmisc::normalize) #hocaya sor? FAF continuous
odata_normalized <- odata %>% mutate_at(vars(FAF, FCVC, NCP, CH2O, TUE), knifefunc)

odata_factor_floored %<>% mutate_at(vars(FAF, FCVC, NCP, CH2O, TUE), function(x) x - x %% 1)

odata_factor_floored %<>% mutate_at(vars(FAF, FCVC, NCP, CH2O, TUE,SMOKE , CAEC, CALC ,SCC ,family_history_with_overweight , MTRANS , FAVC , Gender), as.factor)

colname_vector <- c("FAF", "FCVC", "NCP", "CH2O", "TUE")
midata <- cbind(odata ,  odata_factor_floored %>% select(all_of(colname_vector)) , odata_normalized %>% select(all_of(colname_vector)) )
colnames(midata)[(length(odata)+1):length(midata)] <- c(sprintf("%s_floored" , colname_vector) , sprintf("%s_normalized" , colname_vector))
midata %<>% mutate_at( vars(SMOKE , CAEC, CALC ,SCC ,family_history_with_overweight , MTRANS , FAVC , Gender), as.factor)
midata %>% str