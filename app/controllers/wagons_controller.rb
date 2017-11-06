class WagonsController < ApplicationController
  before_action :set_wagon, only: %i[show edit update destroy]
  before_action :set_trains, only: %i[new edit]

  def index
    @wagons = Wagon.all
  end

  def show; end

  def new
    @wagon = Wagon.new
  end

  def edit; end

  def create
    @wagon = Wagon.new(wagon_params)

    if @wagon.save
      redirect_to @wagon
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def set_trains
    @trains = Train.all
  end

  def wagon_params
    params.require(:wagon).permit(:upper_seats,
                                  :bottom_seats,
                                  :train_id)
  end
end
