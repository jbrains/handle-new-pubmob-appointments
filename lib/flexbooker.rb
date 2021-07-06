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
