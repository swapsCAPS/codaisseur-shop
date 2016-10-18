class LineItemController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order

  # get current user
  # get current users order
  # accept new line_item
  # accept edit line_item
  # accept delete line_item

  private

    # Set the current order
    def set_order
      # @order = current_user.order ?
      # @order = current_user.build ?
    end
end
