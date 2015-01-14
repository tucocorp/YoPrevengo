class AddDangerIdToRisk < ActiveRecord::Migration
  def change
    add_column :risks, :danger_id, :integer

  end
end
