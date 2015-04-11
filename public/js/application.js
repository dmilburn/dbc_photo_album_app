$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});

  $(function() {
    var dialog, form,

      name = $( "#name" ),
      location = $( "#location" ),
      photo = $( "#photo" ),
      allFields = $( [] ).add( name ).add( location ).add( photo ),
      tips = $( ".validateTips" );

    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }

    function uploadPhoto() {
      allFields.removeClass( "ui-state-error" );
      $.ajax({
        url: "/photos/upload",
        type: "POST",
      }).done(function(response){
        console.log(response)
      })
    }

    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "Upload a Photo": uploadPhoto,
        Cancel: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });

    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      uploadPhoto();
    });

    $( "#upload-photo" ).click(function() {
      dialog.dialog( "open" );
    });
  });