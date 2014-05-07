class CampsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_camp, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:index, :show]
  # authorize_resource

  def index
    @upcoming_camps = Camp.upcoming.active.chronological.paginate(:page => params[:page]).per_page(10)
    @past_camps = Camp.past.chronological.paginate(:page => params[:page]).per_page(10)
    @inactive_camps = Camp.inactive.alphabetical.to_a
  end

  def show
    @instructors = @camp.instructors.alphabetical.to_a
    @registration = Registration.new
  end

  def new
    authorize! :new, @camp
    @camp = Camp.new
  end

  def edit
    authorize! :edit, @camp
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @camp.update(camp_params)
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    status = @camp.destroy
    if status
      flash[:notice] = "Successfully removed #{@camp.name} from Arbeit."
      redirect_to camps_url
    else
      flash[:error] = "#{@camp.name} could not be deleted because of completed tasks, but has been ended as of today."
      redirect_to camps_url
    end
  end

  private
    def set_camp
      @camp = Camp.find(params[:id])
    end

    def camp_params
      params.require(:camp).permit(:location_id, :curriculum_id, :cost, :start_date, :end_date, :time_slot, :max_students, :active, :instructor_ids => [])
    end
end
