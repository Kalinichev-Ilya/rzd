class TicketsController < ApplicationController
  before_action :ticket_params, only: %i[new create]

  def new
    @ticket = Ticket.new
    @train = Train.find(ticket_params['train_id'])
    @from_station = RailwayStation.find(ticket_params['from_station_id'])
    @to_station = RailwayStation.find(ticket_params['to_station_id'])
  end

  def create
    @ticket = Ticket.create!(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render 'searches/show'
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def ticket_params
    params.require(:ticket)
          .permit(:number,
                  :train_id,
                  :from_station_id,
                  :to_station_id,
                  :holder_name,
                  :passport_data)
  end
end
