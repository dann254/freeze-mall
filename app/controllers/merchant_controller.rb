class MerchantController < ApplicationController
  layout 'merchant_dash'
  before_action :authenticate_user!, :is_merchant?, :shop_profile?
  def dashboard

  end

  def shop_profile?
    redirect_to(new_shop_path, {:flash => { :notice => "Complete your shop profile to continue" }}) unless current_user.shop_profile == true
  end

  private def is_merchant?
    redirect_to root_path unless current_user.role == "merchant"
  end
end
