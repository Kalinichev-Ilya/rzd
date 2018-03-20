class WagonsController < ApplicationController
  before_action :set_wagon, only: %i[show edit update destroy]
  before_action :set_train, only: %i[index new create]

  def index
    @wagons = @train.wagons
  end

  def show; end

  def new
    @wagon = Wagon.new
  end

  def edit; end

  def create
    @wagon = @train.wagons.new(wagon_params)

    if @wagon.save
      redirect_to @wagon
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon.becomes(Wagon)
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

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:type,
                                  :top_seats,
                                  :bottom_seats,
                                  :side_top_seats,
                                  :side_bottom_seats,
                                  :seating_seats)
  end
end
