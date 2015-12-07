class AddImageTools < ActiveRecord::Migration
  def self.up
    add_attachment :tools, :image
  end

  def self.down
    remove_attachment :tools, :image
  end
end


