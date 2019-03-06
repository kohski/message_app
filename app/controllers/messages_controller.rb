class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params.require(:message).permit(:content))
    if @message.save
      redirect_to messages_path, notice: 'create!' 
    else
      render 'new'
    end
  end
  
  
end
