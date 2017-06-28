class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :create, Project
      can :create, Task
      can [:update, :destroy], Task do |task|
        task.owner == user.id
      end

      can :read, :all
    end
  end
end
