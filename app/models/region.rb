class Region < ActiveRecord::Base
  validates :name,        presence: true
  validates :code,        presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :country_id,  presence: true, numericality: true

  belongs_to  :country
  has_many    :cities, dependent: :destroy
end
