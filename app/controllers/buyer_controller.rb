class BuyerController < ApplicationController
  layout 'buyer_dash'
  before_action :authenticate_user!, :is_buyer?
  def dashboard

  end

  private def is_buyer?
    redirect_to root_path unless current_user.role == "buyer"
  end
end
