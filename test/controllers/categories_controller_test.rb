require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get categories_new_url
    assert_response :success
  end

  test "should get create" do
    get categories_create_url, params: {name: "test"}
    assert_response :redirect
  end

  test "should get edit" do
    get categories_edit_url, params: { id: 1 }
    assert_response :redirect
  end

  test "should get update" do
    get categories_update_url, params: { id: 1 }
    assert_response :redirect
  end

  test "should get destroy" do
    get categories_destroy_url, params: { id: 1 }
    assert_response :redirect
  end

end
