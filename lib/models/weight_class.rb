class WeightClass < ActiveRecord::Base
  has_many :fighters
  has_many :camps, through: :fighters
end
