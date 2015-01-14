class AddVariableToRiskMatrix < ActiveRecord::Migration
  def change
    add_column :risk_matrices, :resposable, :string

    add_column :risk_matrices, :generate, :boolean

  end
end
