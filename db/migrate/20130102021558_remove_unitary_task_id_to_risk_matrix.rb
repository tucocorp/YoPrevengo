class RemoveUnitaryTaskIdToRiskMatrix < ActiveRecord::Migration
  def up
    remove_column :risk_matrices, :unitary_task_id
      end

  def down
    add_column :risk_matrices, :unitary_task_id, :integer
  end
end
