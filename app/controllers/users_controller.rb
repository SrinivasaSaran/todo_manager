class UsersController < ApplicationController
  def index
    #render plain: "User Details:\n\n#{User.order(:id).map { |user| user.to_neat_look }.join("\n\n")}"
  end

  def new
  end

  def passworderror
  end

  def create
    if !(params[:password_digest] == params[:password_confirmation_digest])
      redirect_to "/users/passworderror"
    else
      User.create!(
        username: params[:username],
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password_digest],
        password_confirmation: params[:password_confirmation_digest],
      )
      redirect_to "/users"
      #render plain: "Yay;)\nWelcome #{params[:name].upcase}. you are now signed up! You can now enjoy our Service"
    end
  end

  def show
    render plain: "#{User.find(params[:id]).to_neat_look}"
  end

  def login
    login = User.where(
      "email = ? and password_digest = ?",
      params[:email],
      params[:password_digest]
    ).length
    #render plain: "False" if login == 0
    #render plain: "True" if login == 1
    redirect_to users_path if login == 1
    redirect_to new_user_path if login == 0
  end
end
