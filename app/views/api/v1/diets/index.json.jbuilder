json.array @products do |product|
  json.product_name product.product_name
  json.image_url product.image_small_url
end
