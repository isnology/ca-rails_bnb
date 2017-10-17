json.extract! booking, :id, :listing, :guest, :check_in_at, :check_out_at, :guest_count, :charge_identifier, :created_at, :updated_at
json.url booking_url(booking, format: :json)
