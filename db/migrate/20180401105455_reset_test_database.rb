class ResetTestDatabase < ActiveRecord::Migration[5.1]
  def change
    drop_table(:test_users)
    drop_table(:test_ideas)

    create_table "test_users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.jsonb "data"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["data"], name: "index_test_users_on_data", using: :gin
      t.index ["email"], name: "index_test_users_on_email", unique: true
    end

    create_table "test_ideas", force: :cascade do |t|
      t.string "title"
      t.string "body"
      t.string "author"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

  end
end
