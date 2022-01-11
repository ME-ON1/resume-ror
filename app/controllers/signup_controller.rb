class SignupController < ApplicationController
  def index
    if !current_user.nil?
      redirect_to(root_path)
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.profile = Profile.new
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_url
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
