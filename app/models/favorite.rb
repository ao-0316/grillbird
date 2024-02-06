class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :yakitori

  validates :customer_id, uniqueness: {scope: :yakitori_id}

end
