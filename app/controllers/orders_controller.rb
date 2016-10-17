class OrdersController < ApplicationController
  before_action :authenticate_user!

  # Only return orders for current user

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
    @line_items = @order.line_items
  end

end
