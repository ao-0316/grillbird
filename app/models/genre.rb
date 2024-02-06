class Genre < ApplicationRecord
  
  has_many :yakitoris, dependent: :destroy
  
end
