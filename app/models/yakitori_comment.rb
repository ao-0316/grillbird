class YakitoriComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :yakitori
  
  #validates :comment, presence: true
  
end
