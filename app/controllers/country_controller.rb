class CountryController < ApplicationController

  before_filter :find_country, only: [:edit, :show, :update, :destroy]

  def index
    @country = Country.all
  end

  def show
    # @country = Country.find_by(id: params[:id])
    # if @country.nil?
    #   render text: 'Page not found', status: 404
    # end
  end

  def new
    @country = Country.new
  end

  def edit
    # @country = Country.find(params[:id])
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    # @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    # @country = Country.find(params[:id])
    @country.destroy
    redirect_to action: 'index'
  end

  private
    def country_params
      params.require(:country).permit(:name, :full_name)
    end

  def find_country
    @country = Country.where(id: params[:id]).first
    if @country.nil?
      render_404
    end
  end
end
