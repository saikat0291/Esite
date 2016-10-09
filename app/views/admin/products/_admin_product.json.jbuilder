json.extract! admin_product, :id, :cat_id, :subcat_id, :product_name, :price, :product_image, :product_desc, :created_at, :updated_at
json.url admin_product_url(admin_product, format: :json)