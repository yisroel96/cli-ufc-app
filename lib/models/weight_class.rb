class WeightClass < ActiveRecord::Base
  has_many :fighters
  has_many :camps, through: :fighters

  def fighter
    Fighter.find(self.fighter_id)
  end

end
