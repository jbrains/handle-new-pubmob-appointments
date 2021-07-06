require 'sinatra'
require 'httparty'

require 'lib/flexbooker'

class HelloWorldApp < Sinatra::Base
    post '/echo' do
        mail = params
        puts mail.inspect
        booking_details = ExtractFlexbookerBookingDetails.parse(mail)
        if booking_details
            puts "Post a request to https://app.integrately.com/a/webhooks/92ced5fabafd4a30ab9729b6951d3fd2 with the parts #{booking_details.inspect}"
            HTTParty.post("https://app.integrately.com/a/webhooks/92ced5fabafd4a30ab9729b6951d3fd2", {body: {customer_email: booking_details.customer_email, customer_full_name: booking_details.customer_full_name}})
        else
            400
        end
    end
end
