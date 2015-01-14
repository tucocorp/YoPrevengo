class CreateDamages < ActiveRecord::Migration
  def change
    create_table :damages do |t|
      t.string :description

      t.timestamps
    end
  end
end
