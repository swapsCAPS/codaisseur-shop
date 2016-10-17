$(document).ready(function(){
    $(".dropdown").hover(
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');
        }
    );

    $(".dropdown-toggle.shopping_cart").click(function(){
      window.location.href = "/shopping_carts";
      this.css({
        "box-shadow": "0px 1px 2px rgba(0, 0, 0, 0.87)"
      }.bind(this));
    });
});
