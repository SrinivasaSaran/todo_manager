class UsersController < ApplicationController

  def index
    render plain: "User Details:\n\n#{User.order(:id).map { |user| user.to_neat_look }.join("\n\n")}"
  end

  def show
    render plain: "#{User.find(params[:id]).to_neat_look}"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    render plain: "Yay;)\nWelcome #{params[:name].upcase}. you are now signed up! You can now enjoy our Service"
  end

  def login
    login = User.where(
      "email = ? and password = ?",
      params[:email],
      params[:password]
    ).length
    render plain: "False" if login == 0
    render plain: "True" if login == 1
  end
end
