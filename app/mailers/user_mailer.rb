class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: '私の素敵なサイトへようこそ')
  end
end
