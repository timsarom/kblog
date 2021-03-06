require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { name: 'Name', password: 'secret' } }
  let(:valid_attributes2) { { name: 'User', password: 'secret' } }

  let(:invalid_attributes) { { name: '', password: '' } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { { user_id: 1 } }
  let(:invalid_session) { { user_id: 55} }

    describe "GET #index" do
      context "with valid session" do
        it "gets users index page" do
          user = User.create! valid_attributes
          get :index, params: {id: user.to_param}, session: valid_session
          expect(response).to be_successful
        end
      end

      context "with invalid session" do
        it "gets users index page" do
          user = User.create! valid_attributes
          get :index, params: {id: user.to_param}, session: invalid_session
          expect(response).to redirect_to(login_url)
        end
      end
    end

    describe "GET #show" do
      it "opens user show page" do
        user = User.create! valid_attributes
        get :show, params: {id: user.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

  describe "GET #new" do
    it "opens new user page" do
      user = User.create! valid_attributes
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "opens edit user page" do
      user = User.create! valid_attributes
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "redirects to users path" do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do
      it "does not create user" do
        expect {
        post :create, params: {user: invalid_attributes}, session: valid_session
      }.to change(User, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: 'userr', password: 'secret', password_confirmation: 'secret' } }
      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

    context "with invalid params" do
      it "does not update user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    context "with 2 users created" do
      it "destroys the requested user" do
        user = User.create! valid_attributes
        user2 = User.create! valid_attributes2
        expect {
          delete :destroy, params: {id: user.to_param}, session: valid_session
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        user2 = User.create! valid_attributes2
        delete :destroy, params: {id: user.to_param}, session: valid_session
        expect(response).to redirect_to(users_url)
      end
    end

    context "with one user created" do
      it "does not destroy last user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, params: {id: user.to_param}, session: valid_session
        }.to change(User, :count).by(0)
      end
    end
  end

end
