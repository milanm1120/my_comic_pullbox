class AddUserIdToComicbook < ActiveRecord::Migration[5.2]
  def change
    add_column :comicbooks, :user_id, :integer      # :table_name, :new_column_name, :data_type
  end
end
