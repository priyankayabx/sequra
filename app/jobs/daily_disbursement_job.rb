class DailyDisbursementJob 
    @queue = :DailyDisbursementJob
    def self.perform()
      begin
        # 1=Mon, 2=Tue, 3=Wed, 4=Thu 5=Fri, 6=Sat 7=Sun
        current_day = Time.now.wday 
       
       customers = Merchant.where("status=1 and WEEKDAY(DATE(live_on)) = #{current_day}-1 ")
        orders = Order.where("DATE(created_at) = '#{today_date}'and status=1")
        customers.each_with_index do |customer,idx|
            orders = customer.orders
            if orders.present?
                orders.each_with_index do |order,idx|
                    order.status = 2 #disbursed order
                    order.save!
                end
            end
           
        end
      rescue Exception => e
        error     = "[DailyDisbursementJob]:#{e.class.to_s}: #{e.message}"
      end
      
    end

  end

  