class InstructorsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]
  before_action :check_login, :except => [:show, :index]
  # authorize_resource

  def index
    @active_instructors = Instructor.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    @inactive_instructors = Instructor.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def show
    @upcoming_camps = @instructor.camps.upcoming.chronological
    @past_camps = @instructor.camps.past.chronological
  end

  def new
    authorize! :new, @instructor
    @instructor = Instructor.new
    #@instructor.build_user
    @instructor.build_user
  end

  def edit
    authorize! :edit, @instructor
    if !@instructor.user
      @instructor.build_user
    end
    # reformating the phone so it has dashes when displayed for editing (personal taste)
    @instructor.phone = number_to_phone(@instructor.phone)
  end

  def create
    authorize! :new, @instructor
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to @instructor, notice: "#{@instructor.proper_name} was added to the system."
    else
      render action: 'new'
    end
  end


  def update
    authorize! :update, @instructor
    if @instructor.update(instructor_params)
      redirect_to @instructor, notice: "#{@instructor.proper_name} was revised in the system."
    else
      render action: 'edit'
    end
  end



  def destroy
    @instructor.destroy
    redirect_to instructors_url, notice: "Instructors cannot be removed from the system."
  end

  private
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    def instructor_params
      params.require(:instructor).permit(
        :id,
        :first_name, 
        :last_name, 
        :bio, 
        :email, 
        :phone, 
        :active, 
        :picture,
        user_attributes: [:instructor_id, :username, :role, :password, :password_confirmation, :id]
        )
    end
end
