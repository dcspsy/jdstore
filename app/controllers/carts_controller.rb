class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warming]= "done"
    redirect_to carts_path
  end

end
