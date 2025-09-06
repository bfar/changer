class AddChangeTypeRefToChanges < ActiveRecord::Migration[8.0]
  def change
    add_reference :changes, :change_type, type: :uuid, null: false, foreign_key: true
  end
end
