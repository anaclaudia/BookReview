class Book < ApplicationRecord
	validates :title, :author_id, presence: true
end
