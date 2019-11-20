class CreatePickUps < ActiveRecord::Migration[6.0]
  def change
    create_table :pick_ups do |t|
      t.belongs_to :load, null: false, foreign_key: true
      t.belongs_to :courier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
