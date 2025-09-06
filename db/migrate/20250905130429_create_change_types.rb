class CreateChangeTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :change_types, id: :uuid do |t|
      t.string :change_type

      t.timestamps
    end
  end
end
