class CreateDogs < ActiveRecord::Migration[8.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.belongs_to :city, index: true
      t.timestamps
    end
    add_index :dogs, :name, unique: true
  end
end
