require 'rails_helper'

RSpec.feature "Comments", type: :feature do

	let(:valid_attributes) {{title: 'postt', description: 'text text text', thumbnail: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))}}
	let(:user_attr) {{ name: 'user', password: 'secret'}}

  describe "create action" do
  	context "with valid attributes" do
	  	it "creating new comment" do
	  		post = Post.create! valid_attributes
	  		visit post_path(post)

	  		fill_in 'Name', with: "Name"
	  		fill_in 'Text', with: "komentars"
	  		click_button 'Create Comment'
	  		expect(page).to have_content('1 Comment')
	  	end
  	end

  	context "with invalid attributes" do
	  	it "creating new comment" do
	  		post = Post.create! valid_attributes
	  		visit post_path(post)

	  		fill_in 'Name', with: "N"
	  		fill_in 'Text', with: "kom"
	  		click_button 'Create Comment'
	  		expect(page).to have_content('0 Comments')
	  	end
  	end
  end

  describe "destroy action" do
  	it "deleting comment" do
  		post = Post.create! valid_attributes
  		user = User.create! user_attr
  		
  		visit login_path
  		fill_in 'Name:', with: 'user'
  		fill_in 'Password', with: 'secret'
  		click_button 'Login'
  		visit post_path(post)

  		fill_in 'Name', with: "Name"
  		fill_in 'Text', with: "komentars"
  		click_button 'Create Comment'
  		click_button 'Delete'
  		expect(page).to have_content('0 Comments')
	  end
	end
end
