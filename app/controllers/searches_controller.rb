class SearchesController < ApplicationController
  def new
    @stations = RailwayStation.all
  end

  def show
    @ticket = Ticket.new
    @stations = params
    @results = Search.call(params[:from_station_id], params[:to_station_id])
  end
end
