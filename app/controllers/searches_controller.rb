class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
    @trains = Search.routes(params[:from_station_id], params[:to_station_id])&.trains
    
    @trains.try(:each) do |train|
      @route = train.route
      @from_station = @route.first_station
      @to_station = @route.last_station
    end
    
    if params['commit'] == 'purchase'
      redirect_to controller: :tickets, action: :new,
                  ticket: {
                      train_id: params['train_id'],
                      from_station_id: params['from_station_id'],
                      to_station_id: params['to_station_id']
                  }
    end
  end
end
