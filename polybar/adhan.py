import json
import time
import requests
import urllib.request
import datetime

epochtime = round(time.time())
url ='https://www.moskee-elfath.nl/wp-content/themes/x-child/framework/views/global/extract_times.php?Limit=7&SetTime=' + str(epochtime)
page = urllib.request.urlopen(url)
s = page.read() 
dates = json.loads(s)

closesTime = {}
for date in dates:
    salatTime = int(date['SalatTime'])
    name = date['SalatName']
    t = time.localtime(int(date['SalatTime']))

    #Calculate the date difference between now and all the Adhans
    dateNow = datetime.datetime.now()
    dateAdhan = datetime.datetime(*t[:6])
    dateDiff = dateAdhan - dateNow

    closesTime.update({name : dateDiff.total_seconds()})

salaatCloses = min(closesTime, key=closesTime.get)
salaatClosesTime = datetime.timedelta(seconds=closesTime[salaatCloses])
avgString = str(salaatClosesTime).split(",")[0]
avgString = avgString.split(".")[0]
print('', salaatCloses, avgString)
