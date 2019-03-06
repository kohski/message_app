class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(params.require(:message).permit(:content))
    @message.save
    redirect_to messages_path, notice: 'create!' 
  end
  
  
end
