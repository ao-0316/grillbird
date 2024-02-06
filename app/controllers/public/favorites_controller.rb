class Public::FavoritesController < ApplicationController

  def create
    yakitori = Yakitori.find(params[:yakitori_id])
    favorite = current_customer.favorites.new(customer_id: current_customer.id, yakitori_id: yakitori.id)
    favorite.save
    redirect_to public_yakitori_path(yakitori)
  end

  def destroy
    yakitori = Yakitori.find(params[:yakitori_id])
    favorite = current_customer.favorites.find_by(yakitori_id: yakitori.id)
    favorite.destroy
    redirect_to public_yakitori_path(yakitori)
  end

end
