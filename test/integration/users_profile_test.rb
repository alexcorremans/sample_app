require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
    @activated = users(:archer)
    @not_activated = users(:not_activated)
    @user.follow(@activated)
  end

  test "show activated user" do
    get user_path(@activated)
    assert_template 'users/show'
  end

  test "show not activated user" do
    get user_path(@not_activated)
    assert_redirected_to root_url
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
    assert_select 'div.stats>a', /#{@user.following.count}\s+following/
    assert_select 'div.stats>a', /#{@user.followers.count}\s+followers/
  end
end
