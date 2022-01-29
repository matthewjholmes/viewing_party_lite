require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  # def voice
  #   response = Twilio::TwiML::Response.new do |r|
  #     r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
  #        r.Play 'http://linode.rabasa.com/cantina.mp3'
  #   end
  #
  #   render_twiml response
  # end

  def notify

    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
  end
end
