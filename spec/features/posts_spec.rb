require 'rails_helper'

RSpec.feature "Posts", type: :feature do
	let(:valid_attributes) {{title: 'postt', description: 'text text text', thumbnail: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg')), images: [fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))] }}
	let(:user_attr) {{ name: 'user', password: 'secret'}}

	describe "delete attachment" do
		it "deletes post thumbnail" do
			post = Post.create! valid_attributes
  		user = User.create! user_attr

  		visit login_path
  		fill_in 'Name:', with: 'user'
  		fill_in 'Password', with: 'secret'
  		click_button 'Login'
  		visit post_path(post)

  		click_link "Edit"
  		check "Delete thumbnail"
  		click_button "Update Post"

  		visit posts_path
  		page.has_no_selector?('.thumbnail')
  	end

  	it "deletes post image" do
  		post = Post.create! valid_attributes
  		user = User.create! user_attr

  		visit login_path
  		fill_in 'Name:', with: 'user'
  		fill_in 'Password', with: 'secret'
  		click_button 'Login'
  		visit post_path(post)

  		within(".image_grid") do
  			click_link "Delete"
  		end
  		page.has_no_selector?('.thumbnail')
  	end
  end
end