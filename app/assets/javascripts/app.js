$(document).ready(function(){

  $("body").on("click",".button", function(){
                                      if ($(".text").val()=="") {
                                        alert("Nothing To Encode/Decode");
                                        return
                                      } 
                                      var enc = 1;
                                      if ($(this).hasClass("decrypt"))
                                        enc*=-1;
                  									  $.ajax({
                  									  type: 'post',
                  									  url: '/encrypt',
                  									  data: {'string' : $(".text").val(),
                  											 'offset' : $(".offset").val()*enc},
                  									  success: function(data, textStatus, xhr) {
                                         $(".text").val(data["encrypted"].join(""));},
                                      });
                          });

  $("body").on("click",".save", function(){
                                      $.ajax({
                                        //maybe in ajax i should use get but I am mutating a state so post it is
                                      type: 'post',
                                      url: '/save_message',
                                      data: {'m_message' : $(".text").val(),
                                         'm_offset' : $(".offset").val()},
                                      success: function(data, textStatus, xhr) {
                                         alert(data["notice"]);
                                         var message_slot = $("<div>");
                                         message_slot.addClass("message_slot");
                                         message_slot.text("Offset: "+ $(".offset").val()+", Text:  "+$(".text").val().substring(0,7)+"...");
                                         //not the best way to have the msg id
                                         //saved into the front end but for this theoretical
                                         //case, is enough
                                         message_slot.data("msg-id", data["id"]);
                                         $(".right_tab").append(message_slot);
                                         $(".tab_container").addClass("left");
                                        },
                                      });
                          });

  $("body").on("click",".arrow-right", function(){
                                            if ($(".tab_container").hasClass("left")) {
                                              $(".tab_container").removeClass("left")
                                            } else $(".tab_container").addClass("left")
                                                });
  $("body").on("click",".message_slot", function(){console.log($(this).data())
                                      $.ajax({
                                        type: 'get',
                                        url: '/get_message',
                                        data: {'message_id' : $(this).data("msgId")},
                                        success: function(data, textStatus, xhr) {
                                          $(".text").val(data["text"]);
                                          $(".offset").val(data["offset"])
                                        }

                                      });

                                    });
var resizeText = function () {
        
        var preferredFontSize = 60;
        var preferredSize = 1024 * 768;

        var currentSize = $(window).width() * $(window).height();
        var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);
        var newFontSize = preferredFontSize * scalePercentage;
        $("html").css("font-size", newFontSize + 'px');
    };

    $(window).bind('resize', function() {
        resizeText();
    }).trigger('resize');

});


