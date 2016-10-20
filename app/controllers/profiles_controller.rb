class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def show
    @user = current_user
    @profile = Profile.find(params[:id])

  end

  def create

    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile successfully created"
    else
      redirect_to new_profile_path, alert: "An error occurrs during the creation of your profile"
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "Profile successfully updated"
    else
      render :edit, alert: "An error occurrs during the creation of your profile"
    end
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio, :photo)
    end
end
