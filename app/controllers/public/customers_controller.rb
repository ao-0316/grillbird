class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    # customer = Customer.find(params[:id])
    @customer = Customer.find(current_customer.id)
    
  if params[:customer][:profile_image].present?
    @customer.profile_image.attach(params[:customer][:profile_image])
  end
    
    if @customer.update(customer_params)
      redirect_to public_customers_mypage_path, notice: "変更内容を保存しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to public_homes_top_path, notice: "退会処理を実行いたしました。"
  end

  def likes
    likes = Like.where(customer_id: @customer.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :address, :email)
  end

  def set_user
    @customer = Customer.find(params[:id])
  end

end