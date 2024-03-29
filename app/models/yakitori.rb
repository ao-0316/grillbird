class Yakitori < ApplicationRecord

  belongs_to :genre
  has_many :yakitori_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  #validates :comment, presence: true
  #品目の投稿が出来なくなる


  def self.looks(search, word)
    if search == "perfect_match"
      @yakitori = Yakitori.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @yakitori = Yakitori.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @yakitori = Yakitori.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @yakitori = Yakitori.where("name LIKE?","%#{word}%")
    else
      @yakitori = Yakitori.all
    end
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
