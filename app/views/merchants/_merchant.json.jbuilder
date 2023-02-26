json.extract! merchant, :id, :name, :email_id, :total_commission_charged, :disbursement_frequency, :live_on, :min_monthly_fee, :status, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
