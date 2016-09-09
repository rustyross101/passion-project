 $(document).ready(function (event) {
  // Make the content appear for the active tab upon loading page
  $('#integrity').show();

  // Call the function that does all the magic
  moveTabs();
});

function moveTabs(){
$('li').on('click', function(){
      // Removes 'active' class from all 'li' elements
      $('li').removeClass('active');

      // Adds 'active' to the current tab
      $(this).addClass('active');

      // Targets the href for the active tab
      var activeTab = $(this).find('a').attr('href')

      // Hides all content for all tabs
      $('.tab-content').hide();

      // Displays the content on active tab
      $(activeTab).css('display', 'inline');


    });
};