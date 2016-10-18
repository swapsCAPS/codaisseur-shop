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

  def new
    # Make a new order inside current user
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(orders_params)

	if @order.save
	  line_item_params.each do |li|
		@order.line_items.create(line_item: li)
	  end

	  redirect_to order_path(@order), notice: "Order created"
	else
	  # render :new
	end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :price, line_items_ids: [])
    end

    def line_items_params
      params[:line_items].present? ? params.require(:line_items) : []
    end
end
