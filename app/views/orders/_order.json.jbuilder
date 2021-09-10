json.extract! order, :id, :sender_name, :sender_address, :sender_mobile, :sender_pincode, :receiver_name, :receiver_address, :receiver_mobile, :receiver_pincode, :weight, :type_of_service, :cost_of_service, :payment_mode, :assm_state, :curior_number, :created_at, :updated_at
json.url order_url(order, format: :json)
