class AddTestUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table "test_users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.jsonb "data"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["data"], name: "index_test_users_on_data", using: :gin
      t.index ["email"], name: "index_test_users_on_email", unique: true
    end
  end
end
