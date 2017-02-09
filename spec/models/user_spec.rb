require 'rails_helper'

describe User do

  describe "validations" do
    it "is valid with an email and password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end
