class ProductsController < ApplicationController
  layout 'merchant_dash'
  before_action :is_merchant?, :shop_profile?, :authenticate_user!
  before_action :current_user?, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.where(:shop_id => current_user.shop.id)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.shop_id = current_user.shop.id
    if @product.save
      redirect_to(products_path, {:flash => { :notice => "Product successfully added" }})
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category, :price, :quantity, :avatar)
    end

    private def is_merchant?
      redirect_to root_path unless current_user.role == "merchant"
    end
    private def current_user?
      @product = Product.find(params[:id])
      redirect_to products_path unless current_user.shop.id == @product.shop_id
    end

    def shop_profile?
      redirect_to(new_shop_path, {:flash => { :notice => "Complete your shop profile to continue" }}) unless current_user.shop_profile == true
    end
end
