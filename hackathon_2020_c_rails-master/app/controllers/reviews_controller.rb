class ReviewsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  protect_from_forgery
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /memos
  def index
    @reviews = Review.all.includes(:user, :book)
  end

  # GET /memos/1
  def show
    @user = User.find_by(token: @review.token)
    @book = Book.find_by(id: @review.book_id)
    respond_to do |f|
        f.any { render :json => {:review => @review, :user => @user , :book => @book} }
    end
  end

  # POST /memos
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memos/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /memos/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:book_id, :summary, :impression, :user_id, :token)
    end

end
