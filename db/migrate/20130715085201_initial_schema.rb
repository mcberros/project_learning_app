class InitialSchema < ActiveRecord::Migration
  def up
    create_table :projects, force:  true do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    
    create_table :stories, force:  true do |t|
      t.integer :project_id
      t.string :name
      t.string :description
      t.timestamps
    end
    
    create_table :tasks, force:  true do |t|
      t.integer :story_id
      t.string :name
      t.string :description
      t.timestamps
    end
  end
 
  def down
    [:projects, :stories, :tasks].each {|table| drop_table(table) }
  end
end
