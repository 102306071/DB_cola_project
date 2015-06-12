class CreateColas < ActiveRecord::Migration
  def change
    create_table :colas do |t|

      t.timestamps null: false
    end
  end
end
