class Removeforeignkey < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :category_id
  end
end
