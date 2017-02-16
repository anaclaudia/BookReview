require 'test_helper'

class BookreviewFlowTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
	
	test "Should get the index page" do
		get "/"
		assert_select "body div.container"
	end

	test "Should create a new book" do
		sign_in :bob
		get new_book_path
		post "/books", params: { book: { title: "A good book", description: "book", user_id: 2, category_id: 3 } }
		assert_response :redirect
		follow_redirect!
		assert_response :success
	end
end
