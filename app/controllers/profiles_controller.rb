class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]

    def update
        puts params, "params "
        #updated_profile_params = update_array_attributes_in_params(profile_params)
        #@profile = Profile.find(params[:id])
        #if @profile.update(updated_profile_params)
            #flash[:success] = "Profile updated successfully."
            #redirect_to edit_url
        #else
            #flash[:danger] = "Profile update failed."
            #redirect_to root_url
        #end
    end

    def show
      puts params.inspect, "params "
      @user ||= User.find_by(id: params[:id])
      if @user
         render "home/index"
      else
        render "companies/error"
      end
    end

    def correct_user
        puts params.inspect
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end

    private
        #def profile_params
            #puts params , "sdfsd "
            ##params.require(:profile).permit(:name, :job_title, :total_experience, :overview,
                ##:career_highlights, :primary_skills, :secondary_skills,:image,
                ##:educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy],
                ##:companies_attributes => [:id, :name, :position, :start, :end, :description], :project_attributes => [ :name, :project_url, :tech_stack, :description ]
            #)
        #end

        #def public_profile_params
          #params.permit(:id)
        #end
end
