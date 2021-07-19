# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
end
