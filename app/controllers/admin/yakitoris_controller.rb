class Admin::YakitorisController < ApplicationController
  before_action :authenticate_admin!

  def index
    @yakitoris = Yakitori.all
  end

  def new
    @yakitori = Yakitori.new
  end

  def create
      @yakitori = Yakitori.new(yakitori_params)
    if @yakitori.save
      flash[:notice] = "焼き鳥の新規登録が完了しました"
      redirect_to admin_yakitori_path(@yakitori.id)
    else
      render 'new'
    end
  end

  def show
    @yakitori = Yakitori.find(params[:id])
  end

  def edit
    @yakitori = Yakitori.find(params[:id])
  end

  def update
    @yakitori = Yakitori.find(params[:id])
    if @yakitori.update(yakitori_params)
      flash[:notice] = "焼き鳥の詳細変更が完了しました。"
      redirect_to admin_yakitori_path
    else
      flash[:notice] = "焼き鳥の詳細変更に失敗しました。"
      render :edit
    end
  end
end


private

  def yakitori_params
    params.require(:yakitori).permit(:image, :name, :introduction, :genre_id,)
  end