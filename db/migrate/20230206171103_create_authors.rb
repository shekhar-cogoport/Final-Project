class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
          t.string :name
          t.string :decription
          t.string :email
          t.string :password
        t.timestamps
    end
  end
end
