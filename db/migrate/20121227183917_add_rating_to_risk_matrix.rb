class AddRatingToRiskMatrix < ActiveRecord::Migration
  def change
    add_column :risk_matrices, :rating, :string

  end
end
