class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_one_attached :image
	validates :title, :description, presence: true
	validate :image_exists

    private

    def image_exists
      errors.add(:base, 'Please upload your image.') unless image.attached?
    end
end
