class TicketsController < ApplicationController
  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @passport = Passport.new
    @train = Train.find(ticket_params['train_id'])
    @from_station = RailwayStation.find(ticket_params['from_station_id'])
    @to_station = RailwayStation.find(ticket_params['to_station_id'])
  end

  def create
    user = User.registration(passport_params)
    @ticket = Ticket.new(train_id: ticket_params['train_id'],
                         from_station_id: ticket_params['from_station_id'],
                         to_station_id: ticket_params['to_station_id'])
    if @ticket.save
      user.buy(@ticket)
      redirect_to @ticket
    else
      render 'searches/show'
    end
  end

  private

  def ticket_params
    params.require(:ticket)
          .permit(:number, :train_id, :from_station_id, :to_station_id, :user_id)
  end

  def passport_params
    params.require(:passport)
          .permit(:idd, :series, :issue_date, :issuer, :division_code, :name, :surname, :birth_date)
  end
end
