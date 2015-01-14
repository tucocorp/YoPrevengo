class CreateWorkAreas < ActiveRecord::Migration
  def change
    create_table :work_areas do |t|
      t.string :name
      t.string :description
      t.integer :company_id

      t.timestamps
    end
  end
end
