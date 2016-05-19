class TouristBase < ActiveRecord::Base
  validates :name,          presence: true
  validates :city_id,       presence: true, numericality: true
  validates :description,   presence: true
  validates :phone,         presence: true

  belongs_to  :city
end