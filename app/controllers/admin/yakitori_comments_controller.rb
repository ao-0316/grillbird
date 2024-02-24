class Admin::YakitoriCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @yakitori_comments = YakitoriComment.all
    @customers = Customer.all
    @yakitoris = Yakitori.all
  end
  
  def destroy
    @yakitori_comment = YakitoriComment.find(params[:id])
    @yakitori_comment.destroy
    redirect_to admin_yakitori_comments_path
  end
  
  
end
