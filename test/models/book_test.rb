require 'test_helper'

class BookTest < ActiveSupport::TestCase
   test "A book title should be present" do
		 book = Book.new
     assert_not book.save
   end
end
