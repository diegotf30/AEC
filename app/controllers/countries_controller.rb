class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(id: params[:id])
    @cities = City.where(country: @country)
  end
end
