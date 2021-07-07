require 'lib/flexbooker.rb'

# BEGIN Production code

# END Production code

describe "Reminding myself how to match Regexp" do
  describe "capturing a match group" do
    example "it matches" do
      match = /Customer Email\: (.+)/.match("Customer Email: matching@email.com")
      expect(match[1]).to eq("matching@email.com")
    end

    example "it matches in the middle of a multiline string" do
      match = /Customer Email\: (.+)/.match("::line 1::\r\n::line 2::\r\nCustomer Email: matching@email.com\r\n::line 4::\r\n::line 5::\r\n")
      # Sadly, it matches the \r at the "end" of the line
      expect(match[1]).to eq("matching@email.com\r")
    end
  end
end
describe "Parsing the Flexbooker booking notification email body" do
    example "a realistic example from a real booking email" do
        realistic_email_body_plain = "Employee: J. B. Rainsberger\r\n\r\nAppointment Type: Evolutionary Design Without Tests\r\n\r\nAppointment Time: Friday, July 2, 2021 4:30 PM Belarus Standard Time\r\n\r\nCustomer Name: Marat Chukmarov\r\n\r\nCustomer Phone #:\r\n\r\nCustomer Email: ttx013@gmail.com\r\n\r\nNotes:\r\n\r\nGitHub user name: mikementor\r\n\r\nPrice:\r\n\r\n\r\n\r\nYour booking at PubMob is confirmed!\r\n\r\n\r\nMarat, your booking is confirmed at PubMob\r\n\r\n*7/2/2021 at 4:30 PM*\r\n\r\n\r\nType of Appointment\r\n*Evolutionary Design Without Tests*\r\n\r\nAppointment With\r\n*J. B. Rainsberger*\r\n\r\nLink: https://zoom.us/j/94634560966\r\n\r\nNew York, US: +1 6465588656 Washington DC, US: +1 3017158592 Chicago, US:\r\n+1 3126266799 San Jose, US: +1 6699009128 Tacoma, US: +1 2532158782\r\nHouston, US: +1 3462487799\r\n\r\nPayment\r\n*Your credit card has been charged $95.00 for this appointment.*\r\n\r\nHow do I change my booking?\r\n*If you need to make a change to this booking, then please **click here\r\n<http://email.notifications.flexbooker.com/c/eJxdjktuwzAQQ09j72TMjGRZWmiRJs0JeoHRr1EbW4GtoO3tq24LckE8EASjSwSY7FgcASEsQGBAS5y6rtaczhf9urxopLMdFGy1lVwCt1K3Y8r39O1r_Uz7FOo63lzK2bAPUi2MhAGkAYhgQrRJ6RjMeHe31h7HIE8DXbv530ZHXyW-p9bD4-nX6gX-NeU1xdLeem0b5AXBKDZ5FpKDEipLFBaJxRxTnjsHY2Hc3Zr64w-_c-lfA4_rjwjPo9VVRG7sDIK0WlrBOLNQaLywLElI4kyoAfRCv4BvVB8>*\r\n*.*\r\n\r\n\r\n\r\n*Copyright © 2015 FlexBooker LLC, All rights reserved.*\r\n*You are receiving this email because you made an appointment at PubMob and\r\nchose to receive these transaction notifications.*\r\nFlexBooker LLC · 225 W 1st Ave. · Columbus, OH 43201 · USA\r\n\r\nDon't want to receive emails from us any more? Click here.\r\n<http://email.notifications.flexbooker.com/u/eJwNzEsOwiAQANDTyI5mZmiBWbCov3sMFCJqJamY6O1t3v4tIRNgZlUDASE4IPBgDQ67K_v5dLYXd7RIJz6M8Gq9lpqk1_Z6D-WZv7G1R96G1FZ1CxKnJBQnFsulELOd2Kdx9It3xTtUW1jz3tzjJnUPkqgeDjSr9afT593bqhfpEjyCYWtYC06iR_RRsxjShqQQWgDr6A9VSDTx>\r\n"
        booking = EvolutionaryDesignWithTestsBooking.parse_flexbooker_email_body_plain(realistic_email_body_plain)

        expect(booking.customer_email).to eq("ttx013@gmail.com")
        expect(booking.customer_full_name).to eq("Marat Chukmarov")
    end
end
