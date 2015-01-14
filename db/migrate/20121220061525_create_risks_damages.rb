class CreateRisksDamages < ActiveRecord::Migration
  def change
    create_table :risks_damages, :id => false do |t|
      t.integer :risk_id
      t.integer :damage_id

      t.timestamps
    end
  end
end
