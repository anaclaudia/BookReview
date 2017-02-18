require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	test "Category name should not be blank" do
		category = Category.new(name: " ")
    assert_not category.valid?
   end
end
