class WelcomeController < ApplicationController
  def index
    @user_email = current_user.email.split('@')[0] if current_user
  end

  def about
  end
end
