session[:shopping_cart].each do | id, amount |

  json.extract! session[:shopping_cart], id, amount
  json.url shopping_carts_url(session[:shopping_cart], format: :json)

end
