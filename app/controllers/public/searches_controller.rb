class Public::SearchesController < ApplicationController

  def genre_search
    @genre_id = params[:genre_id]
    @yakitoris = Yakitori.where(genre_id: @genre_id)
    @genres = Genre.all
  end
  
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
    else
      @yakitoris = Yakitori.looks(params[:search], params[:word])
    end
  end
end