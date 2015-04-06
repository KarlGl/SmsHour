Sms your needy girlfriend every hour on the hour.

A node server that will randomly select a love message to send to any number via SMS broadcast.

to run:
```
npm install gulp -g
npm install
gulp server
nohup nodejs dist/app.js & 
````

now ajust settings  
setup your settings at this endpoint  
enabled # is it going to actually send? t for yes  
url # url to post sms to (smsbroadcast by default)  
to # number to send to  
from # number to appear to be from  
pass # sms broadcast password  
user # sms broadcast user  
```
curl -X POST -d 'enabled=t&user=foo' http://0.0.0.0:3000/settings
```

set messages to pick from (will clear existing)
```
curl -X POST -d '[]=my soul&[1]=You are my love' http://0.0.0.0:3000/messages
```

Now it will send sms every hour.
```
curl 0.0.0.0:3000 to get a csv of sent smss and times.
```

dist/app.js is the compiled main file

Use this as a frontend for it:
```
<html>
<body>
<button id="toggle-enabled" style="width: 80%; height: 80%;">
        Loading...
</button>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<script>
$(document).ready(function(){
        console.log("ready");
        var updateButton = function(body) {
                var isEnabled = JSON.parse(body).enabled === 't';
                $('#toggle-enabled').html(isEnabled ? 'Disable' : 'Enable')
                  .css('background-color', isEnabled ? 'red' : 'green')
                  .unbind()
                  .click(function() {
                        $.post('../sms_hour_backend/settings', {enabled: isEnabled ? 'f' : 't'}).success(updateButton);
                });     
        };
        $.post('../sms_hour_backend/settings').success(updateButton);
});
</script>
</body>
</html>
```
