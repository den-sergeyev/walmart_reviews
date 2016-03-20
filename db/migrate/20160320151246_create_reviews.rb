class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.text :text

      t.timestamps null: false
    end
  end
end
