class DailyDisbursementCalculationJob 
    @queue = :DailyDisbursementCalculationJob
    def self.perform()
      begin
        today_date = Time.now.strftime("%Y-%m-%d 07:59:00")
        yesterday_date = (Time.now - 1.days).strftime("%Y-%m-%d 08:00:00")
       
        orders = Order.where("created_at BETWEEN '#{yesterday_date}' and '#{today_date}' and status=1")
        orders.each_with_index do |order,idx|
          order.merchant_received_amount = Order.order_amount_calculation(order)['net_amount'].round(2)
          order.sequra_commission_amount = Order.order_amount_calculation(order)['comission'].round(2)
          order.status = 3
          order.save!
        end
      rescue Exception => e
        error     = "[DailyDisbursementJob]:#{e.class.to_s}: #{e.message}"
      end
      
    end

  end

  