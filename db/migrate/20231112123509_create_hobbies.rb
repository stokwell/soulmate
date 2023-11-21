class CreateHobbies < ActiveRecord::Migration[7.1]
  def change
    create_table :hobbies do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
