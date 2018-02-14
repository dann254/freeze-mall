class BuyerController < ApplicationController
  layout 'buyer_dash'
  before_action :authenticate_user!, :is_buyer?
  def dashboard
    @products = Product.all
  end

  # GET /products/1.json
  def show_product
    @product = Product.find(params[:id])
  end

  private def is_buyer?
    redirect_to root_path unless current_user.role == "buyer"
  end
end
