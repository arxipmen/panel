class Country < ActiveRecord::Base
  validates :name,      presence: true
  validates :full_name, presence: true
end
