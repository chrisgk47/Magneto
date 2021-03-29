class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :location
      t.string :url

      t.timestamps
    end
  end
end
