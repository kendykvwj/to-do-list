class ApplicationController < ActionController::Base
  include Pundit::Authorization
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      tasks_path
    end
  end
end
