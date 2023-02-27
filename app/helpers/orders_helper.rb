module OrdersHelper
    def order_status(order_status)
        if order_status == 1
            shown_order_status = "Order Requested"
            
        elsif order_status == 2
            shown_order_status = "Order Disbursed"
            
        elsif order_status == 3
            shown_order_status = "Order Completed"
        elsif order_status == 4
            shown_order_status = "Order Closed"
        elsif order_status == 5
            shown_order_status = "Order Cancelled"
        else
            shown_order_status = "Invalid Order "
        end

    end

    
end
