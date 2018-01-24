class MerchantController < ApplicationController
  layout 'merchant_dash'
  before_action :authenticate_user!, :is_merchant?
  def dashboard

  end

  # def new
  #
  # end
  #
  # def shop_profile?
  #   redirect_to new unless current_user.profile == true
  # end

  private def is_merchant?
    redirect_to root_path unless current_user.role == "merchant"
  end
end
