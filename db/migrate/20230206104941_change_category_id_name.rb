class ChangeCategoryIdName < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :categoryid
  end
end
