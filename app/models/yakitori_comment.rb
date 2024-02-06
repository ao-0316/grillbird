class YakitoriComment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :yakitori
  
end
