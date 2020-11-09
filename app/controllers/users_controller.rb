class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def show
    @opinion = Opinion.new
    @opinions = @user.opinions.order('created_at DESC')
    @users = @user.followers
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:username] = @user.Username
        session[:user_id] = @user.id
        format.html { redirect_to opinions_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:Username, :FullName, :Photo, :CoverImage)
  end
end
