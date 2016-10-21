
@shopping_cart.each do |id, amount|
  json.extract! @shopping_cart, id
  json.url shopping_cart_url(@shopping_cart, format: :json)
end
