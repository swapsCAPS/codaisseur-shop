class ProductsController < ApplicationController
  # Set product for this instance, results in DRY code.
  before_action :set_product, only: [:show, :edit, :update]
  # Check if user is logged in for all actions except show
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Get all products from the model
    if params[:search]
      @products = Product.search(params[:search]).order_by_price
    else
      @products = Product.all.order_by_price
    end
  end

  def show
    # If an image exists display it, otherwise, use a placeholder
    @photo_main = @product.photos ? @product.photos[0] : @product.image
    # Expose the seller to the view. Render email if the user does not have a profile yet
    @seller = @product.user.profile ? @product.user.profile.full_name : @product.user.email
    # If the user who posted this product is the same as the current user, he/she may edit
    @can_edit = @product.user == current_user
    @photos = @product.photos
    # get the product_id from the params
  end

  def new
    # Make a new product inside current user
    @product = current_user.products.build
  end

  def edit
    # Check if this user owns this product
    if current_user.id == @product.user.id
	      @photos = @product.photos
    else
      redirect_to root_path, notice: "What do you think you are doing?"
    end
  end

  def create

    @product = current_user.products.build(product_params)

    image_params.each do |image|
      @photo = Photo.new(image: image)
      @product.photos << @photo
    end


	if @product.save
	  redirect_to product_path(@product), notice: "Product added"
	else
	  render :new
	end
  end

  def update
	if @product.update(product_params)
	  image_params.each do |image|
      debugger
		  @product.photos.create(image: image)
	  end

	  redirect_to product_path(@product), notice: "Product added"
	else
	  render :edit
	end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id == @product.user.id
      @product.destroy
      redirect_to products_path, notice: "Teh product is gawn!"
    else
      redirect_to product_path, alert: "What do you think you are doing?"
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
