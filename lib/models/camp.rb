class Camp < ActiveRecord::Base
  has_many :fighters
  has_many :weight_classes, through: :fighters
  
end
