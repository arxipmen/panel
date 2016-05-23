class CityController < ApplicationController
  before_filter :find_city, only: [:edit, :show, :update, :destroy]

  def index
    @country = Country.all
    @region = Region.all
    @city   = City.all
  end

  def show

  end

  def new
    @region_options   = Region.all.map{|c| [c.country.name + ' / ' + c.name, c.id]}
    @city = City.new
  end

  def edit
    @region_options   = Region.all.map{|c| [c.country.name + ' / ' + c.name, c.id]}
    @region_code   = Region.all.map{|c| [c.code, c.id]}
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    if @city.update(city_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @city.destroy
    redirect_to action: 'index'
  end

  private
  def city_params
    params.require(:city).permit(:name, :region_id)
  end
  def find_city
    @city = City.where(id: params[:id]).first
    if @city.nil?
      render_404
    end
  end
end
