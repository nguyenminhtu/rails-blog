class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	before_save { self.email = email.downcase }

	REGEX_FORMAT_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,5}\z/i

	validates :username, length: { in: 4..30 }, presence: true, uniqueness: { case_sensitive: false }
	validates :email, length: { in: 12..80 }, presence: true, uniqueness: { case_sensitive: false }, 
				format: { with: REGEX_FORMAT_EMAIL }

	has_secure_password

end