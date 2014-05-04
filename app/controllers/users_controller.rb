class UsersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  # authorize_resource

  def index
    # @users = User.all.paginate(:page => params[:page]).per_page(10)
  end

  def show
    authorize! :show, @user
    @user = User.find(params[:id])
  end

  def new
    authorize! :new, @user
  	@user = User.new
  end

  def edit
    # @user = current_user
    if(current_user && (current_user.role == 'admin' || current_user.role == 'instructor'))
      @user = User.find(params[:id])
    else
      @user = :current_user
    end
  end

  def create
    authorize! :create, @user
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(@home, :notice => 'Thank you for signing up!')  	
    else
      flash[:error] = "This user could not be created."
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    # @user = current_user
  	if @user.update(user_params)
      redirect_to @user, notice: "User was revised in the system."
    else
      render action: 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end  
  def user_params
    if current_user && current_user.role?(:admin)
      params.require(:user).permit(:username, :instructor_id, :role, :password, :password_confirmation)
    elsif current_user && current_user.role?(:instructor)
      params.require(:user).permit(:username, :instructor_id, :password, :password_confirmation)
    end
  end
  end
