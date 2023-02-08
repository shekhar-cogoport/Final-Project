class Addforeigninlikesandcomment < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :authors
    add_foreign_key :likes, :articles
    add_foreign_key :comments, :articles
    add_foreign_key :comments, :authors
  end
end
