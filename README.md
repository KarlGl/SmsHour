Sms your clingy girlfriend every hour on the hour.
Will randomly select a love message to send

to run:
npm install
gulp server

Now it will send sms every hour.
curl 0.0.0.0:3000 to get a csv of smss.

dist/app.js is the compiled main file

# set messages
# (will clear existing)
curl -X POST -d '[]=my soul&[1]=You are my love' http://0.0.0.0:3000/messages

# enable / disable
# settup your settings at this endpoint
enabled # is it going to actually send? t for yes
url # url to post sms to (smsbroadcast by default)
to # number to send to
from # number to appear to be from
pass # sms broadcast password
user # sms broadcast user
curl -X POST -d 'enabled=t&user=foo' http://0.0.0.0:3000/settings
