$(function(){
    window.addEventListener("message", function(event){
        if (event.data.event === 'changePosition') {
          if (event.data.type === 'top') {
            $('#noty_layout__topRight').css({'top':'4px'})
          } else if (event.data.type === 'down') {
            $('#noty_layout__topRight').css({'top':'180px'})
          }
        } else if(event.data.options){
          var options = event.data.options;
          new Noty(options).show();
        }else{
          var maxNotifications = event.data.maxNotifications;
          Noty.setMaxVisible(maxNotifications.max, maxNotifications.queue);
        };
    });
});