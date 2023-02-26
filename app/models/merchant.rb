class Merchant < ApplicationRecord
    SEQURA_MONTHLY_FEE = 100


    def self.disbursement_frequency(disbursement_frequency=nil)
        return ((disbursement_frequency.to_i==1) ? "Weekly" : "Monthly")
    end

    def self.sequra_commission_fee_structure(order_value)

        sequra_fee_percentage = case order_value
        when 0..50 then 1
        when 50..300 then 0.95
        when order_value > 300 then 0.8
        end 
        return sequra_fee_percentage

    end
end
