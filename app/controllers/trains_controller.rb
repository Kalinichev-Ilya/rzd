class TrainsController < ApplicationController
  before_action :set_train, only: %i[show edit update destroy]
  before_action :set_routes, only: %i[new create edit update]
  before_action :wagons_count_by_type, only: %i[show]
  before_action :seats_count_by_wagon_type, only: %i[show]

  def index
    @trains = Train.all
  end

  def show; end

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

  # {
  #     berth: 3,
  #     roomette: 5
  # }
  def wagons_count_by_type
    @wagons_count = {}
    @wagons_count['berth'] = @train.wagons.where(grade: 'berth').count
    @wagons_count['roomette'] = @train.wagons.where(grade: 'roomette').count
  end

  # {
  #     berth: { upper: 10, bottom: 15 },
  #     roomette: { upper: 10, bottom: 15 }
  # }
  def seats_count_by_wagon_type
    @seats_count = {}
    berth_upper = Train.last.wagons.where(grade: 'berth').sum(:upper_seats_count)
    berth_bottom = Train.last.wagons.where(grade: 'berth').sum(:bottom_seats_count)
    roomette_upper = Train.last.wagons.where(grade: 'roomette').sum(:upper_seats_count)
    roomette_bottom = Train.last.wagons.where(grade: 'roomette').sum(:bottom_seats_count)

    @seats_count['berth'] = { upper: berth_upper, bottom: berth_bottom }
    @seats_count['roomette'] = { upper: roomette_upper, bottom: roomette_bottom }
  end
end
