class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new
    @user = User.new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    @user = User.create user_params
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    @users = User.all
    # render json: User.all
  end


  def show
      @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
      :check_for_admin
    end

    def update
      user = User.find params[:id]
      :check_for_admin
      user.update user_params
      redirect_to user_path(user.id)
    end

    def destroy
      User.destroy params[:id]
      :check_for_admin
      redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :admin, :password_confirmation)
  end
end
