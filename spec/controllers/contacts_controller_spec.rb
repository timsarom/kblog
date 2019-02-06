require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:valid_attributes) { { content: 'text text text' } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns contact index page" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns new contact page" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns edit contact page" do
      contact = Contact.create! valid_attributes
      get :edit, params: {id: contact.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Contact" do
      expect {
        post :create, params: {contact: valid_attributes}, session: valid_session
      }.to change(Contact, :count).by(1)
    end

    it "redirects to contacts index" do
        post :create, params: {contact: valid_attributes}, session: valid_session
        expect(response).to redirect_to(contacts_url)
    end
  end

  describe "PUT #update" do
      let(:new_attributes) { { content: 'bla bla bla' } }

      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        put :update, params: {id: contact.to_param, contact: new_attributes}, session: valid_session
        expect(response).to be_redirect
      end

      it "redirects to the contacts" do
        contact = Contact.create! valid_attributes
        put :update, params: {id: contact.to_param, contact: valid_attributes}, session: valid_session
        expect(response).to redirect_to(contacts_url)
      end
  end
end
