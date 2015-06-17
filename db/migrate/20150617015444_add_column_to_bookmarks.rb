class AddColumnToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :slug, :string, unique: true
  end
end
