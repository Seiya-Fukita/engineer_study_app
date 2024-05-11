class Users::PasswordsController < ApplicationController
  def new
    @user = User.new
  end
end
