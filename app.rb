require 'sinatra'

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

class ExtractFlexbookerBookingDetails
    def initialize(mail_body_plain)
        @mail_body_plain = mail_body_plain
    end

    def self.parse(mail)
        return nil if mail["body-plain"].nil?
        return self.new(mail["body-plain"])
    end

    def customer_email
        "me@jbrains.ca"
    end

    def customer_full_name
        "J. B. Rainsberger"
    end
end
