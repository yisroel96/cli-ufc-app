class Fighter < ActiveRecord::Base
  belongs_to :camp
  belongs_to :weight_classes

end
