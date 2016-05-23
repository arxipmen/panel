class AdminController < ApplicationController
  def index
    @country_count = Country.count
    @region_count = Region.count
    @city_count = City.count
    @tourist_base_count = TouristBase.count
  end
end
