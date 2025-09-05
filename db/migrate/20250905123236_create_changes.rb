class CreateChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :changes, id: :uuid do |t|
      t.string :name
      t.text :description
      t.text :business_justification
      t.text :implmentation_plan
      t.text :risks
      t.text :test_plan
      t.text :rollback_plan

      t.timestamps
    end
  end
end
