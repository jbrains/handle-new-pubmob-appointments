require 'sinatra'
require 'lib/flexbooker'

class HelloWorldApp < Sinatra::Base
    post '/echo' do
        mail = params
        puts mail.inspect
        booking_details = ExtractFlexbookerBookingDetails.parse(mail)
        if booking_details
            puts "Post a request to https://app.integrately.com/a/webhooks/92ced5fabafd4a30ab9729b6951d3fd2 with the parts #{booking_details.inspect}"

        else
            400
        end
    end
end
