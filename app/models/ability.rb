class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.role? :admin
        can :manage, :all
      else
        can :read, :all
    end

  if user.role? :instructor
        can :update, Instructor do |instructor|  
          instructor.id == user.instructor_id
        end
        can :destroy, Instructor do |instructor|  
          instructor.id == instructor.instructor_id
        end
    end
end
end