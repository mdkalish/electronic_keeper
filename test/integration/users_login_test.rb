require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test 'unsuccessful login' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { name: "", password: "" }
    binding.pry
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'successful login' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { name: "asiak", password: "asd" }
    assert_template 'main'
  end

end
