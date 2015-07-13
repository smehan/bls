library(devtools)
install_github("mikeasilva/blsAPI")
library(rjson)
library(blsAPI)


# example of multiple series v2 API
BLS_API_TOKEN <- Sys.getenv("BLSAPI")
payload <- list('seriesid'=c('LAUCN040010000000005','LAUCN040010000000006'),
                'startyear'='2010',
                'endyear'='2012',
                'catalog'='true',
                'calculations'='true',
                'annualaverage'='true',
                'registrationKey'= BLS_API_TOKEN)
response <- blsAPI(payload)
json <- fromJSON(response)

tmp <- json[['Results']]
tmp <- tmp[['LAUCN040010000000005']]
names(json)
tmp <- json[['Results']]
names(tmp)
series1 <- tmp[['series']]
serier2 <- series1[[2]]
series1 <- series1[[1]]
