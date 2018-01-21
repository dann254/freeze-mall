class MerchantController < ApplicationController
  before_action :authenticate_user!, :is_merchant?
  def dashboard

  end
  private def is_merchant?
    redirect_to root_path unless current_user.role == "merchant"
  end
end
