class CreateLoads < ActiveRecord::Migration[6.0]
  def change
    create_table :loads do |t|
      t.boolean :washed
      t.boolean :done
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
