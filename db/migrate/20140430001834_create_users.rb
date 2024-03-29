class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :role, default: "instructor"
      t.integer :instructor_id
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end