class CreateWorkFlows < ActiveRecord::Migration
  def change
    create_table :work_flows do |t|
      t.string :name
      t.string :description
      t.integer :work_area_id

      t.timestamps
    end
  end
end
