class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  
  def new
    if params[:back]
      @message = Message.new(params.require(:message).permit(:content))
    else
      @message = Message.new
    end
  end
  
  def create
    @message = Message.new(params.require(:message).permit(:content))
    if @message.save
      redirect_to messages_path, notice: 'create!' 
    else
      render 'new'
    end
  end
  
  def edit
    @message = Message.find(params[:id])
  end
  
  def update
    @message=Message.find(params[:id])
    if @message.update(params.require(:message).permit(:content))
      redirect_to messages_path,notice: 'editted'
    else
      render 'edit'
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy  
    redirect_to messages_path,notice: 'deleted!'
  end
  
  def confirm
    @message = Message.new(params.require(:message).permit(:content))
  end
  
end
