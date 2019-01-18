class User < ApplicationRecord
  after_destroy :ensure_admin_remains
  has_secure_password
  validates :name, uniqueness: true
  validates :name, :password, presence: true

  class Error < StandardError
  end

  private

  def ensure_admin_remains
  	if User.count.zero?
  		raise Error.new "Can't delete last user!"
  	end
  end
end
