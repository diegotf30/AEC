class CitiesController < ApplicationController
  before_action :set_city, only: [:create, :show, :edit, :update, :destroy]

  def new
    @city = City.new
    country
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        flash[:success] = 'Ciudad creada'
        format.html
        format.js
      else
        flash[:error] = 'Hubo un error al crear la ciudad'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def edit
    country
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        flash[:success] = 'Ciudad actualizada exitosamente'
        format.html
        format.js
      else
        flash[:error] = 'Hubo un error al actualizar la ciudad'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @city.destroy_with_children
        flash[:success] = 'Ciudad borrada'
        format.html { redirect_to country_path(@city.country) }
        format.js
      else
        flash[:error] = 'Hubo un error al borrar la ciduad'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def show
    @sectors = Sector.where(city: @city)

    respond_to do |format|
      format.html
      format.js
      format.json { json_response(@city) }
    end
  end

  private

  def country
    @country ||= Country.find_by(id: params[:country_id])
  end

  def set_city
    @city = City.find_by(id: params[:id])
  end

  def city_params
    params
      .require(:city)
      .permit(:name)
      .merge(country: country)
  end
end
