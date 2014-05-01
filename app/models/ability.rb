class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

    if user.role? :admin
        can :manage, :all

    elsif user.role? :instructor
        can :update, Instructor do |instructor|  
          instructor.id == user.instructor_id
        end
        # can :create, User do |u|  
        #   u.id == user.id
        # end
        can :read, Student do |s|  
          campstu_ids = user.instructor.camps.map{|c| c.students.map{|i| i.id}}.flatten
          campstu_ids.include?(s.id)
        end
        can :update, User do |u|  
          u.id == user.id
        end
        can :edit, Instructor do |instructor|  
          instructor.id == user.instructor_id
        end
        can :edit, User do |u|  
          u.id == user.id
        end
      else
        can :read, :all
    end

  end
end
