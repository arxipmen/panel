class Country < ActiveRecord::Base
  validates :name,      presence: true
  validates :full_name, presence: true

  has_many :regions, dependent: :destroy
end