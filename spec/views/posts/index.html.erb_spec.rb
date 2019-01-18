require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "Title",
        :description => "MyText",
        :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))
      ),
      Post.create!(
        :title => "Title",
        :description => "MyText",
        :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))
      )
    ])
  end
end
