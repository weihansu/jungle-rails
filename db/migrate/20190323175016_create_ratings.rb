class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :description
      t.integer :rating
      t.string :created_at
      t.string :updated_at
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
