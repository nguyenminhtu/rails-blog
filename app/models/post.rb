class Post < ActiveRecord::Base
	belongs_to :user
	has_many :post_categories
	has_many :categories, through: :post_categories

	validates :title, length: { in: 4..100 }, presence: true, uniqueness: { case_sensitive: false }
	validates :description, minimum: 50, presence: true
	#validates :user_id, presence: true

end