require 'test_helper'

class BookTest < ActiveSupport::TestCase

	def setup
		@user = User.new(email: "test@test.com")
	end

	test "A book title should be present" do
		 book = Book.new
     assert_not book.save
   end
	
	test "A book should belongs to a user" do
		book = @user.books.build
		assert_not book.save
	end

end
