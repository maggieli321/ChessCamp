class StudentsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  # authorize_resource

  def index
    @active_students = Student.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    @inactive_students = Student.inactive.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def show
    authorize! :show, @student
  end

  def new
    authorize! :new, @student
    @student = Student.new
  end

  def edit
     authorize! :edit, @student
  end


  def create
    if student_params["date_of_birth"]
      student_params["date_of_birth"] = Chronic.parse(student_params["date_of_birth"])
    end
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "#{@student.proper_name} was added to the system"
    else
      render action: 'new'
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "#{@student.proper_name} was revised in the system"
    else
      render action: 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "#{@student.proper_name} was removed from the system"
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :family_id, :date_of_birth, :rating, :active)
	end
end
