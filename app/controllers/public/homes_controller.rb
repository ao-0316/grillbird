class Public::HomesController < ApplicationController
  def top
    @yakitoris = Yakitori.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def about
  end
end
