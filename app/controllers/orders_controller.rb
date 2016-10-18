class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_from_session, only: [:new, :create]

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    @line_items = @order.line_items
  end

  def new
  end

  def create
    if @order.save
      # Order is made, empty the shopping cart
      session[:shopping_cart] = {}
      redirect_to order_path(@order), notice: "Your items have been ordered"
    else
      redirect_to new_order_path, alert: "There was an error ordering your items"
    end
  end

  private
    def set_order_from_session
      @shopping_cart = session[:shopping_cart]
      @order = current_user.orders.build
      @shopping_cart.each do |product_id, amount|
	@order.line_items.build(product_id: product_id, amount: amount)
      end
    end

    def order_params
      params.require(:order).permit(:user_id, line_item_ids: [])
    end

    def line_items_params
      params[:line_items].present? ? params.require(:line_items): []
    end
end
