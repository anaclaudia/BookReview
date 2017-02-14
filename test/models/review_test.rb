require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
	
	def setup
		user = User.new(email: "test@test.com")
		book = user.books.build(title: "The best Book ever!", description: "Best Everrrr!", category_id: 2)
		@full_review = book.reviews.build(rating: "5", comment: "Awesome book", user_id: user.id)
		@review = Review.new
	end

	test "Rating should not be blank" do
     assert_not @review.rating?
   end

	test "Comment should not be blank" do
		assert_not @review.comment?
	end

	test "A review should belong to a user" do
		assert_not @review.user_id?
	end

	test "A review should belong to a book" do
		assert_not @review.book_id?
	end

	test "A review should be valid" do
		assert_not @full_review.valid?
	end
end
