class TwilioService

  def self.send_message(to_number, body)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], (ENV['TWILIO_AUTH_TOKEN']))

    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to_number,
      body: body
      )
  end
  # def send_message
  #
  # account_sid = 'AC69eb62dbb6b7fe95eb7f99b80a9b2fc7'
  # auth_token = 'da35f2e44901293c1299d6602da4bd0b'
  # client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  # from = '+15079367010' # Your Twilio number
  # to = '+15105089642' # Your mobile phone number
  #
  #
  #   client.messages.create(
  #   from: from,
  #   to: to,
  #   body: "This is from Twilio"
  #   )
  # end
end
