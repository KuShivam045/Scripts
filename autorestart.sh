#!/bin/bash

## PM2 restart 
pm2 restart all


## Restart Gunicorn
sudo systemctl restart gunicorn
