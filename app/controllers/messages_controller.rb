class MessagesController < ApplicationController
  before_action :set_message, only:[:edit,:update,:destroy]
  
  def index
    @messages = Message.all
  end
  
  def new
    if params[:back]
      @message = Message.new(set_params)
    else
      @message = Message.new
    end
  end
  
  def create
    @message = Message.new(set_params)
    if @message.save
      redirect_to messages_path, notice: 'create!' 
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(set_params)
      redirect_to messages_path,notice: 'editted'
    else
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy  
    redirect_to messages_path,notice: 'deleted!'
  end
  
  def confirm
    @message = Message.new(set_params)
    render 'new' if @message.invalid?
  end
  
  private
  
  def set_params
    params.require(:message).permit(:content)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  
end
