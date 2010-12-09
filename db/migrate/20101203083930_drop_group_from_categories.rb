class DropGroupFromCategories < ActiveRecord::Migration
  def self.up
    remove_column :categories, :group
  end

  def self.down
  end
end
