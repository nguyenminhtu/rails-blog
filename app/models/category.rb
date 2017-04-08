class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, through: :post_categories

	validates :name, length: { in: 3..30 }, presence: true, uniqueness: { case_sensitive: false }

end