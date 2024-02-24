class Public::RoomsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @room = Room.create(customer_id: current_customer.id)
    @entry1 = Entry.create(:room_id => @room.id, :customer_id => current_customer.id)
    @entry2 = Entry.create(params.require(:entry).permit(:customer_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/public/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:customer_id => current_customer.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    #Roomで相手の名前表示するために記述
      @myUserId = current_customer.id
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
