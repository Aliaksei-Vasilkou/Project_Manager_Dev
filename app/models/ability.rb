class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :destroy, Task do |task|
        task.owner == user.id
      end
      can :update, Task do |task|
        task.owner == user.id
      end
      can :read, :all
    end
  end
end
