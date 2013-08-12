class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :twitter_name, :string
    add_column :users, :github_name, :string
    add_column :users, :url, :string
    add_column :users, :avatar_image_name, :string
    add_column :users, :bio, :text
  end
end
