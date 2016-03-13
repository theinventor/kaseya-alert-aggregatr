## Kaseya Alert Aggregatr ##

If you run kaseya, you know their "agent offline" and "agent online" alerts are impossible to make truly useful.

You either get an email every few minutes saying some random machine went down, or you turn it off - and then you can't get the email saying "10 machines just went offline in group".

This is the answer.

Put this on heroku, setup a sendgrid inbound parse.

Go to your exchange server and intercept/redirect any message saying "machines offline"/etc to the sendgrid parse.

Now it will batch up for you and email/page you when it really matters.
