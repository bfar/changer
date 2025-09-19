class RecreateChangeRecords < ActiveRecord::Migration[8.0]
  def change
    # Drop referenced foreign keys first to avoid errors
    remove_foreign_key :risks, :change_records, if_exists: true
    remove_foreign_key :change_types, :change_records, if_exists: true

    drop_table :change_records, if_exists: true

    create_table :change_records do |t|
      # Rails automatically gives us a bigint autoincrement PK called `id`

      t.virtual :code, type: :string, as: "'chg-' || id", stored: true
      t.string :name
      t.text :description
      t.text :business_justification
      t.text :implmentation_plan
      t.text :risks
      t.text :test_plan
      t.text :rollback_plan

      # ✅ use t.references here
      t.references :risk, null: false, foreign_key: true, type: :uuid
      t.references :change_type, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
