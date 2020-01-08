require 'test_helper'

class CommentPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get comment_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get comment_posts_create_url
    assert_response :success
  end

  test "should get update" do
    get comment_posts_update_url
    assert_response :success
  end

end
