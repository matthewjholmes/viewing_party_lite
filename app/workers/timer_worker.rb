require 'twilio-ruby'
class TimerWorker
  include Sidekiq::Worker

  # Sidekiq.configure_client do |config|
  #   config.redis = { db: 1 }
  # end
  #
  # Sidekiq.configure_server do |config|
  #   config.redis = { db: 1 }
  # end

  def perform(to_number, message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], (ENV['TWILIO_AUTH_TOKEN']))
    client.message.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to_number,
      body: message
    )
  end
end

# def send_message(to_number, body)
#   client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], (ENV['TWILIO_AUTH_TOKEN']))
#
#   client.messages.create(
#     from: ENV['TWILIO_PHONE_NUMBER'],
#     to: to_number,
#     body: body
#     )
# end
