class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :author_id
      t.string  :article_id
      t.timestamps
    end
  end
end
