class LoginController < ApplicationController
  protect_from_forgery
  #skip_before_action :verify_authenticity_token

  def login
    @login_user = User.find_by(email: params[:email], password: params[:password])
    if @login_user != nil
      render json: @login_user
    else
      render json: @login_user.errors, status: :unprocessable_entity
    end
  end
end
