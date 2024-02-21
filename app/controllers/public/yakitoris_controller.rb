class Public::YakitorisController < ApplicationController
  before_action :authenticate_customer!

  def index
    @yakitoris = Yakitori.all
    @genres = Genre.all

    #@yakitori_count = Yakitori.all
  end

  def show
    @yakitori = Yakitori.find(params[:id])
    @yakitori_comment = YakitoriComment.new
    @genres = Genre.all
    #@customer = @yakitori.customer
  end

  def list_params
    params.reguire(:yakitori).permit()
  end

end
