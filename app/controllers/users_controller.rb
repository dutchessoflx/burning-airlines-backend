class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      admin: params[:admin]

    )
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
    render json: User.all
  end


  def show
      @user = User.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
