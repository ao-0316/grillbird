class Public::YakitorisController < ApplicationController
  
  def index
    @yakitoris = Yakitori.all
    @genres = Genre.all
    #@yakitori_count = Yakitori.all
  end

  def show
    @yakitori = Yakitori.find(params[:id])
    @genres = Genre.all
  end
  
  def list_params
    params.reguire(:yakitori).permit()
  end  
  
end
