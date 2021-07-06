require 'sinatra'
require 'httparty'

require './lib/flexbooker'

class HelloWorldApp < Sinatra::Base
    post '/echo' do
        mail = params
        puts mail.inspect
        booking_details = ExtractFlexbookerBookingDetails.parse(mail)
        if booking_details
            puts "Post a request to https://app.integrately.com/a/webhooks/e80a5f7584924e4a99d05d0b31dfd632 with the parts #{booking_details.inspect}"
            HTTParty.post("https://app.integrately.com/a/webhooks/e80a5f7584924e4a99d05d0b31dfd632", {body: {customer_email: booking_details.customer_email, customer_full_name: booking_details.customer_full_name}})
            200
        else
            400
        end
    end
end
