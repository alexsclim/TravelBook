require 'rails_helper'

RSpec.describe Trip, type: :model do

  let(:trip) { create(:trip) }

  it 'has to be a valid factory' do
    expect(trip).to be_valid
  end

  it { should respond_to(:title) }
  it { should respond_to(:summary) }
  it { should respond_to(:user_id) }

  it { should validate_presence_of(:title) }
end
