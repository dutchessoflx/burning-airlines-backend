class UsersController < ApplicationController
  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    user = User.create(
      name: params[:name]

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
