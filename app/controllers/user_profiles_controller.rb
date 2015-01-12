class UserProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user && user == current_user
      user.attributes = update_params_user
      if params[:user][:profile].present?
        user.profile.attributes = update_params_profile
      end
      if user.save
        redirect_to user_profile_path(user)
      end
    end
  end

  private

  def update_params_user
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end

  def update_params_profile
    if params[:user][:profile].present?
      params.require(:user).require(:profile).permit(
        :avatar
      )
    end
  end
end
