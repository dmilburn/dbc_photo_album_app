$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // $('form.new-album').on('submit',
  //   function(event){
  //     event.preventDefault();
  //     var $target = $(event.target);

  //     $.ajax({
  //       type: 'POST',
  //       url: $target.attr('action'),
  //       data: $target.serialize()      
  //     }).done(function (response) {
        
  //     })
  //   })

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

// hover over nav divs
  $(function(){
    //display the hover div
    $("div.hoverBtn").show("fast", function() {
      //append the background div
      $(this).append("<div></div>");
    });
  });

  var hoverColour = "#FFF";
  //when the dom has loaded
  $(function(){
    //display the hover div
    $("div.hoverBtn").show("fast", function() {
      //append the background div
      $(this).append("<div></div>");
      //on link hover
      $(this).children("a").hover(function(){
        //store initial link colour
        if ($(this).attr("rel") == "") {
          $(this).attr("rel", $(this).css("color"));
        }
        //fade in the background
        $(this).parent().children("div")
          .stop()
          .css({"display": "none", "opacity": "1"})
          .fadeIn("fast");
        //fade the colour
        $(this).stop()
          .css({"color": $(this).attr("rel")})
          .animate({"color": hoverColour}, 350);
      },function(){
        //fade out the background
        $(this).parent().children("div")
          .stop()
          .fadeOut("slow");
        //fade the colour
        $(this).stop()
          .animate({"color": $(this).attr("rel")}, 250);
      });
    });
  });
