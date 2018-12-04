class SectorsController < ApplicationController
  def show
    @sector = Sector.find_by(id: params[:id])
    @groups = Group.where(sector: @sector)
  end
end
