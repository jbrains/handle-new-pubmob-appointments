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

