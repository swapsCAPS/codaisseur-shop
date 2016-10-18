class LineItemController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  # get current user
  # get current users order
  # accept new line_item
  # accept edit line_item
  # accept delete line_item
  def new
    @line_item = current_user.order.line_item.build
  end

  def edit
    if current_user.id == @order.user.id
      @line_item = LineItem.find(params[:id])
      # so stuff
    else
      redirect_to root_path, notice: "What do you think you are doing?"
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to orders_path(@order), notice: "Item deleted"
  end

  private
    # Set the current order
    def set_order
      # @order = current_user.order ?
      # @order = current_user.build ?
    end
end
