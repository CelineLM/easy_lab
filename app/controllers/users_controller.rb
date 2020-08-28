class UsersController < ApplicationController
  def show
    @checkup = Checkup.new
  end
end
