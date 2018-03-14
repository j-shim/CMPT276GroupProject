require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(firstname:"Bill", lastname:"Gate",username: "Example User", password:"Example password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "Firstname should be present" do
    @user.firstname = "     "
    assert_not @user.valid?
  end

  test "Lastname should be present" do
    @user.lastname = "     "
    assert_not @user.valid?
  end

  test "Username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
