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
  end

  def new
    authorize! :new, @camp
    @camp = Camp.new
  end

  def edit
    authorize! :edit, @camp
    # Handle shortcut deactivations
    # unless params[:status].nil?
    #   if params[:status].match(/deactivate/) # == 'deactivate_prj' || params[:status] == 'deactivate_asgn'
    #     @camp.update_attribute(:active, false)
    #     flash[:notice] = "#{@camp.curriculum.name} was made inactive."
    #   elsif params[:status].match(/activate/) # == 'activate_prj' || params[:status] == 'activate_asgn'
    #     @camp.update_attribute(:active, true)
    #     flash[:notice] = "#{@camp.curriculum.name} was made active."
    #   end
    #   redirect_to curriculums_path(@camp.curriculum) if params[:status].match(/_curr/)
    #   redirect_to camp_path if params[:status].match(/_camp/)
    # end
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
    @camp.destroy
    redirect_to camps_url, notice: "#{@camp.name} camp on #{@camp.start_date.strftime('%m/%d/%y')} was removed from the system."
  end

  private
    def set_camp
      @camp = Camp.find(params[:id])
    end

    def camp_params
      params.require(:camp).permit(:location_id, :curriculum_id, :cost, :start_date, :end_date, :time_slot, :max_students, :active, :instructor_ids => [])
    end
end
