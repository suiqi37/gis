WC <- st_read(here::here("data","World_Countries_(Generalized).geojson"))
GGID <- read.csv(here::here("data","CSV HDR21-22_Composite_indices_complete_time_series.csv"), 
                 header = TRUE, sep = ",",  
                 encoding = "latin1")
WC%>%
  merge(.,
      GGID, 
      by.x="COUNTRY", 
      by.y="country",
      no.dups = TRUE)
WC2 <- WC %>%
  left_join(., 
         GGID,
          by = c("COUNTRY" = "country"))%>%
  mutate(difference= (gii_2010 -
                      gii_2019))