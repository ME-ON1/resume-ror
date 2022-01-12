class HomeController < ApplicationController

  def index
    logged_in_user
    @user = current_user
  end

  def edit
    logged_in_user
    if current_user
        @profile = current_user.profile
        puts current_user.profile.educations[1].school
    end
  end

end
