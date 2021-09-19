class Order < ApplicationRecord
	validates :weight, numericality: true
	validates :currior_number, uniqueness: true, on: :create
	validates :receiver_pincode, :sender_pincode, length: { is: 6 }
	validates :sender_mobile, :receiver_mobile, numericality: { only_integer: true }
	validates :sender_name, :sender_address,:sender_mobile, :receiver_mobile, :receiver_name, :receiver_address, :type_of_service, :cost_of_service, presence: true
	
	before_create :generate_currior_number

	# Search by order ID
	def self.search(currior_number)
		if currior_number
			self.find_by(currior_number: currior_number)
		end
	end

	# It will update Uniq ID for order
	def generate_currior_number
		self.currior_number = "CUR-#{generate_id}"
	end

	# if need different mail sent to seperate than i do other machanism
	def self.send_order_create_email(emails)
		consignment_number = emails[:currior_number]
		emails.each do |email|
			if email[0] == "sender_email"
				OrderCreateMailer.send_order_email_to_sender(email[1], consignment_number).deliver_now
			else
				OrderCreateMailer.send_order_email_to_receiver(email[1], consignment_number).deliver_now
			end
				
		end
	end

	private

	def generate_id
		(Time.now.to_f * 1000).to_i
	end

end
