ActiveAdmin.register Order do
	actions :index, :show
	filter :curior_number
    filter :created_at

  batch_action :sent do |ids|
    batch_action_collection.find(ids).each do |order|
        order.update(aasm_state: "sent")
    end
    redirect_to admin_orders_path, alert: "The Order have been sent."
  end
  
  batch_action :in_transit do |ids|
    batch_action_collection.find(ids).each do |order|
      order.update(aasm_state: "In Transit")
    end
    redirect_to admin_orders_path, alert: "The Order have been In Transit."
  end

  batch_action :delivered do |ids|
    batch_action_collection.find(ids).each do |order|
      order.update(aasm_state: "Delivered")
    end
    redirect_to admin_orders_path, alert: "The Order have been In Delivered."
  end

  index do
    selectable_column
        column :curior_number
        column :aasm_state
        column :sender_name
        column :sender_address
        column :sender_mobile
        column :sender_pincode
        column :receiver_name
        column :receiver_address
        column :receiver_mobile
        column :receiver_pincode
        column :weight
        column :type_of_service
        column :cost_of_service
        column :payment_mode
    column :actions do |order|
      link_to "View", admin_order_path(id: order.id)
    end
  end

  action_item 'Back', only: :show do
    link_to('Back', :back)
  end

  show title: "Order Details" do
    attributes_table do
        row :curior_number
        row :sender_name
        row :sender_address
        row :sender_mobile
        row :sender_pincode
        row :receiver_name
        row :receiver_address
        row :receiver_mobile
        row :receiver_pincode
        row :weight
        row :type_of_service
        row :cost_of_service
        row :payment_mode
        row :aasm_state
    end
  end

  controller do
    include ApplicationHelper

    def scoped_collection
	  	Order.all
    end

  end
  
end
