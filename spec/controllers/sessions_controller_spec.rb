require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_attributes) { { name: 'user', password: 'secret' } }
  let(:invalid_attributes) { { name: 'use', password: 'secret' } }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "opens login page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  # context "with valid attributes" do
  #   describe "GET #create" do
  #     it "redirect after successful login" do
  #       user = User.create! valid_attributes
  #       post :create, params: {id: user.to_param}, session: valid_session
  #       expect(response).to redirect_to(posts_url)
  #     end
  #   end
  # end

  describe "GET #destroy" do
    it "redirect after logout" do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end
  end
end
