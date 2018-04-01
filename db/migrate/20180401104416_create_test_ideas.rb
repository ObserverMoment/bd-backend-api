class CreateTestIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :test_ideas do |t|

      t.timestamps
    end
  end
end
