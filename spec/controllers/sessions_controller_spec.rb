require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_attributes) { { name: 'user', password: 'secret' } }

  describe "GET #new" do
    it "opens login page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "redirect after successful login" do
      user = User.create! valid_attributes
      post :create, params: { name: user.name, password: 'secret'}
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "create action" do
    it "redirect if user count is zero" do
      post :create, params: { name: 'name', password: 'password' }
      expect(response).to redirect_to(new_user_path)
    end
  end

  describe "GET #create" do
    it "fail login and stay at login page" do
      user = User.create! valid_attributes
      post :create, params: { name: user.name, password: 'wrong' }
      expect(response).to redirect_to(login_url)
    end
  end

  describe "GET #destroy" do
    it "redirect after logout" do
      get :destroy
      expect(response).to have_http_status(:redirect)
    end
  end
end
