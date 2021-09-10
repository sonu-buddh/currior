class AddEmailToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :sender_email, :string
    add_column :orders, :receiver_email, :string
  end
end
