class AddRiskRefToChanges < ActiveRecord::Migration[8.0]
  def change
    add_reference :changes, :risk, type: :uuid, null: false, foreign_key: true
  end
end
