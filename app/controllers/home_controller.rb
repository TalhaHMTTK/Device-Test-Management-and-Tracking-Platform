class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @recent_tests = Test.where(
      'created_at BETWEEN ? AND ?', 
      DateTime.now.beginning_of_month - 1.month, 
      DateTime.now
    ).limit(4)
    @completed_tests = Test.where(
      'created_at BETWEEN ? AND ? AND status = ?', 
      DateTime.now.beginning_of_month - 12.month, 
      DateTime.now, 
      2
    ).limit(3)
  end
end
