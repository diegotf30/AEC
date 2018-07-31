class CitiesController < ApplicationController
  def show
    @city = City.find_by(id: params[:id])
    @sectors = Sector.where(city: @city)
  end
end
