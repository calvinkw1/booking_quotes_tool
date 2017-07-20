json.extract! inquiry, :id, :rental_site, :unit_id, :price, :tax, :nights, :check_in, :check_out, :adults, :children, :pets, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
