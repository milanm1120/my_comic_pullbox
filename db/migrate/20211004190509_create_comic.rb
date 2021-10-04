class CreateComic < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.integer :issue_number
      t.string :publisher
      t.string :writer
      t.string :artist
      t.float :cover_price
    end
  end
end
