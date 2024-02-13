class Public::FavoritesController < ApplicationController

  def create
    yakitori = Yakitori.find(params[:yakitori_id])
    favorite = current_customer.favorites.new(customer_id: current_customer.id, yakitori_id: yakitori.id)
    favorite.save
    redirect_to request.referer 
  end

  def destroy
    yakitori = Yakitori.find(params[:yakitori_id])
    favorite = current_customer.favorites.find_by(yakitori_id: yakitori.id)
    favorite.destroy
    redirect_to request.referer 
  end

end
