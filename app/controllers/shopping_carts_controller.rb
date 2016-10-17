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
    if session[:shopping_cart][params[:product_id].to_s]

      item = session[:shopping_cart]
      session[:shopping_cart] = item.slice!(params[:product_id].to_s)
      item[params[:product_id].to_s] = item[params[:product_id].to_s] + params[:amount].to_i
      session[:shopping_cart].merge!(item)
    else
      session[:shopping_cart].merge!({params[:product_id].to_s => params[:amount].to_i})
    end
    redirect_to shopping_carts_path, notice: "Product successfully added to the Shopping cart"
  end

  def destroy
    if session[:shopping_cart]
      session[:shopping_cart] = {}
      redirect_to shopping_carts_path
    end
  end
end
