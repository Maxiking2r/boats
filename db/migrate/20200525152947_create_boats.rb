class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :city
      t.string :description
      t.string :category
      t.integer :number_of_people
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
