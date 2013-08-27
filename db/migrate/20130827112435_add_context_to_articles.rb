class AddContextToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content, :text
    remove_column :articles, :context
  end
end
