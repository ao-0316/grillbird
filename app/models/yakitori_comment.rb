class YakitoriComment < ApplicationRecord
  
  belongs_to :admin
  belongs_to :customer
  belongs_to :yakitori
  
end
