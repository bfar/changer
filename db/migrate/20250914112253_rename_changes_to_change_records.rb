class RenameChangesToChangeRecords < ActiveRecord::Migration[8.0]
  def change
    rename_table :changes, :change_records
  end
end
