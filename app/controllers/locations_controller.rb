class LocationsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:show, :index]
  # authorize_resource


  def index
    @active_locations = Location.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    @inactive_locations = Location.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def show
  end

  def new
    authorize! :new, @location
    @location = Location.new
  end

  def edit
    authorize! :edit, @location
  end


  def create
    authorize! :create, @location
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "#{@location.name} location was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    authorize! :update, @location
    if @location.update(location_params)
      redirect_to @location, notice: "#{@location.name} location was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize! :destroy, @location
    @location = Location.find(params[:id])
    @location.destroy
    if @location.destroyed?
      redirect_to locations_url, notice: "#{@location.name} location was removed from the system."
    else
      flash[:error] = "#{@location.name} location cannot be removed from the system."
      redirect_to locations_url
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:location_id, :name, :street_1, :street_2, :city, :state, :zip, :max_capacity, :latitude, :longitude, :active)
    end
end
