class AddPasswordConfirmationDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_confirmation_digest, :string
  end
end
