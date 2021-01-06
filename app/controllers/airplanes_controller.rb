class AirplanesController < ApplicationController

skip_before_action :verify_authenticity_token, raise: false

  def new
    @airplane = Airplane.new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    airplane = Airplane.create(
      name: params[:name],
      rows: params[:rows],
      cols: params[:cols]
    )
    redirect_to airplane_path
    render json: airplane
  end

  def index
    # headers['Access-Control-Allow-Origin'] = '*'
    # render json: Airplane.all
    @airplanes = Airplane.all
  end

  def show
    @airplane = Airplane.find params[:id]
  end

  def edit
    @airplane = Airplane.find params[:id]
  end

  def update
    airplane=Airplane.find params[:id]
    airplane.update airplane_params

  redirect_to airplane_path
  end

  def destroy
  end

  private
  def airplane_params
    params.require(:airplane).permit(:name, :rows, :cols)
  end
end
