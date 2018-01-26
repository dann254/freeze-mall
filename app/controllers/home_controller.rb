class HomeController < ApplicationController
  def home
    if user_signed_in? and current_user.role=='merchant'
      redirect_to m_dashboard_path
    elsif user_signed_in? and current_user.role=='buyer'
      redirect_to dashboard_path
    else

    end
  end
end
