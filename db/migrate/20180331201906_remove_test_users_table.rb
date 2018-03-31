class RemoveTestUsersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:test_users)
  end
end
