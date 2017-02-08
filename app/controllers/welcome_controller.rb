class WelcomeController < ApplicationController
  def index
    flash[:notice] = "hi"

  end
end
