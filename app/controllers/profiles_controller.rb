# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to dashboard_path, notice: 'Profile created successfully.'
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile.present? ? current_user.profile : current_user.build_profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to dashboard_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      address_attributes: %i[id city],
      hobbies_attributes: %i[id name]
    )
  end
end
