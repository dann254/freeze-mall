class MerchantController < ApplicationController
  layout 'merchant_dash'
  before_action :authenticate_user!, :is_merchant?
  def dashboard

  end
  private def is_merchant?
    redirect_to root_path unless current_user.role == "merchant"
  end
end
