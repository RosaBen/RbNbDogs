class CreateStrolls < ActiveRecord::Migration[8.0]
  def change
    create_table :strolls do |t|
      t.references :dog, index: true
      t.references :dog_sitter, index: true
      t.timestamps
    end
    add_index :strolls, [ :dog_id, :dog_sitter_id ], unique: true
  end
end
