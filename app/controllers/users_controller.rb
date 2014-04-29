class UsersController < ApplicationController


  def new
  	@user = current_user
  end

  def edit
    @user = current_user
  end

  def create
  	session[:user_id] = @user.id
    redirect_to(@home, :notice => 'User was successfully created.')  	
  end

  def update
  	# if @user.update(user_params)
   #    redirect_to @user, notice: "user was revised in the system."
   #  else
   #    render action: 'edit'
   #  end
  end

  private
  def user_params
    params.require(:user).permit(:username, :instructor_id, :role, :password, :password_confirmation)
  end

end
