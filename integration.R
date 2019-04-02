library(dplyr)
library(data.table)
library(countrycode)

World_bank_data = fread("D:/Columbia/Spring 2019/Data Science and Public Policy/Data Assignment 3/second.csv")
World_bank_data_extra = fread("D:/Columbia/Spring 2019/Data Science and Public Policy/Data Assignment 3/extra.csv")


data = fread("D:/Columbia/Spring 2019/Data Science and Public Policy/Data Assignment 3/data.csv")

wide_data_extra = spread(World_bank_data_extra,Series,Value)
wide_data_extra <- wide_data_extra %>%
  mutate(Country = countrycode(Country, 'country.name', 'iso3c'))
names(wide_data_extra)

wide_data = spread(World_bank_data,Series,Value)
wide_data <- wide_data %>%
  mutate(Country = countrycode(Country, 'country.name', 'iso3c'))


names(wide_data) =  c("Country","Date", "Access_ELEC", "NatInc2010" , "NatIncCurr", "CODam", "Res_Depl", "For_Depl", "emission", "Agriland", "nuclear", 
                      "Electric_con", "Industry", "EnerInvestment", "Labor_force", "Manufacturing", "Technical")
names(wide_data_extra) =  c("Country","Date", "PPP", "incomepercapita" , "ATM")
names(spread(World_bank_data,Series,Value))
names(data)
names(wide_data)
total <- merge(data,wide_data,by=c("Country","Date"))
total <- merge(total,wide_data_extra,by=c("Country","Date"))

write.csv(total,"D:/Columbia/Spring 2019/Data Science and Public Policy/Data Assignment 3/total.csv")


