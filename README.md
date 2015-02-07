npm install
gulp server

Now it will send sms every hour.
curl 0.0.0.0:3000 to get a csv of smss.

dist/app.js is the compiled main file

# set messages
curl -X POST -d '[]=my soul&[1]=You are my love' http://0.0.0.0:3000/messages
# enable / disable
curl -X POST -d 'enabled=t' http://0.0.0.0:3000/settings
