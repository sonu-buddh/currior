class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :sender_name
      t.text :sender_address
      t.string :sender_mobile
      t.integer :sender_pincode
      t.string :receiver_name
      t.text :receiver_address
      t.string :receiver_mobile
      t.integer :receiver_pincode
      t.float :weight
      t.string :type_of_service
      t.float :cost_of_service
      t.string :payment_mode
      t.string :assm_state
      t.string :curior_number

      t.timestamps
    end
  end
end
