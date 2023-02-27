class MonthlyRecoveredCommissionJob < ApplicationJob
  @queue = :default
  def self.perform()
    begin
      current_year = Time.now.strftime("%Y")
      previous_month = Time.now.strftime("%m")
      yesterday_date = (Time.now - 1.days).strftime("%Y-%m-%d 08:00:00")

      merchants = Merchant.where("status=1")
      merchants.each_with_index do |merchant,idx|

        sql = "SELECT YEAR(created_at) as year, MONTH(created_at) as month, COUNT(R.sequra_commission_amount) AS total_sequra_comission 
        FROM orders R where  merchant_id =#{merchant.id}
        GROUP BY year, month HAVING year='#{current_year}' and month = '#{previous_month}'  
        ORDER BY year, month  "
        order = ActiveRecord::Base.connection.exec_query(sql)

        if (order.present?)
          if merchant.min_monthly_fee > order.total_sequra_comission.to_i
            recovered_commission = merchant.min_monthly_fee.to_i - order.total_sequra_comission.to_i
            merchant.recovered_commission =   recovered_commission
            merchant.save!
          end
        end 
      end 
    
    rescue Exception => e
      error     = "[MonthlyRecoveredCommissionJob]:#{e.class.to_s}: #{e.message}"
    end
     
  end
end

