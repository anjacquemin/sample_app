require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end

  test "unsucesfull information" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: {email: "", password: "foo", password_confirmation: "bar" } }
    assert_template 'users/edit'
    assert_select 'div.alert', "The form contains 4 errors."
  end

  test "sucesfull edit information" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: {name: "mickaaaaael", email: "mick@new.com", password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirect_to @user
    @user.reload
    assert_equal @user.name, "mickaaaaael"
    assert_equal @user.email, "mick@new.com"
  end

end
