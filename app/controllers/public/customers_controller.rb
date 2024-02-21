class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = Customer.find(params[:id])
    @currentCustomerEntry=Entry.where(customer_id: current_customer.id)
    @customerEntry=Entry.where(customer_id: @customer.id)
      if @customer.id == current_customer.id
      else
        @currentCustomerEntry.each do |cu|
          @customerEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
    #@yakitoris = @customer.yakitori
  end
    
    
  
  #  @customer = current_customer
  

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
      redirect_to public_path(current_customer), notice: "変更内容を保存しました。"
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
  
  def  favorites
    @customer = Customer.find(params[:id])
    @yakitori = @customer.favorite_yakitoris
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :address, :email)
  end

  def set_user
    @customer = Customer.find(params[:id])
  end

end