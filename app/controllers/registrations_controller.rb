class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]  
  # before_action :check_login
  
  def index
  end

  def show
  end
  
  def new
    @registration = Registration.new
    @registration.camp_id = params[:camp_id]
  end

  def edit
  end

  def create
    @registration = Registration.new(registration_params)
      if @registration.save
        # if saved to database
        redirect_to @registration.camp, notice: "Successfully created registration for #{@registration.student.proper_name}."
      else
        redirect_to :back, notice: "Could not create registration for #{@registration.student.proper_name}."
      end
    end


  def update
    @registration = Registration.find(params[:id])
    if @registration.update_attributes(params[:registration])
      redirect_to @registration.camp, notice: "Successfully updated registration for #{@registration.student.proper_name}."
    else
      render action: 'edit'
    end
  end

  def destroy
    @registration.destroy
    redirect_to @registration.camp, notice: "Successfully removed registration for #{@registration.student.proper_name} from chess camp system"
  end

  private
  def set_registration
    @registration = Registration.find(params[:id])
  end

  def registration_params
    params.require(:registration).permit(:id, :camp_id, :student_id, :payment_status, :points_earned)
  end
end