(function($){
  $(document).ready(function(){

    // Remove an item from the cart by setting its quantity to zero and posting the update form
    $('form#updatecart a.delete').show().click(function(){
      $(this).parents('tr').find('input.line_item_quantity').val(0);
      $(this).parents('form').submit();
      return false;
    });
    
    
    
    //added javascript for the handle of images
        // add handler for mousing over thumbnails
        $("#main-image").data('selectedThumb', $('#main-image img').attr('src'));
        $('ul.thumbnails li').eq(0).addClass('selected');
        $('ul.thumbnails li a').click(function() {
          $("#main-image").data('selectedThumb', $(this).attr('data-product-image'));
          $('ul.thumbnails li').removeClass('selected');
          $(this).parent('li').addClass('selected');
        }).hover(
          function() {
            $("a[rel='facebox']").attr('href', $(this).attr('href'));
            $("a[rel='facebox']").fancybox();

            $('#main-image img').attr('src', $(this).attr('data-product-image'));
          },
          function() {
            $('#main-image img').attr('src', $("#main-image").data('selectedThumb'));
          }
        );

        // add light box
        $("a[rel='product_images']").fancybox({
          'transitionIn'	:	'elastic',
          'transitionOut'	:	'elastic'
        });

        $("a[rel='facebox']").fancybox();
    
    
    

  });
})(jQuery);