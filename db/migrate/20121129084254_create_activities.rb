class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.integer :work_flow_id
      t.integer :activity_type_id

      t.timestamps
    end
  end
end
