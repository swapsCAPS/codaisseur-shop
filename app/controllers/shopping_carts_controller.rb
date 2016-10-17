class ShoppingCartsController < ApplicationController

  def index
    if session[:shopping_cart]
      @shopping_cart = session[:shopping_cart]
    else
      @shopping_cart = {}
    end
  end

  def new
    session[:shopping_cart] = {params[:product_id].to_s => params[:amount].to_i}
    redirect_to shopping_carts_path, notice: "Product successfully added to the Shopping cart"
  end

  def edit
    session[:shopping_cart].merge!({params[:product_id].to_s => params[:amount].to_i}) {|key, v1, v2| v1 + v2}
    redirect_to shopping_carts_path, notice: "Product successfully added to the Shopping cart"
  end

  def destroy
    if session[:shopping_cart]
      session[:shopping_cart] = {}
      redirect_to shopping_carts_path
    end
  end
end
