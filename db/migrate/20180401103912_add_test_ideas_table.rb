class AddTestIdeasTable < ActiveRecord::Migration[5.1]
  def change
    create_table "test_users", force: :cascade do |t|
      t.string "title"
      t.string "body"
      t.string "author"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
