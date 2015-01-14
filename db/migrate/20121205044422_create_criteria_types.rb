class CreateCriteriaTypes < ActiveRecord::Migration
  def change
    create_table :criteria_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
