class Book < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :title, :user_id, presence: true
end
