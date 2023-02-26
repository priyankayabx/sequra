class Order < ApplicationRecord
    belongs_to :merchant
    ORDER_REQUESTED = 1
    ORDER_DISBURSED = 2
    ORDER_COMPLETED = 3
    ORDER_CLOSED = 4
    ORDER_CANCELLED = 5

    def self.order_amount_calculation(order)
        res = {}
        res['comission'] = order.amount.to_f*order.comission_percentage.to_f/100
        res['gross_amount'] = order.amount.to_f
        res['net_amount'] = res['gross_amount']-res['comission']

       return res
    end

    

   
end
