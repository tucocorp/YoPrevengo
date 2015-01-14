class CreateUnitaryTasks < ActiveRecord::Migration
  def change
    create_table :unitary_tasks do |t|
      t.string :description
      t.integer :activity_id

      t.timestamps
    end
  end
end
