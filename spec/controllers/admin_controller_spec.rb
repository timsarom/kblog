require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #index" do
    it "returns admin index page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
