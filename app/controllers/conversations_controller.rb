class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :create]

  # GET /conversations
  # GET /conversations.json
  def index
    @listing = Listing.find(params[:listing])
    if current_user == @listing.host
      @conversations = Conversation.where(listing_id: params[:listing])
    else
      @conversations = Conversation.where(user: current_user).where(listing_id: params[:listing])
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    #@current_user = current_user
    #@messages = Message.where(conversation: @conversation).order(:created_at)
  end

  # GET /conversations/new
  def new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @listing = Listing.find(params[:listing])
    if current_user == @listing.host
      # I am a lister so choose a conversation with user from list
      redirect_to(conversations_path(listing: @listing)) && return
    else
      # I am a customer looking to book
      @conv = Conversation.where(listing: @listing).where(user: current_user)
    end
    
    if @conv.first.present?
      # I have a conversation with host already
      redirect_to(messages_path(conversation_id: @conv.first.id)) && return
    end
    
    @conversation = Conversation.new(user: current_user, listing: @listing)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to messages_path(conversation_id: @conversation.id),
                                  notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:user_id, :listing)
    end
end
