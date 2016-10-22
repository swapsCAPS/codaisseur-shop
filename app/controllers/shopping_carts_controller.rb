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
    session[:shopping_cart] = {params[:id] => params[:amount].to_i}
    debugger
    redirect_to shopping_carts_path, notice: "Product successfully added to the Shopping cart"
  end

  def update
    product_id = params[:id] # getting id of the product
    amount = params[:amount].to_i #getting amount of the product
    # checking if the shopping_cart has been already initialized
    if session[:shopping_cart].nil?
       session[:shopping_cart] = {} # if not setting it's value as an empty hash
    end
    if session[:shopping_cart][product_id] # if the product already exit in the shopping cart

      item = session[:shopping_cart]
      session[:shopping_cart] = item.slice!(product_id) # extraxt that product into item and putting the rest into the session
      item[product_id] = item[product_id] + amount #increasing the amount of that product
      session[:shopping_cart].merge!(item) #inserting the product as last one to be hilighted

      # respond to the ajax call
      respond_to do |format|
        format.html {redirect_to product_id, notice: "Product added to the shopping cart"}
        format.json  { head :no_content}
      end
    else
      session[:shopping_cart].merge!({product_id => amount}) # if the product is not already in the shopping cart add it
      @new_product = Product.find(product_id)
      respond_to do |format|
        format.html {redirect_to product_id, notice: "Product added to the shopping cart"}
        format.json  { render json: @new_product, status: :ok, location: @new_product }
      end
    end


  end

  def destroy
    if session[:shopping_cart]
      if params[:id] && params[:id].to_i != 0
        product_id = params[:id]
        session[:shopping_cart].except!(product_id)

        # AJAX
        respond_to do |format|
          format.html {redirect_to shopping_carts_url, notice: "Shopping cart is now empty"}
          format.json  { render json: product_id, status: :ok, location: shopping_carts_url }
        end
      else
        session[:shopping_cart] = {}
        # AJAX
        respond_to do |format|
          format.html {redirect_to shopping_carts_url, notice: "Shopping cart is now empty"}
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
