class CreateEvaluationCriteries < ActiveRecord::Migration
  def change
    create_table :evaluation_criteries do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.integer :criteria_type_id
      t.integer :company_id

      t.timestamps
    end
  end
end
