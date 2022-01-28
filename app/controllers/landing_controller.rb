class LandingController < ApplicationController
  def index
    @users = User.all
    require "pry"; binding.pry
    
    TwilioService.send_message('+15105089642', 'Hardcoded message in LandingController on ViewingPartyLite')
  end
end
