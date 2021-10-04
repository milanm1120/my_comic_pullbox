class CreateComicbook < ActiveRecord::Migration[5.2]
  def change
    create_table :comicbooks do |t|
      t.string :title
      t.integer :issue_number
      t.string :publisher
      t.integer :year
      t.string :writer
      t.string :artist
      t.float :cover_price
      t.text :description
    end
  end
end
