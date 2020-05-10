class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def passworderror
  end

  def create
    if !(params[:password_digest] == params[:password_confirmation_digest])
      redirect_to "/users/passworderror"
    else
      user = User.create!(
        username: params[:username],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password_digest],
        password_confirmation: params[:password_confirmation_digest],
      )
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end
end
