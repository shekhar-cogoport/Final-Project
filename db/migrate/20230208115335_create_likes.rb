class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :author_id
      t.string  :article_id
      t.timestamps
    end
  end
end
