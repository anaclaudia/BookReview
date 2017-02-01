class Book < ApplicationRecord
	belongs_to :user
	validates :title, :author_id, presence: true
end
