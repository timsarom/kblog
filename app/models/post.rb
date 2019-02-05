class Post < ApplicationRecord
	attr_accessor :delete_thumbnail
	after_save :purge_thumbnail, if: :delete_thumbnail
	has_many :comments, dependent: :destroy
	has_one_attached :thumbnail
	has_many_attached :images
	validates :title, :description, presence: true
	validates :title, length: { minimum: 5 }
	validates :description, length: { minimum: 10 }
	validate :image_exists

  private

  def image_exists
    errors.add(:base, 'Please upload your image.') unless thumbnail.attached?
  end

  def purge_thumbnail
  	thumbnail.purge_later
  end

end
