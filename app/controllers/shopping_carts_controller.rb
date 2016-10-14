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
    product = Product.find(params[:id])

    amount = params[:amount]
    res = session[:shopping_cart][:products.to_s].select{|p| p[:id] == product[:id]}
    if  res != []

      session[:shopping_cart][:products.to_s].each_with_index do |p, i|
        if p[:name] == product[:name]
          session[:shopping_cart][:amounts.to_s][i] += amount
        end
      end
    else
      session[:shopping_cart][:products.to_s] << product
      session[:shopping_cart][:amounts.to_s] << amount
    end
    redirect_to product_path(product), notice: "Product successfully added to the Shopping cart"
  end

  def show
    @shopping_cart = {products: session[:shopping_cart][:products.to_s], amounts: session[:shopping_cart][:amounts.to_s]}
  end
end
