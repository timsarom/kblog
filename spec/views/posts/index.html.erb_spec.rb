require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :description => "MyTextMyText",
        :thumbnail => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))
      ),
      Post.create!(
        :title => "Title",
        :description => "MyTextMyText",
        :thumbnail => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "h2", :title => "Title".to_s, :count => 2
  end
end
