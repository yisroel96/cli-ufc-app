class Camp < ActiveRecord::Base
  has_many :fighters
  has_many :weight_classes, through: :fighters

  def fighter
    Fighter.find(self.fighter_id)
  end

end
