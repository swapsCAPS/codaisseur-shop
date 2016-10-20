// some fancy styling shit
$(document).ready(function(){
  $('.shopping_cart li:nth-last-child(3)').css({
    "background-color": "rgba(246, 240, 96, 0.8)"
  });
});

// The ajax for shopping cart ::::::::::::::::::::

// first check for events for (1) adding (2) emptying and (3) deleting an item from cart
$(document).ready(function() {
    $("#add-to-cart").bind('click', addToCart);
    $("#empty-cart").bind('click', emptyCart);
    $("#delete-item").bind('click', removeItem);

    // updateCounters();
});


// Then we add something to cart
function addToCart(event) {

    event.preventDefault();

    resetErrors();     // do we need this

    reallyAddToCart($(GET ID FROM URI OR PARAMS).val(), $("#amount").val());    // passing two values here

}

// Then we create it ? ........
function reallyAddToCart(id, amount) {
    var newProduct = { id: amount };

    // THE REQUEST
    $.ajax({
        type: "POST",
        url: "/shopping_carts.json",
        data: JSON.stringify({
            product: newProduct
        }),
        contentType: "application/json",
        dataType: "json"
    })

        .done(function(data) {
            console.log(data);

            // Here we make the shopping_cart css change when something is added
            $("#shopping-cart-glyphicon").css('color', 'green');
        })

        .fail(function(error) {
            console.log(error)
            error_message = error.responseJSON.title[0];
            showError(error_message);
        });
}


// We can empty the whole cart
function emptyCart(event) {
    event.preventDefault();

    deleteCart();

    });
}

// When emptied this method is called
function deleteCart() {

    $.ajax({
        type: "DELETE",
        url: "/shopping_cart/" + 0 + ".json",
        contentType: "application/json",
        dataType: "json"})

        .done(function(data) {          // what is data????


            // either we use this and it deletes all
            $(".cart_item").remove();

            // or we use an each that looks something like this:
            $.each($(".cart_item"), function() {
                cart_item = $(".cart_item")
                deleteTodo(cart_item);
            });
        });
}

// we can also delete single items instead of emptying the whole thing
function removeItem () {
    event.preventDefault();

    itemId = .val();

    deleteItem();
}

function deleteItem(itemId) {

    $.ajax({
        type: "DELETE",
        url: "/shopping_cart/" + itemId + ".json",
        contentType: "application/json",
        dataType: "json"})

        .done(function(data) {

            // we should now which item we are deleting
            $(".cart_item").remove();

        });
}

// reseting the error messages
function resetErrors() {
    $("#error_message").remove();
}





