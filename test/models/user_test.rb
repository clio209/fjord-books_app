# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#name_or_email" do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal = assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar' , user.name_or_email
  end

  test "#follow" do
    me = User.create!(email: 'me@example.com, password: 'password)
    he = User.create!(email: 'he@example.com, password: 'password)

    assert me.follow
  end
end
