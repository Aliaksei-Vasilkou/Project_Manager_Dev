module ProjectsHelper

  def total_user_count
    User.all.count
  end

end
