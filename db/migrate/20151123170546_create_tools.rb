class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|

      t.string :name,              null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :quantity
      t.timestamps null: false

    end
  end
end
