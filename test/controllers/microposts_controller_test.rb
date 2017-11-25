require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end
  
  test "should create when logged in" do
    log_in_as(users(:michael))
    assert_changes 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum" } }
    end
  end
  
  test "should show micropost" do
    log_in_as(users(:michael))
    get micropost_path(@micropost)
    assert_response :success
  end
  
  test "should create anonymous post" do
    log_in_as(users(:michael))
    assert_changes 'Micropost.count' do
      post microposts_path, params: { micropost: { content: "Lorem ipsum", anony:true } }
    end
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Micropost.count' do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end
  
  test "admin should be able to update micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:orange)
    assert_no_difference 'Micropost.count' do
      patch micropost_path(micropost), params: { micropost: { resolved: true } }
    end
  end

end