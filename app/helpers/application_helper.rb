module ApplicationHelper

  def project_user_full_name
    "#{@project.user.first_name} #{@project.user.last_name}"
  end

  def logged_user_full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end
end
