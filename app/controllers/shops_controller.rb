class ShopsController < ApplicationController
  layout 'merchant_dash'

  before_action :authenticate_user!, :is_merchant?
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  before_action :has_shop?, only: [:new]
  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
      if @shop.save
        @user = User.find(current_user.id)
        @user.update(shop_profile: true)
        redirect_to(m_dashboard_path, {:flash => { :notice => "Shop successfully created" }})
      else
        render :new
      end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop, notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(:name, :description, :country, :city, :payment, :account)
    end

    def is_merchant?
      redirect_to root_path unless current_user.role == "merchant"
    end

    def has_shop?
      redirect_to m_dashboard_path if current_user.shop_profile
    end
end
