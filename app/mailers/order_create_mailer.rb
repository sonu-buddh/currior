class OrderCreateMailer < ApplicationMailer
    default :from => 'currior@example.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_order_email_to_sender(email, consignment_number)
      @email = email
      @consignment_number = consignment_number
      mail( :to => @email,
      :subject => 'Thanks for send order email to sender' )
    end

    def send_order_email_to_receiver(email, consignment_number)
      @email = email
      @consignment_number = consignment_number
      mail( :to => @email,
      :subject => 'Thanks for send order email to receiver' )
    end
end
