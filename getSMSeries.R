###########################################################
### Class to compile dfs associated with BLS SM data
### SM data is State and Area Employment, Hours and Earnings
### http://www.bls.gov/help/hlpforma.htm#SM
###########################################################

###########################################################
### Series IDs for SM are systematic
### Need to pull and compile coding structures to be able to
### assemble IDs.
### Series ID    SMU19197801523800001 
### Positions       Value           Field Name
### 1-2             SM              Prefix
### 3               U               Seasonal Adjustment Code 
### 4-5             19              State Code
### 6-10            19780           Area Code
### 11-18           15238000        SuperSector and Industry Code
### 19-20           01             	Data Type Code
###########################################################

library(XML)
library(RCurl)
stateCodesURL <- "http://download.bls.gov/pub/time.series/sm/sm.state"
areaCodesURL <- "http://download.bls.gov/pub/time.series/sm/sm.area"
ssCodesURL <- "http://download.bls.gov/pub/time.series/sm/sm.supersector"
iCodesURL <- "http://download.bls.gov/pub/time.series/sm/sm.industry"
dataTypeCodesURL <- "http://download.bls.gov/pub/time.series/sm/sm.data_type"
# TODO repeate statecodes for others

stateCodesDoc <- getURLContent(stateCodesURL)
stateCodesHTML <- htmlTreeParse(stateCodesDoc, useInternalNodes = TRUE)
stateCodesAtts <- xpathApply(stateCodesHTML, '', xmlToList) # TODO need to insert this xpath
stateCodesDF <- data.frame(name = sapply(stateCodesAtts, function(x) x$text),
                           url = sapply(stateCodesAtts, function(x) x$.attrs[[1]]),
                           stringsAsFactors = FALSE)

# library(RCurl)
# library(XML)
# doc <- getURL('http://www.r-bloggers.com')
# html <- htmlTreeParse(doc, useInternalNodes = TRUE)
# atts <- xpathApply(html, '//ul[@class="xoxo blogroll"]//a[@href]', xmlToList)
# df <- data.frame(name = sapply(atts, function(x) x$text),
#                  url = sapply(atts, function(x) x$.attrs[[1]]),
#                  stringsAsFactors = FALSE)
