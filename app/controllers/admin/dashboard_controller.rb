class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  def index
    @recent_tasks = Task.includes(:user).order(created_at: :desc).limit(10)
    @tasks_count = Task.count
    @users_count = User.count
  end

  private

  def require_admin!
    redirect_to root_path, alert: "Acesso Negado" unless current_user.admin?
  end
end
