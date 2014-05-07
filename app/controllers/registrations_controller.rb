class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]  
  # before_action :check_login
  
  def index
    # @registrations = Registration.by_student.paginate(:page => params[:page]).per_page(10)
  end

  def show
  # authorize! :show, @registration
    # @registration = Registration.find(params[:id])
  end
  
  def new
  # authorize! :new, @registration
    @registration = Registration.new
    @registration.camp_id = params[:camp_id]
  end

  def edit
  # authorize! :edit, @registration
    # @registration = Registration.find(params[:id])
  end

  def create
  # authorize! :create, @registration
    @registration = Registration.new(registration_params)
      if @registration.save
        # if saved to database
        redirect_to @registration.camp, notice: "Successfully created registration for #{@registration.student.proper_name}."
      else
        # return to the 'new' form
        
        redirect_to :back, notice: "Could not create registration for #{@registration.student.proper_name}."
      end
    end


  def update
  # authorize! :update, @registration
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      redirect_to @registration.camp, notice: "Successfully updated registration for #{@registration.student.proper_name}."
    else
      render action: 'edit'
    end
  end

  def destroy
  # authorize! :destroy, @registration
  #   @registration = Registration.find(params[:id])
  #   camp_id = @registration.camp.id
    @registration.destroy
    redirect_to @registration.camp, notice: "Successfully removed registration for #{@registration.student.proper_name} from chess camp system"
    # redirect_to registrations_url
    # redirect_to camp_path(camp_id) # go to show  page
  end

  private
  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit(:id, :camp_id, :student_id, :payment_status, :points_earned)
  end
end