class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :position
      t.string :employment_type
      t.string :company
      t.string :location
      

      t.timestamps
    end
  end
end
