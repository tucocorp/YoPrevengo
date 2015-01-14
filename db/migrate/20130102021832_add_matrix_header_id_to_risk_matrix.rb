class AddMatrixHeaderIdToRiskMatrix < ActiveRecord::Migration
  def change
    add_column :risk_matrices, :matrix_header_id, :integer

  end
end
