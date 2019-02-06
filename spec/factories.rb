FactoryBot.define do
  factory :contact do
    
  end
  factory :about do
    content { "MyText" }
  end
	factory :comment do
		name  { "User" }
		text  { "bla bla bla bla" }
		post_id { "1"}
		post
	end

	factory :post do
		id { "1" }
		title { "title" }
		description { "text text text" }
		thumbnail { File.new("#{Rails.root}/spec/fixtures/file/image.jpg") }
	end
end