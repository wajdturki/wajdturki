#curl -X 'GET' \  'https://u50g7n0cbj.execute-api.us-east-1.amazonaws.com/v2/cities?limit=100&page=1&offset=0&sort=asc&country_id=SA&order_by=city' \  -H 'accept: application/json'
  
  #https://u50g7n0cbj.execute-api.us-east-1.amazonaws.com/v2/cities?limit=100&page=1&offset=0&sort=asc&country_id=SA&order_by=city

import pandas as pd
import numpy as np
import requests


  PATH_API = ' https://u50g7n0cbj.execute-api.us-east-1.amazonaws.com/v2/cities?limit=100&page=1&offset=0&sort=asc&country_id=SA&order_by=city'
  q = requests.get(PATH_API)
  d = q.json()
  d.keys()
  d["Meta"]
  d["Results"]
  df=Pd.DataFrame(data["Results"])
  df.shape  # To show How many rows and columns are in the data
  
  # Q 1 - 
  # Cities : 2
  # Dahran , N/A
  
  # Q 2 -
 # Number Of Rows : 1
 # Number Of columns : 9


  
  
  
  
  #-----------------------------
  
 
{
  "meta": {
    "name": "openaq-api",
    "license": "CC BY 4.0d",
    "website": "https://u50g7n0cbj.execute-api.us-east-1.amazonaws.com/",
    "page": 1,
    "limit": 100,
    "found": 2
  },
  "results": [
    {
      "country": "SA",
      "city": "Dharan",
      "count": 24,
      "locations": 1,
      "firstUpdated": "2019-07-15T19:00:00+00:00",
      "lastUpdated": "2019-07-16T18:00:00+00:00",
      "parameters": [
        "pm25"
      ]
    },
    {
      "country": "SA",
      "city": "N/A",
      "count": 3822233,
      "locations": 2,
      "firstUpdated": "2019-10-28T18:00:00+00:00",
      "lastUpdated": "2021-01-20T18:00:00+00:00",
      "parameters": [
        "pm25"
      ]
    }
  ]
}


