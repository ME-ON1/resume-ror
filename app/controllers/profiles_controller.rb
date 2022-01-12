class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]

    def update
        updated_profile_params = update_array_attributes_in_params(profile_params)
        @profile = Profile.find(params[:id])
        if @profile.update(updated_profile_params)
            flash[:success] = "Profile updated successfully."
            redirect_to edit_url
        else
            flash[:danger] = "Profile update failed."
            redirect_to root_url
        end
    end

    #def show
      #@user = User.find_by(id: params[:id])
      #@profile = Profile.find_by(id: params[:id])
      ##if @user.blank?
        ##render "empty"
      ##else
        #render template: "home/index", locals: {user : @user, profile: @profile}
      ##end
    #end

    def correct_user
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :job_title, :total_experience, :overview,
                :career_highlights, :primary_skills, :secondary_skills,
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy],
                :companies_attributes => [:id, :name, :position, :start, :end, :description, :project_attributes => [:project_url, :name, :description, :tech_stack]]
            )
        end

        def public_profile_params
          params.permit(:id)
        end
end
