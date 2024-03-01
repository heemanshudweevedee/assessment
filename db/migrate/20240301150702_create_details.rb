class CreateDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :details do |t|
      t.integer :person_id
      t.integer :age
      t.string :title
      t.string :phone
      t.string :email
      t.timestamps
    end
  end
end
