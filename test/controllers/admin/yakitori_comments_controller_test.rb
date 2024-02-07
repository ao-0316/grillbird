require "test_helper"

class Admin::YakitoriCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_yakitori_comments_index_url
    assert_response :success
  end
end
