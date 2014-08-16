class LocationsController < ApplicationController

  def index
    @locations = Location.where(id: params[:ids])
  end

end
