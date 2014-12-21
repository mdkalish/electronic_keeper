require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:kasia_b)
  end

  test 'users name must be present' do
    assert_not User.new.valid?
    assert_not User.new(name: "").valid?
  end

  test 'user must have unique name' do
    assert_not User.new(name: @user.name, password: 'password').valid?
    assert     User.new(name: "Unique Name", password: 'password').valid?
  end

  test 'downcase email before save' do
    u = User.new(name: "MiXeD CaSe NaMe", password: 'password')
    u.save
    assert_equal 'mixed case name', u.name
  end

end
