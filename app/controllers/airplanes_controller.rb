class AirplanesController < ApplicationController
  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    airplane = Airplane.create(
      name: params[:name],
      rows: params[:rows],
      cols: params[:cols]
    )
    render json: airplane
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: Airplane.all
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
