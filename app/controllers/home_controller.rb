class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    flash[:notice] = "Thanks for registering!"
  end
end
