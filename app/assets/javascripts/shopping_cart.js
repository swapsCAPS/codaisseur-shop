// The ajax for shopping cart ::::::::::::::::::::

// first check for events for (1) adding (2) emptying and (3) deleting an item from cart
$(document).ready(function() {
    // $("#add-to-cart").bind('click', submit);
    $("#empty-cart").bind('click', emptyCart);
    $(".delete-item").bind('click', removeItem);
    $("#add-to-cart").bind('click', addItem);
});

// We can empty the whole cart
function emptyCart(event) {
    event.preventDefault();
    deleteCart(0);
}

function removeItem(event) {
    event.preventDefault();
    $item = $(event.toElement).parent();
    itemId = $($item).attr('id').slice(5);
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

function cleanAll(){
  $('div[id*="line-"]').remove();
  $('li[id*="line-"]').remove();
}

function updateTotalPrice(itemId){
  if(itemId !== 0){
    total_price = get_total(parseInt($('div[id="line-'+itemId+'"').children('.total').text().slice(1)));
    $('div[id="line-total"]').children('.total').text("€"+total_price);
    $('li[id="line-total"]').children('.total').text("€"+total_price);
  }else{
    $('div[id="line-total').children('.total').text("€0.00");
  }
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
        if(!itemId){
          cleanAll();
          updateTotalPrice(0);
        }else{
          updateTotalPrice(itemId);
          cleanView(itemId);
        }
      }).fail(function(data){
        console.log("error");
      });
}

function addItem(event){
  event.preventDefault();
  itemId =  parseInt($('.card').attr('id'));
  amount = parseInt($('#amount').val());
  addToCart(itemId, amount);
}
function updateCart(item){
  if(item){
    $('#line-empty').remove();
    item = $('<li id="line-'+item.id+'">').append($('<a>').text(item.name+": €"+item.price).addClass('new')).append($('<a data-confirm="are you sure?">').text("x").addClass('btn btn-default delete-item'));
    item.insertBefore($('#line-total'));
    $('<li>').addClass('divider').insertAfter(item);
  }else {
    $('.shopping_cart li:nth-last-child(3)').addClass('new');
  }
}
function addToCart(itemId, amount) {
    // THE REQUEST
    $.ajax({
        type: "PATCH",
        url: "/shopping_carts/"+itemId+".json",
        data: JSON.stringify({
            amount: amount
        }),
        contentType: "application/json",
        dataType: "json"
    }).done(function(data) {
            item = data;
            updateCart(item);
            // Here we make the shopping_cart css change when something is added
            $("#shopping-cart-glyphicon").css('color', 'green');
        })

        .fail(function(error) {
            console.log(error);
            error_message = error.responseJSON.title[0];
            showError(error_message);
        });
}


// reseting the error messages
function resetErrors() {
    $("#error_message").innerHtml("");
}
