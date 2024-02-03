class Admin::YakitorisController < ApplicationController
  
  def index
    @yakitoris = yakitori.all
  end

  def new
    @yakitori = Yakitori.new
  end

  def create
    @yakitori = Yakitori.new(item_params)
    if @yakitori.save
      flash[:notice] = "商品の新規登録が完了しました"
      redirect_to admin_yakitoris_index_path(@yakitori.id)
    else
      flash[:notice] = "商品の新規登録に失敗しました"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end


private
  
  def item_params
    params.require(:yakitori).permit(:image, :name, :introduction, :genre_id,)
  end