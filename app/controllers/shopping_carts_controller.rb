class ShoppingCartsController < ApplicationController

  def new
    product = Product.find(params[:product_id])
    amount = params[:amount]
    session[:shopping_cart] = {}
    session[:shopping_cart][:products] = []
    session[:shopping_cart][:amounts] = []
    session[:shopping_cart][:products] << product
    session[:shopping_cart][:amounts] << amount
    redirect_to product_path(product), notice: "Product successfully added to the Shopping cart"
  end

  def edit
    product = Product.find(params[:product_id])
    amount = params[:amount]
    session[:shopping_cart][:products.to_s] << product
    session[:shopping_cart][:amounts.to_s] << amount
    redirect_to product_path(product), notice: "Product successfully added to the Shopping cart"
  end

end
