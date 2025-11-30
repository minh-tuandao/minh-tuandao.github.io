install.packages("tuber")

library(tuber)
library(tidyverse)
library(lubridate)
library(stringi)
library(wordcloud)
library(gridExtra)
library(httr)

## Be sure to get the correct credentials
## Create a project for web application
## https://console.developers.google.com
## 1. Enable APIs and services
## 2. Choose YouTube Data API v3

# = Autentication = #
# 
# 
yt_oauth("YourClientID","YourClientSecret", token = "")

yt_shutdown2025 = yt_search(term = "shutdown")

# = Download and prepare data = #
mostpop = list_videos()

mostpop_us = list_videos(video_category_id = "25",   region_code = "US", max_results = 10)


# Find the channel ID in the source page
# Alternatively, from get_video_details
# = Channel stats = #

nbcnews_stat = get_channel_stats("UCeY0bbntWzzVIaj2z3QigXg")
nbcnews_detail = get_video_details(video_id = "to0YqKKRIWY")





