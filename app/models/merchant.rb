class Merchant < ApplicationRecord
    has_many :orders
    SEQURA_MONTHLY_FEE = 100


    def self.disbursement_frequency(disbursement_frequency=nil)
        return ((disbursement_frequency.to_i==1) ? "Weekly" : "Monthly")
    end

    def self.sequra_commission_fee_structure(order_value)
        sequra_fee_percentage = 
        if  0..50
            sequra_fee_percentage = 1
        elsif 50..300
            sequra_fee_percentage = 0.95
        elsif order_value > 300
            sequra_fee_percentage = 0.8
        end
        return sequra_fee_percentage

    end
end
