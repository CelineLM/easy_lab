class CheckupsController < ApplicationController
  def index
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
