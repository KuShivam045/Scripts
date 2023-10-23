#!/bin/bash

#to stop running build
pm2 stop 2

# Now renaming the build from build to build(dd-mm-yy)
mv /home/ubuntu/TANext/build /home/ubuntu/TANext/build15-08-23\(2\)

#Renaming new build from build2 to build
mv /home/ubuntu/TANext/build2 /home/ubuntu/TANext/build

# Now restart pm2
pm2 restart 2

echo "build updated successfully"
