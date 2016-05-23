class TouristBaseController < ApplicationController
  before_filter :find_tourist_base, only: [:edit, :show, :update, :destroy]

  def index
    @country      = Country.all
    @region       = Region.all
    @city         = City.all
    @tourist_base = TouristBase.all
  end

  def show

  end

  def new
    @city_options = City.all.map{|c| [c.name, c.id]}
    @tourist_base = TouristBase.new
  end

  def edit
    @city_options = City.all.map{|c| [c.name, c.id]}
  end

  def create
    @tourist_base = TouristBase.new(tourist_base_params)
    # @tourist_base.save
    # redirect_to action: 'index'
    if @tourist_base.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    if @tourist_base.update(tourist_base_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @tourist_base.destroy
    redirect_to action: 'index'
  end

  private
  def tourist_base_params
    params.require(:tourist_base).permit(:name, :city_id, :description, :phone)
  end
  def find_tourist_base
    @tourist_base = TouristBase.where(id: params[:id]).first
    if @tourist_base.nil?
      render_404
    end
  end
end
