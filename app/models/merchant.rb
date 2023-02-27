class Merchant < ApplicationRecord
    has_many :orders
    SEQURA_MONTHLY_FEE = 100


    def self.disbursement_frequency(disbursement_frequency=nil)
        return ((disbursement_frequency.to_i==1) ? "Daily" : "Weekly")
    end

    def self.sequra_commission_fee_structure(order_value)
        begin
            sequra_fee_percentage = 
            if  order_value > 0 and order_value < 50
                sequra_fee_percentage = 1
            elsif order_value >= 50 and order_value < 300
                sequra_fee_percentage = 0.95
            elsif order_value >= 300
                sequra_fee_percentage = 0.8
            end
        rescue Exception => e
          error     = "[sequra_commission_fee_structure]:#{e.class.to_s}: #{e.message}"
        end
        
        return sequra_fee_percentage

    end
end
