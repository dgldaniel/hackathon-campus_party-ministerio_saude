$(document).on('ready page:load turbolinks:load', function() {
  $('#individual_calls').on('cocoon:after-insert', function(e, insertedItem, originalEvent) {
    console.log('element', e)

    alert('inseriu')
  });
});

// $(function(){
//   $('#individual_calls').on('cocoon:before-insert', function(e, insertedItem, originalEvent) {
//     console.log(e, insertedItem, originalEvent)

//     alert('inseriu')
//   });

//  $("a.add_fields").on('click', function(){
//    console.log('looks like clicking works...');
//  });
// });
