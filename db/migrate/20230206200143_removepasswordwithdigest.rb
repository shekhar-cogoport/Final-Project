class Removepasswordwithdigest < ActiveRecord::Migration[6.0]
  def change
    remove_column :authors, :password
    add_column :authors, :password_digest, :string
  end
end
