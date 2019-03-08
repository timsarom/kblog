class AddScoresToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :meat_taste, :integer
  	add_column :posts, :variety_of_salads, :integer
  	add_column :posts, :spiciness, :integer
  	add_column :posts, :satiety, :integer
  	add_column :posts, :cleanliness, :integer
  	add_column :posts, :service, :integer
  end
end
