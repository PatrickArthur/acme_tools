class CreateToolType < ActiveRecord::Migration
  def change
    create_table :tool_types do |t|
      t.string :tool_type,              null: false, default: ""
    end
  end
end
