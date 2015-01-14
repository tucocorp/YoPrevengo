class CreateMatrixHeaders < ActiveRecord::Migration
  def change
    create_table :matrix_headers do |t|
      t.integer :unitary_task_id

      t.timestamps
    end
  end
end
