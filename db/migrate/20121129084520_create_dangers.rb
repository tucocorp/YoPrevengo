class CreateDangers < ActiveRecord::Migration
  def change
    create_table :dangers do |t|
      t.string :description

      t.timestamps
    end
  end
end
