module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def build_attributes(*args)
    FactoryGirl.build(*args).attributes.delete_if do |k, v|
      ["id", "created_at", "updated_at"].member?(k)
    end
  end
end
