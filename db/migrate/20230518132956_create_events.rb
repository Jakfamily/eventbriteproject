class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_datetime
      t.integer :duration
      t.string :location
      t.text :description
      t.integer :price
      t.references :admin, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
