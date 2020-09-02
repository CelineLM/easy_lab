class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
def create
    @message = Message.new message_params
if @message.valid?
      MessageMailer.contact(@message).deliver_now
      redirect_to new_message_url
      flash[:notice] = "Nous vous remercions pour votre message et vous répondrons dès que possible"
    else
      flash[:notice] = "Le message n'a pas pu être envoyé"
      render :new
    end
  end
private
def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
end
