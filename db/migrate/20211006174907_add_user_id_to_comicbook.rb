class AddUserIdToComicbook < ActiveRecord::Migration[5.2]
  def change
    add_column :comicbooks, :user_id, :integer
  end
end
