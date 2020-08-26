class CheckupsController < ApplicationController
  def index
    @checkups = Checkup.where(user: current_user)
  end

  def new
  end

  def create
  end

  def show
    @checkup = Checkup.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
