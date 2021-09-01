# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  def setup
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '#follow' do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test '#unfollow' do
    @alice.follow(@bob)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end
end
