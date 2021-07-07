require 'sinatra'
require 'httparty'

require './lib/flexbooker'

BookingDetailsDestinationEndpointUrl = ENV["DESTINATION_ENDPOINT_URL"]

class HandleNewEvolutionaryDesignWithoutTestsBookingApp < Sinatra::Base
    post '/echo' do
        return [500, {}, ["I can't find the booking details destination endpoint URL."]] unless BookingDetailsDestinationEndpointUrl

        mail = params
        puts mail.inspect
        booking_details = ExtractFlexbookerBookingDetails.parse(mail).parse()
        if booking_details
            puts "Received a booking email with the parts #{booking_details.inspect}"
            # REFACTOR Extract to an environment variable
            HTTParty.post(BookingDetailsDestinationEndpointUrl, {body: {customer_email: booking_details.customer_email, customer_full_name: booking_details.customer_full_name}})
            200
        else
            [400, {}, ["This doesn't look like a Flexbooker email.", mail.inspect]]
        end
    end
end
