class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in, except: [:destroy]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password_digest])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      render plain: "Incorrect Mail or Password"
    end
  end

  def new
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
