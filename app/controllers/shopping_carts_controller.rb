class ShoppingCartsController < ApplicationController

  def increment
    # Key in the shopping cart hash to increment
    product_id = params[:product_id]
    # The current amount
    cur_amount = session[:shopping_cart][product_id.to_s]
    # Increment current amount by 1
    new_amount = cur_amount + 1
    # Save it back into the shopping_cart
    session[:shopping_cart][product_id.to_s] = new_amount
    redirect_to shopping_carts_path
  end

  def decrement
    # Key in the shopping cart hash to increment
    product_id = params[:product_id]
    # The current amount
    cur_amount = session[:shopping_cart][product_id.to_s]
    # Only lower the amount if > 1
    if cur_amount > 1
      # Decrement current amount by 1
      new_amount = cur_amount - 1
      # Save it back into the shopping_cart
      session[:shopping_cart][product_id.to_s] = new_amount
    end
    redirect_to shopping_carts_path
  end

  def index
    if session[:shopping_cart]
      @shopping_cart = session[:shopping_cart]
      @total_price = get_total
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
    redirect_to shopping_carts_path, notice: "Product successfully added to the shopping cart"
  end

  def destroy
    if session[:shopping_cart]
      if params[:id] && params[:id].to_i != 0
        session[:shopping_cart].except!(params[:id])

        # AJAX
        respond_to do |format|
          format.html {redirect_to shopping_carts_path, notice: "Shopping cart is now empty"}
          format.json  { head session[:shopping_cart] }
        end
      else
        session[:shopping_cart] = {}
        # AJAX
        respond_to do |format|
          format.html {redirect_to shopping_carts_path, notice: "Shopping cart is now empty"}
          format.json  { head :no_content }
        end
      end
    end
  end

  private
    def get_total
      total = 0
      session[:shopping_cart].each do |product_id, amount|
        total = total + (Product.find(product_id).price * amount)
      end
      total
    end

end
