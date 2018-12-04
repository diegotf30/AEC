class CountriesController < ApplicationController
  before_action :set_country, only: [:create, :show, :edit, :update, :destroy]

  def index
    @countries = Country.all

    respond_to do |format|
      format.html
      format.js
      format.json { json_response(@countries) }
    end
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        flash[:success] = 'Pais creado'
        format.html
        format.js
      else
        flash[:error] = 'Hubo un error al crear el pais'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @country.update(country_params)
        flash[:success] = 'Pais actualizado exitosamente'
        format.html
        format.js
      else
        flash[:error] = 'Hubo un error al actualizar el pais'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @country.destroy_with_children
        flash[:success] = 'Pais borrado'
        format.html { redirect_to country_path(@city.country) }
        format.js
      else
        flash[:error] = 'Hubo un error al borrar el pais'
        format.html
        format.js { render "flash" }
      end
    end
  end

  def show
    @cities = City.where(country: @country)

    respond_to do |format|
      format.html
      format.js
      format.json { json_response(@country) }
    end
  end

  private

  def set_country
    @country ||= Country.find_by(id: params[:id])
  end

  def country_params
    params
      .require(:country)
      .permit(:name)
  end
end
