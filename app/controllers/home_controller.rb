class HomeController < ApplicationController
  def index
   @contact = Home.new(params[:home])
  end

  def create
    @contact = Home.new(params[:home])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Home.new
        format.html { render 'checkups'}
        format.js   { flash.now[:success] = @message = "Nous vous remercions pour votre message et revenons vers vous dès que possible" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Le message n'a pas été envoyé." }
      end
    end
  end
end
