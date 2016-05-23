class RegionController < ApplicationController
  before_filter :find_region, only: [:edit, :show, :update, :destroy]

  def index
    @region = Region.all
    @country = Country.all
  end

  def show
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    if @region.update(region_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    @region.destroy
    redirect_to action: 'index'
  end

  private
    def region_params
      params.require(:region).permit(:name, :code, :country_id)
    end
    def find_region
      @region = Region.where(id: params[:id]).first
      if @region.nil?
        render_404
      end
    end
end
