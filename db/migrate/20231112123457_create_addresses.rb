class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :city

      t.timestamps
    end
  end
end
