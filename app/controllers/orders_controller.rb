class OrdersController < ApplicationController

  # Only return orders for current user

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

end
