require "rails_helper"

RSpec.describe User, type: :model do
  describe "relationships" do
    it { should have_many(:parties) }
    it { should have_many(:user_parties) }
    it { should have_many(:parties).through(:user_parties)}
    it { should have_secure_password }
  end

  describe "validations" do
    it { should validate_uniqueness_of :email }
  end

  describe "class methods" do
    xit "" do

    end
  end
end
