class Admin::YakitoriCommentsController < ApplicationController
  
  def index
    @yakitori_comments = YakitoriComment.all
    @customers = Customer.all
  end
  
  def destroy
    @yakitori_comment = YakitoriComment.find(params[:id])
    @yakitori_comment.destroy
    redirect_to admin_yakitori_comments_path
  end
  
  
end
