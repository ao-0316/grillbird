class Yakitori < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :yakitori_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
