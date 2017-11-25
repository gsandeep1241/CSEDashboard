require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @comment = comments(:one)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post comments_path, params: { comment: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end
  
  test "should create comment" do
    log_in_as(users(:michael))
    assert_changes 'Comment.count' do
      post comments_path, params: { comment: { content: "Lorem ipsum",  micropost_id: microposts(:orange).id } }
    end
  end
  
  test "should not create comment when too small" do
    log_in_as(users(:michael))
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "",  micropost_id: microposts(:orange).id } }
    end
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for correct comment" do
    log_in_as(users(:michael))
    comment = comments(:one)
    assert_changes 'Comment.count' do
      delete comment_path(comment)
    end
    assert_redirected_to root_url
  end
  
end
