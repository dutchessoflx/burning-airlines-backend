class ReservationsController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    # headers['Access-Control-Allow-Origin'] = '*'
    rowCol = params[:seat_id].split('-')
    reservation = Reservation.create(
      row: rowCol[0],
      cols: rowCol[1],
      user_id: params[:user_id],
      flight_id: params[:flight_id]
    )
    render json: reservation
  end

  def index
    # headers['Access-Control-Allow-Origin'] = '*'

    flight = Flight.find_by flight_number: params[:flight_number]
    seat_map = flight.generate_seat_map

    render json: { seat_map: seat_map, flight: flight }
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
