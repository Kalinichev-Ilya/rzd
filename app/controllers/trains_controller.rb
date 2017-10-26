class TrainsController < ApplicationController
  before_action :set_train, only: %i[show edit update destroy]
  before_action :set_routes, only: %i[new create edit update]

  def index
    @trains = Train.all
  end

  def show
    @berth_count = @train.wagons.berth.count
    @roomette_count = @train.wagons.roomette.count
    @seats_count_by_wagon_type = @train.seats_count_by_wagon_type
  end

  def new
    @train = Train.new
  end

  def edit; end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to @train
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to @train
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to trains_url
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def set_routes
    @routes = Route.all
  end

  def train_params
    params.require(:train).permit(:number, :route_id)
  end
end
