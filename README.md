I receive emails from Flexbooker, then parse them in order to run a Zapier task that adds events to my calendar and notifies me that a session is booked.

To connect this app to the outside world:

- I created a rule in Mailgun to forward income emails to this app.
- I created a Zapier task to respond to the "Destination Endpoint" webhook.

This app there is a big function from Email to HTTP Request.
