class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :rental_site
      t.integer :unit_id
      t.decimal :price, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.integer :nights
      t.date :check_in
      t.date :check_out
      t.integer :adults
      t.integer :children
      t.integer :pets

      t.timestamps
    end
  end
end
