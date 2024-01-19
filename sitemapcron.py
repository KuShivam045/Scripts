import requests
response = requests.post('https://api.timesascent.com/v1/SitemapCron', headers={'Authorization': 'Token 4b065ca11bf2a9d452819cd852db'})
print(response.json())



