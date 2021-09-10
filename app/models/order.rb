class Order < ApplicationRecord
    before_create :generate_curior_number

    # Search by order ID
    def self.search(curior_number)
        if curior_number
            self.find_by(curior_number: curior_number)
        end
    end
  
    # It will update Uniq ID for order
    def generate_curior_number
        self.curior_number = "CUR-#{generate_id}"
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
        SecureRandom.hex(4)
    end

end
