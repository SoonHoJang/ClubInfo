// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  
  $("form.tagsearch input").tagsinput({maxTags: 3});
  
  var color = 'one';
  var counter = 0;
  $('.desc').hide();
  $('.honeycombs').honeycombs();
  
  // 메인 페이지 카테고리 필터링
  var $grid = $('.honeycombs').isotope({
    itemSelector: '.date-type'
  });

  // store filter for each group
  var filters = {};
  
  $('.filters').on('click', '.btn', function() {
    var $this = $(this);
    // get group key
    var $buttonGroup = $this.parents('.button-group');
    var filterGroup = $buttonGroup.attr('data-filter-group');
    // set filter for group
    filters[ filterGroup ] = $this.attr('data-filter');
    // combine filters
    var filterValue = concatValues( filters );
    // set filter for Isotope
    $grid.isotope({ filter: filterValue });
  });
  
  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });
  
  // flatten object by concatting values
  function concatValues( obj ) {
    var value = '';
    for ( var prop in obj ) {
      value += obj[ prop ];
    }
    return value;
  }
  
});

function try_sign_up(){
  alert('회원가입은 관리자에게 문의해주세요.');
}

function showPopup(link){
  window.open(link, '동아리 신청', 'width=500, height=450, left=100, top=50');
}


function reorderHex(element) {
  
  var animate = true;
  
  $wrapper = $(element).find('.honeycombs-inner-wrapper');
  updateScales();
  width = $(element).width();
  
  newWidth = ( num / 1.5) * settings.combWidth;
  
  if(newWidth < width){
      width = newWidth;
  }
  
  $wrapper.width(width);
  
  var row = 0; // current row
  var upDown = 1; // 1 is down
  var left = 0; // pos left
  var top = 0; // pos top
  
  var cols = 0;
  
  $(element).find('.comb').each(function(index){
      
      top = ( row * (combHeight + settings.margin) ) + (upDown * (combHeight / 2 + (settings.margin / 2)));
      
      if(animate == true){
          $(this).stop(true, false);
          $(this).animate({'left': left, 'top': top});
      }else{
          $(this).css('left', left).css('top', top);
      }
      
      left = left + ( combWidth - combWidth / 4 + settings.margin );
      upDown = (upDown + 1) % 2;
      
      if(row == 0){
          cols = cols + 1;
      }
          
      if(left + combWidth > width){
          left = 0;
          row = row + 1;
          upDown = 1;
      }
  });
  
  $wrapper
      .width(cols * (combWidth / 4 * 3 + settings.margin) + combWidth / 4)
      .height((row + 1) * (combHeight + settings.margin) + combHeight / 2);
}