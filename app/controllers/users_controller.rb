class UsersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_user, only: [:edit, :update, :destroy]
  # authorize_resource


  def new
  	@user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(@home, :notice => 'User was successfully created.')  	
  end

  def update
    @user = current_user
  	if @user.update(user_params)
      redirect_to @user, notice: "User was revised in the system."
    else
      render action: 'edit'
    end
  end

  private
  def user_params
    if current_user && (current_user.role?(:admin) || current_user.role?(:instructor))
    params.require(:user).permit(:username, :instructor_id, :role, :password, :password_confirmation)
  end

end
