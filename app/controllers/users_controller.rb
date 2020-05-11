class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    if !(params[:password_digest] == params[:password_confirmation_digest])
      redirect_to "/users/new", error: "Password Mismatch.\n You must enter same content in both password fields"
    else
      user = User.create(
        username: params[:username],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password_digest],
        password_confirmation: params[:password_confirmation_digest],
      )
      if user.valid?
        session[:current_user_id] = user.id
        redirect_to "/"
      else
        flash[:invalid] = user.errors.full_messages.join(" , ")
        redirect_to new_user_path
      end
    end
  end
end
