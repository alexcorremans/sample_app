require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @activated = users(:archer)
    @not_activated = users(:not_activated)
  end

  test "show activated user" do
    get user_path(@activated)
    assert_template 'users/show'
  end

  test "show not activated user" do
    get user_path(@not_activated)
    assert_redirected_to root_url
  end
end
