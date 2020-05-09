class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password_digest])
      render plain: "You are now signed in"
    else
      render plain: "Incorrect Mail or Password"
    end
  end

  def new
  end
end
