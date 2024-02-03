require "test_helper"

class Admin::YakitorisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_yakitoris_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_yakitoris_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_yakitoris_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_yakitoris_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_yakitoris_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_yakitoris_update_url
    assert_response :success
  end
end
