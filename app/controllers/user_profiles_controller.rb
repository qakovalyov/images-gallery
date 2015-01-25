class UserProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_user,  only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @user.attributes = update_params_user
    if params[:user][:profile].present?
      @user.profile.attributes = update_params_profile
    end
    if @user.save
      redirect_to user_profile_path(@user.profile)
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

  private

  def set_user
    @user = @user_profile.user
  end
end
