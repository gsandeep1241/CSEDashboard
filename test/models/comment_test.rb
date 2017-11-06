require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @micropost = microposts(:orange)
    @user = users(:michael)
    # This code is not idiomatically correct.
    @comment = Comment.new(content: "Lorem ipsum Comment", user_id: @user.id, micropost_id: @micropost.id)
  end
  
  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "micropost id should be present" do
    @comment.micropost_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 300 characters" do
    @comment.content = "a" * 301
    assert_not @comment.valid?
  end
  
  test "order should be most recent first" do
    assert_equal comments(:two), Comment.first
  end

end
