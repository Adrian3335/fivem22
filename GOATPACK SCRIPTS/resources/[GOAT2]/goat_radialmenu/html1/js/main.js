const Root = document.querySelector(":root");

'use strict';

var RadialMenuV = null;
let scale = 1.0;

$(document).ready(function(){

    window.addEventListener('message', function(event){
        var eventData = event.data;

        if (eventData.action == "ui") {
            if (eventData.radial) {
                createMenu(eventData.items)
                RadialMenuV.open();
            } else {
                RadialMenuV.close();
            }
        }

        if (eventData.action == "setPlayers") {
            createMenu(eventData.items)
        }

        if (eventData.action == "updatecolor") {
            Root.style.setProperty(
                "--secondaryColor",
                eventData.color.secondaryColor
            );  
            Root.style.setProperty(
                "--primaryColor",
                eventData.color.primaryColor
            );
        }

        if(eventData.action == "setScale") {
            scale = eventData.scale;
        }
    });
});

function createMenu(items) {
    RadialMenuV = new RadialMenu({
        parent      : document.body,
        size        : 400 * scale,
        menuItems   : items,
        onClick     : function(item) {
            if (item.shouldClose) {
                RadialMenuV.close();
            }
            
            if (item.event !== null) {
                if (item.data !== null) {
                    $.post(`http://${GetParentResourceName()}/selectItem`, JSON.stringify({
                        itemData: item,
                        data: item.data
                    }))
                } else {
                    $.post(`http://${GetParentResourceName()}/selectItem`, JSON.stringify({
                        itemData: item
                    }))
                }
            }
        }
    });
}

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            RadialMenuV.close();
            break;
    }
});