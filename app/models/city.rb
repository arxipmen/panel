class City < ActiveRecord::Base
  validates :name,      presence: true
  validates :region_id, numericality: true

  belongs_to  :region
  has_many    :tourist_bases, dependent: :destroy
end
