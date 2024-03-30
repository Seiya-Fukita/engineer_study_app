class HomeController < ApplicationController
  def index
    @tweets = Tweet.preload(:user).order(created_at: :desc)
  end
end
