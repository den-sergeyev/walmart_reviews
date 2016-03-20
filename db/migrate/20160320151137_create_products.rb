class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :external_id

      t.timestamps null: false
    end
  end
end
