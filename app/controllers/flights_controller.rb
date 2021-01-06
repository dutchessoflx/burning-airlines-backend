class FlightsController < ApplicationController
  def new
    @flights = Flight.new
    @planes = Airplane.all.map{ |plane| [ plane.name, plane.id ] }
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def index
    @flights = Flight.all

    respond_to do |format|
      format.html { @flights }
      format.json { render json: @flights }
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def flight_params
    params.require(:flight).permit(
      :scheduled, :to, :from, :flight, :plane_id
    )
  end
end
