import requests
response = requests.post('https://api.timesascent.com/v1/eTU/PostOnFacebook', headers={'Authorization': 'Token 77927b69bb144b065ca11bf2a9d452819cd852db'})
print(response.json())
