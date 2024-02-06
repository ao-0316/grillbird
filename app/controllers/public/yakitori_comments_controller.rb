class Public::YakitoriCommentsController < ApplicationController

  def create
    yakitori = Yakitori.find(params[:yakitori_id])
    comment = current_customer.yakitori_comments.new(yakitori_comment_params)
    comment.yakitori_id = yakitori.id
    comment.save
    redirect_to public_yakitori_path(yakitori)
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
