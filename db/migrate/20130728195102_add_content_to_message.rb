class AddContentToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :content, :text
  end

  def self.down
    remove_column :messages, :content
  end
end