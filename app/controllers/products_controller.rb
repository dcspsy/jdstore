class ProductsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "success"
    else
      flash[:warning] = "你的购物车内已有此物品"
      redirect_to :back
    end

  end

  def show
    @product = Product.find(params[:id])

  end

  def index
    @products =Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product =Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product =Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end


  private
  def product_params
    params.require(:product).permit(:title,:description,:quantity,:price,:image)
  end
end
