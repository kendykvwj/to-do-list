class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def after_sign_in_path_for(resource)
    new_task_path
  end
end
