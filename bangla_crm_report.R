#Bangladesh report from crm to google sheet
library(tidyverse)
library(googledrive)
library(googlesheets4)
library(RMySQL)
library(plyr)

drive_auth(cache  = ".secretsap",email = "ap.kheloyaar@gmail.com")
gs4_auth(token = drive_token())


#banglades crm database credentials
bang.server = "localhost"
bang.username = "u429143136_bangladesh"
bang.database = "u429143136_bangladesh"
bang.password = "@qqCTP3z9mP"
bang.host     = "srv1655.hstgr.io"

while (T) {
  
assign('con',value =dbConnect(MySQL(),user=bang.username,password=bang.password,dbname=bang.database,host="srv1655.hstgr.io",port=3306),envir = .GlobalEnv )
q <- dbReadTable(con,'call_status_clients')
dbDisconnect(con)

q<-q[q$Call_Date>=Sys.Date()-7,]
q$Call_Date<-ymd(q$Call_Date)
range_write("1MOAu_7phLqv_m6YiDmU_tzB3ocApGM-FOa446C6aDpI",data = q,sheet = 'data',col_names = T,reformat = T )
cat('data is uploaded in the sheet \n')
Sys.sleep(30*60)

}
