class MainController < ApplicationController
	# srespond_to :js, :json, :html
  	before_filter :authorize
    
  	def question
  		render 'question'
  	end

	def encrypt
    @msgs = User.find(session[:user_id]).message
		render 'index'
	end

	def ceaser_encrypt

		@alphabet = [*'A'..'Z',*'a'..'z',*' '..'?', *"\n"].to_a.join
  	@chars = @alphabet.chars.to_a
    
		@string = params["string"]
		@shift = params["offset"].to_i 
		
		@encrypter = Hash[@chars.zip(@chars.rotate(@shift))]
		if request.xhr?
        render :json => {
                            :encrypted => @encrypter.values_at(*@string.chars)
                        }
     	end
	end


  def save_message
    if request.xhr?
      params[:user_id] = session[:user_id]
      #Wanted to save the lookup time in the user table for the id since i alrdy have it cached.
      #either way no big gain, given the size of this project but worth noting.
      @msg = Message.new(message_params)
      if @msg.save
        render :json => {
                              :notice => "Message Saved!",
                              :id => @msg.id
                          }
      else
        render :json => {
                              :notice => "Failed To Save!"
                          }
      end
    end
  end

  
  def get_message
    @msg = Message.find_by_id(get_message_params[:message_id])

    if request.xhr?
        render :json => {
                            :text => @msg.m_message,
                            :offset => @msg.m_offset
                        }
      end

  end

  private 
  def message_params
    params.permit(:m_message, :m_offset, :user_id)
  end

  def get_message_params
    params.permit(:message_id)
  end


  


end
