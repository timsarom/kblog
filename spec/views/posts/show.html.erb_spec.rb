require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "Title",
      :description => "MyText",
      :image => fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file', 'image.jpg'))
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
