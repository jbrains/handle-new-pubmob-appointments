# CONTRACT The customer email must be a valid email, otherwise editing
# the Integrately integration task fails.
class ExtractFlexbookerBookingDetails
    def initialize(mail_body_plain)
        @mail_body_plain = mail_body_plain
    end

    def self.parse(mail)
        return nil if mail["body-plain"].nil?
        return self.new(mail["body-plain"])
    end

    def customer_email
        # CONTRACT Even for testing, this needs to be a valid email address.
        "me+check.integrately@jbrains.ca"
    end

    def customer_full_name
        "::customer full name::"
    end
end
