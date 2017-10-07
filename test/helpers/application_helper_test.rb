require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "CSE_Dashboard"
    assert_equal full_title("Help"), "Help | CSE_Dashboard"
  end
end