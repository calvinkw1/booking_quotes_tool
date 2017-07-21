class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.string :inquirer_name
      t.string :inquirer_email
      t.string :inquirer_phone
      t.date :check_in
      t.date :check_out
      t.integer :nights
      t.decimal :price, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.integer :unit_id
      t.integer :adults
      t.integer :children
      t.integer :pets
      t.string :rental_site

      t.timestamps
    end
  end
end
