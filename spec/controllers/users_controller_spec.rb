require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "/sign_up" do
    it "sign up route loads successfully" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
end
