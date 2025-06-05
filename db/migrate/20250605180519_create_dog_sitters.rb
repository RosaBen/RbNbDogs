class CreateDogSitters < ActiveRecord::Migration[8.0]
  def change
    create_table :dog_sitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
