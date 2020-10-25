class UserController < ApplicationController
    protect_from_forgery
    before_action :authenticate, only: [:index,:show]
    def index
      @users = User.all
      render json: @users, only: [:id,:name, :email, :user_name, :image_url]
    end
    def show
      @user = User.find(params[:id])
      render json: @user, only: [:id, :name, :email, :user_name, :image_url]
    end
    def create
        @user = User.new(user_params)
    
        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
      
      def user_params
        params.require(:user).permit(:name, :email, :password, :user_name, :image_url)
      end
  end