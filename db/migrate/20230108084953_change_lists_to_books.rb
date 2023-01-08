class ChangeListsToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_table :lists, :books
  end
end
