class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @conversation = Conversation.find(params.permit(:conversation_id)[:conversation_id])
    @messages = Message.for_display(@conversation)
    @message = Message.new(content: '', conversation_id: @conversation.id, user_id: current_user.id)
  end

  def create
    @conversation = Conversation.find(message_params[:conversation_id])
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast "room_channel_#{@conversation.id}",
                                     message: render_message(message)
      if current_user == @conversation.listing.host_id
      
      end
    end
  end

  private
  
    def message_params
      params.require(:message).permit(:content, :conversation_id, :user_id)
    end
  
    def render_message(message)
      render(partial: 'message', locals: { message: message })
    end
end
