class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @image = @product.image ? product.image : "http://placehold.it/150x150"
  end

  def new
    # TODO set to current_user.products.build when User is ready
    # Check if current user is a seller
    @product = current_user.products.build
  end

  def edit
    if current_user.id == @product.user.id
    # @photos = @product.photos
    else
    # redirect_to root_path, notice: "What do you think you are doing?"
    end
  end

  def create
    # TODO set to current_user.products.build when User is ready
    @product = current_user.products.build(product_params)

	if @product.save
	  image_params.each do |image|
		@product.photos.create(image: image)
	  end

	  redirect_to edit_product_path(@product), notice: "Product added"
	else
	  render :new
	end
  end

  def update
	if @product.update(product_params)
	  image_params.each do |image|
		@product.photos.create(image: image)
	  end

	  redirect_to edit_product_path(@product), notice: "Product added"
	else
	  render :edit
	end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:user_id, :name, :description, :price, category_ids: [])
    end

    def image_params
      params[:images].present? ? params.require(:images) : []
    end
end
