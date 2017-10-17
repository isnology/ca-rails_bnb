class SupportController < ApplicationController
  def new
    @error_messages = []
  end
  
  def create
    from_email = params[:email]
    message = params[:message]
    
    @error_messages = []
    @error_messages << 'Please enter your email' if from_email.blank?
    @error_messages << 'Please enter your message' if message.blank?
    
    if @error_messages.empty?
      # send message
      SupportMailer.contact_support(from_email, message).deliver_now
      render :success
    else
      # show errors
      render :new
    end
  end
end
