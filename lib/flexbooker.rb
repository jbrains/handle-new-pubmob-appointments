EvolutionaryDesignWithTestsBooking = Struct.new(:customer_email, :customer_full_name) do
  def self.parse_flexbooker_email_body_plain(email_body_plain)
    lines = email_body_plain.split("\r\n")

    customer_email_lines = lines.map { | line | /Customer Email\: (.+)/.match(line) || [] }.map { | match_data | match_data[1] }.reject { | result | result.nil? }
    customer_full_name_lines = lines.map { | line | /Customer Name\: (.+)/.match(line) || [] }.map { | match_data | match_data[1] }.reject { | result | result.nil? }

    if customer_email_lines.size < 1 || customer_full_name_lines.size < 1
      nil
    else
      EvolutionaryDesignWithTestsBooking.new(customer_email_lines.first, customer_full_name_lines.first)
    end
  end
end

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
