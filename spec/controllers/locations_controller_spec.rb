require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  let(:user) { create(:user)}
  let(:location) { create(:location, user_id: user.id) }

end
