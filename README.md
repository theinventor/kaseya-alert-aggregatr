## Kaseya Alert Aggregatr ##

If you run kaseya, you know their "agent offline" and "agent online" alerts are impossible to make truly useful.

You either get an email every few minutes saying some random machine went down, or you turn it off - and then you can't get the email saying "10 machines just went offline in group".

This is the answer.

Put this on heroku, setup a sendgrid inbound parse.

Go to your exchange server and intercept/redirect any message saying "machines offline"/etc to the sendgrid parse.

Now it will batch up for you and email/page you when it really matters.


### Instructions ###

1. Fork this repo, get a heroku account - and then #heroku create
2. Add the redis-cloud free redis addon
3. Add the free sendgrid addon
4. #heroku addons:open sendgrid 
5. In sendgrid, configure inbound email parse - use https://YOUR_HEROKU_APP.herokuapp.com/receive_email as the URL to send the mail to
6. Setup a "contact" in your exchange server to send to whatever@alerts.yourdomain.com - make alerts.yourdomain.com the sendgrid parse domain
6. Go to your exchange server and setup a rule so if the body or subject contains "have not checked in since" or "has not checked in since" - redirect the message to this new contact (it will get sent to this new app)
7. #heroku run rake db:migrate
8. #heroku run console; User.create email: "youremail", password: "yourpass", password_confirmation: "yourpass" - now this user can login to the web interface
9. Go to settings, create/edit the settings, make sure the alert/pager has an email - you can leave the patterns blank. Make sure the number of machines to trigger has a "number" in it - like 5.
10. Done!


