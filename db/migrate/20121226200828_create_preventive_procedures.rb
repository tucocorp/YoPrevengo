class CreatePreventiveProcedures < ActiveRecord::Migration
  def change
    create_table :preventive_procedures do |t|
      t.string :monitoring_time
      t.integer :control_amount
      t.string :control_responsable
      t.string :control_measure
      t.integer :risk_matrix_id

      t.timestamps
    end
  end
end
