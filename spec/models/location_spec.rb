require 'rails_helper'

RSpec.describe Location, type: :model do

  let(:location) { create(:location) }

  it 'has to be a valid factory' do
    expect(location).to be_valid
  end

  it { should respond_to(:address) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:description) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }

  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
