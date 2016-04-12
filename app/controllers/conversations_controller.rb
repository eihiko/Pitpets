class ConversationsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do
    flash.alert = "That conversation doesn't exist bro!"
    redirect_back
  end

  def index
    if boxtype == "inbox"
      @conversations = mailbox.inbox
    elsif boxtype == "sent"
      @conversations = mailbox.sentbox
    else
      @conversation = mailbox.trash
    end
    unless @conversations.nil?
      @conversations = @conversations.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    conversation
  end

  def reply
    @current_user.reply_to_conversation(conversation, params[:body])
    flash.notice = "Your reply was sent!"
    redirect_to conversation_path(conversation)
  end

  private

  def boxtype
    params[:boxtype] = "inbox" if params[:boxtype].blank?
    params[:boxtype] = "inbox" if !["sent", "trash"].include?(params[:boxtype])
    @boxtype = params[:boxtype]
  end

  def mailbox
    @mailbox ||= @current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

end
