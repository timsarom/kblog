class ContactsController < ApplicationController
  before_action :find_contact, only: [:update, :edit]
  before_action :authorize, only: [:edit, :update, :new, :create]

  def index
    @contacts = Contact.all
  end

  def edit
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to contacts_path
  end

  def update
    @contact.update(contact_params)
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:content)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end
end
