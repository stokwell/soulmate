# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def search
    if current_user.profile&.address.present?
      @soulmates = SoulmateFinderService.new(current_user).call
    else
      flash[:error] = 'Please update your profile with an address to use this feature.'
      redirect_to :dashboard
    end
  end
end
