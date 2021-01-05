class ReservationsController < ApplicationController

  skip_before_action :verify_authenticity_token, raise: false

  def new
  end

  def create
    headers['Access-Control-Allow-Origin'] = '*'
    reservation = Reservation.create(
      row: params[:row],
      cols: params[:cols],
      user_id: params[:user_id],
      flight_id: params[:flight_id]
    )
    render json: reservation
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    render json: Reservation.all
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
