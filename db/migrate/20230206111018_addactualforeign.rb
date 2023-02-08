class Addactualforeign < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :articles, :categories
  end
end
