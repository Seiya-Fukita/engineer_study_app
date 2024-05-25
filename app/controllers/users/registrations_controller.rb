class Users::RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(default_params))
    if @user.save!
      @one_time_password = OneTimePassword.generate_password(@user)
      UserMailer.with(user: @user, password: @one_time_password).welcome_email.deliver_later
      redirect_to confirmation_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date)
  end

  def default_params
    { identification_name: SecureRandom.hex(10), password: SecureRandom.hex(10) }
  end
end
