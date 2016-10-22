// some fancy styling shit
$(document).ready(function(){
  $('.shopping_cart li:nth-last-child(3)').css({
    "background-color": "rgba(246, 240, 96, 0.8)"
  });
});

// The ajax for shopping cart ::::::::::::::::::::

// first check for events for (1) adding (2) emptying and (3) deleting an item from cart
$(document).ready(function() {
    // $("#add-to-cart").bind('click', submit);
    $("#empty-cart").bind('click', emptyCart);
    // Navbar delete
    $(".delete-item").bind('click', removeItem);
});

// We can empty the whole cart
function emptyCart(event) {
    event.preventDefault();
    deleteCart(0);
}

function removeItem(event) {
    event.preventDefault();
    $item = $(event.toElement).parent();
    itemId = $($item).attr('id').slice(-1);
    deleteCart(parseInt(itemId));
}

function get_total(price){
  total_price = parseInt($('div[id="line-total').children('.total').text().slice(1));
  return total_price - price;
}

function cleanView(itemId){
  $('div[id="line-'+itemId+'"').remove();
  $('li[id="line-'+itemId+'"').next().remove();
  $('li[id="line-'+itemId+'"').remove();
}

function updateTotalPrice(itemId){
  total_price = get_total(parseInt($('div[id="line-'+itemId+'"').children('.total').text().slice(1)));
  $('div[id="line-total"]').children('.total').text("€"+total_price);
  $('li[id="line-total"]').children('.total').text("€"+total_price);
}

// When emptied this method is called
function deleteCart(itemId) {
    $.ajax({
      type: "DELETE",
      url: "/shopping_carts/" + itemId + ".json",
      contentType: "application/json",
      dataType: "json"
    }).done(function(data) {
        itemId = data;
        if(itemId === 0){
          $('div[id*="line-"]').remove();
          $('div[id="line-total').children('.total').text("€0.00");
        }else{
          updateTotalPrice(itemId);
          cleanView(itemId);
        }
      }).fail(function(data){
        console.log("error");
      });
}



//
// function addToCart(id, amount) {
//     var newProduct = { id: amount };
//
//     // THE REQUEST
//     $.ajax({
//         type: "POST",
//         url: "/shopping_carts.json",
//         data: JSON.stringify({
//             product: newProduct
//         }),
//         contentType: "application/json",
//         dataType: "json"
//     }).done(function(data) {
//             console.log(data);
//
//             // Here we make the shopping_cart css change when something is added
//             $("#shopping-cart-glyphicon").css('color', 'green');
//         })
//
//         .fail(function(error) {
//             console.log(error);
//             error_message = error.responseJSON.title[0];
//             showError(error_message);
//         });
// }


// reseting the error messages
function resetErrors() {
    $("#error_message").innerHtml("");
}
