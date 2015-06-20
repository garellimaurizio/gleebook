$('.open-gallery-link').click(function() {
  var items = [];
  var $clickedItem = $($(this)).children().attr('gallery-id');

  $( $(this).attr('href') ).find('.slide').each(function() {
	  
	  var source = [];
//	  source['src'] = $(this);
	  source.src = $(this);

	  var $currentItem = $($($(this)).children()).children().attr('gallery-id');

	  var val = parseInt($currentItem);
	  var k = parseInt($clickedItem);
	  
	  if (val < k) {
		  items.splice(val+k, 0, source);
	  }
	  else {
		  items.splice(val-k, 0, source);
	  }
  });
  
  $.magnificPopup.open({
    items:items,
    gallery: {
      enabled: true 
    }
  });
});

