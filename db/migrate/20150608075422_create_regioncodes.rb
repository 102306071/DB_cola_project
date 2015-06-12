class CreateRegioncodes < ActiveRecord::Migration
  def change
    create_table :regioncodes do |t|

      t.timestamps null: false
    end
  end
end
