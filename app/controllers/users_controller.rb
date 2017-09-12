class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  before_action :check_user_existence, only: :create
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def check_user_existence
      if User.find_by(name: user_params[:name])
        response = { message: "User already exist"}
        json_response(response, :bad_request)
      end
    end
end
