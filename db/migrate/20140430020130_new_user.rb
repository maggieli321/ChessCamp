class NewUser < ActiveRecord::Migration

  def up
    admin = User.new
    admin.username = "admin@example.com"
    admin.password = "secret"
    admin.password_confirmation = "secret"
    admin.role = "admin"
    admin.save!
end

  #   # instructor = User.new
  #   # instructor.username = "instructor@example.com"
  #   # instructor.password = "secret"
  #   # instructor.password_confirmation = "secret"
  #   # instructor.role = "instructor"
  #   # instructor.save!
  # end

  def down
    admin = User.find_by_username "admin@example.com"
    User.delete admin
    # instructor = User.find_by_username "instructor@example.com"
    # User.delete instructor
  end

end
