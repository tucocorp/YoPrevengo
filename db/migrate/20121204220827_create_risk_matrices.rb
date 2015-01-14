class CreateRiskMatrices < ActiveRecord::Migration
  def change
    create_table :risk_matrices do |t|
      t.string :personal_cause
      t.string :work_cause
      t.integer :consequence
      t.integer :probability
      t.integer :magnitude
      t.integer :risk_id
      t.integer :unitary_task_id

      t.timestamps
    end
  end
end
