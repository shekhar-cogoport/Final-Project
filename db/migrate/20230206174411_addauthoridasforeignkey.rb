class Addauthoridasforeignkey < ActiveRecord::Migration[6.0]
  def change
     add_column :articles, :author_id, :string
     add_foreign_key :articles, :authors
  end
end
