class Fighter < ActiveRecord::Base
  belongs_to :camp
  belongs_to :weight_classes

  def camp
    Camp.find(self.camp_id)
  end

  def weight_class
    WeightClass.find(self.weight_class_id)
  end

end
