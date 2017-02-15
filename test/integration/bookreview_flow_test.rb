require 'test_helper'

class BookreviewFlowTest < ActionDispatch::IntegrationTest
	
	test "Hit de index page" do
		get "/"
		assert_select "body div.container"
	end
end
