# frozen_string_literal: true

module ApplicationHelper
  def logged_in?
    !current_user.nil?
  end
end
