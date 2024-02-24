class Public::YakitoriCommentsController < ApplicationController

  def create
    yakitori = Yakitori.find(params[:yakitori_id])
    comment = current_customer.yakitori_comments.new(yakitori_comment_params)
    comment.yakitori_id = yakitori.id
    if  comment.save
      redirect_to public_yakitori_path(yakitori)
    else
      @error_comment = comment
      
      
      @yakitori = Yakitori.find(params[:yakitori_id])
      @yakitori_comment = YakitoriComment.new
      
      render 'public/yakitoris/show'
    end
  end

  def destroy
    YakitoriComment.find(params[:id]).destroy
    redirect_to public_yakitori_path(params[:yakitori_id])
  end


  private

  def yakitori_comment_params
    params.require(:yakitori_comment).permit(:comment)
  end

end
