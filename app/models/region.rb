class Region < ActiveRecord::Base
  validates :name,        presence: true
  validates :code,        presence: true, numericality: true
  validates :country_id,  presence: true, numericality: true

  belongs_to  :country
  has_many    :city, dependent: :destroy
end
