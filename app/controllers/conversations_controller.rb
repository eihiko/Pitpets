class ConversationsController < ApplicationController

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    if Conversation.between(params[:a_id],params[:b_id]).present?
      @conversation = Conversation.between(params[:a_id], params[:b_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

private
  def conversation_params
    params.permit(:a_id, :b_id)
  end
end
