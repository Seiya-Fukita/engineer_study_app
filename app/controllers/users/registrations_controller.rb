class Users::RegistrationsController < ApplicationController
  def new
  end

  def create
    redirect_to confirmation_path
  end
end
