require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  it 'is a valid factory' do
    expect(user).to be_valid
  end

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:encrypted_password) }

  it { should validate_uniqueness_of(:email).case_insensitive }
end
