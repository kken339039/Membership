class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def up
    create_table(:roles) do |t|
      t.string :name

      t.timestamps
    end

    create_table(:user_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end
  end

  def down
    drop_table :roles
    drop_table :user_roles
  end
end
