class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false
  
  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      admin: params[:admin]

    )
    render json: user
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: User.all
  end
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
