class CreateRisks < ActiveRecord::Migration[8.0]
  def change
    create_table :risks, id: :uuid do |t|
      t.string :level

      t.timestamps
    end
  end
end
