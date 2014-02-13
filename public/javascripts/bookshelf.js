  $j = jQuery.noConflict();

// jQuery(".read_form").live("click", function(e){
//     e.preventDefault();
//     var _this_form = jQuery(this);    
//         jQuery.ajax(function(){
//             data: {book_id: _this_form.data('text')}
//             type: "post"
//             url: _this_form.attr("action")
//             success = function(data){
//               if (data['text'] == true) {
//               	jQuery(".read_button").attr("disabled","disabled")
//               }
//               else{
//                 alert("Cannot add")
//               }
//             }
//         });
  
//     return false;
//   });

$j(document).on("click", ".review_list a", function (e) {
  e.preventDefault();
  console.log("@#############");

  var reviewDiv = $j('#reviews');
  var ratingDiv = $j('#ratings');
  
  ratingDiv.hide();
  reviewDiv.show();
  
});

$j(document).on("click", ".rating_list a", function (e) {
  e.preventDefault();
  console.log("@#############");

  var reviewDiv = $j('#reviews');
  var ratingDiv = $j('#ratings');
  
  ratingDiv.show();
  reviewDiv.hide();  
});

/*
$(".community_info li a").click(function (e) 
    {
            e.preventDefault();
        $("#" + $(this).attr("class")).show().siblings('div').hide();
    });


$('.community_info li a').on("click", function(e) {

  e.preventDefault();
  var $this = $(this),
      $id = $this.attr('id'),
      $class = '.' + $($id).attr('class').replace('hide','');
  console.log("#@$$$$$$$$$$");
  console.log($class);

  $('.default').addClass('hide');
  $($id).removeClass('hide');
  $('div[class]').not($class).addClass('hide');
  
});

$("a[data-toggle]").on("click", function(e) {
  e.preventDefault();  // prevent navigating
  var selector = $(this).data("toggle");  // get corresponding selector from data-toggle
  $("div").hide();
  $(selector).show();
});
*/

