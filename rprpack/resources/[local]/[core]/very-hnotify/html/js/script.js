let clickaudio = new Audio('https://cdn.discordapp.com/attachments/597915484608004137/1051538969965371452/mixkit-cool-interface-click-tone-2568.wav');
clickaudio.volume = 0.2;

(() => {	
	Keys = {
		['INPUT_CONTEXT']: 'E',
		['INPUT_COVER']: 'Q',
		['INPUT_VEH_EXIT']: 'F',
				
		['INPUT_VEH_ACCELERATE']: 'W',
		['INPUT_VEH_DUCK']: 'X',
		['INPUT_PICKUP']: 'E',
		['INPUT_VEH_HEADLIGHT']: 'H',
		['INPUT_THROW_GRENADE']: 'G',
		['INPUT_SCRIPTED_FLY_ZUP']: 'PGUP',
		['INPUT_SCRIPTED_FLY_ZDOWN']: 'PGDOWN',

		['INPUT_MOVE_LEFT_ONLY']: 'A',
		['INPUT_RELOAD']: 'R',
		['INPUT_MOVE_RIGHT_ONLY']: 'D',
		['INPUT_MOVE_UP_ONLY']: 'W',
		['INPUT_MOVE_DOWN_ONLY']: 'S',
		['INPUT_DETONATE']: 'G',
		['INPUT_VEH_MOVE_LEFT_ONLY']: 'A',
		['INPUT_VEH_MOVE_RIGHT_ONLY']: "D",
		['INPUT_VEH_PREV_RADIO_TRACK']: '-',	
		['INPUT_SPRINT']: 'LEFT SHIFT',	
		['INPUT_CELLPHONE_RIGHT']: '⮫',	
		['INPUT_REPLAY_ADVANCE']: '⮫',	
		['INPUT_CELLPHONE_LEFT']: '⮪',
		['INPUT_REPLAY_BACK']: '⮪',
		
		['INPUT_CELLPHONE_UP']: '⮬',	
		['INPUT_CELLPHONE_DOWN']: '⮯',	
		
		['INPUT_FRONTEND_ACCEPT']: 'ENTER',	
		['INPUT_PARACHUTE_DEPLOY']: 'LPM',	
		['INPUT_VEH_FLY_ATTACK_CAMERA']: 'INSERT',	
	}

	ConvertKeys = function(message) {
		const regexKeys =  /~/g;			
		message = message.replace(regexKeys, "")
		
		for (const [key, value] of Object.entries(Keys)) {			
			if (message.match(key)) {				
				message = message.replace(key, '<h1>' + value + '</h1>');
			}
		};
	
		return message
	};
	
	ConvertText = function(message) {
        const regexColor = /~([^h])~([^~]+)/g;	
        const regexBold = /~([h])~([^~]+)/g;	
        const regexStop = /~s~/g;	
        const regexLine = /\n/g;		
        const newLine = /~n~/g;	
    
        message = message.replace(regexColor, "<span class='$1'>$2</span>").replace(regexBold, "<span class='$1'>$2</span>").replace(regexStop, "").replace(regexLine, "<br>").replace(newLine, "<br>");
		message = ConvertKeys(message)
		
        return message;		
	};

	window.onData = (data) => {		
		switch (data.action) {
			case 'ShowHelpNotification': {
				if (data.state == 'open') {
					if (data.message != undefined) {
						$('#messagehelp').html(ConvertText(data.message));
						clickaudio.play();
					}
					
					if (data.display == true) {						
						if ($('#uihelp').hasClass('hiding')) {
							$('#uihelp').removeClass('hiding')
						}						
						
						$('#uihelp').addClass('active')
					}
				} else if (data.state == 'close') {
					if ($('#uihelp').hasClass('active')) {
						$('#uihelp').removeClass('active')
					}
					
					$('#uihelp').addClass('hiding')

					$.post('http://very-hnotify/CanHelpNotification', JSON.stringify({
						display: true
					}));
			
				}
				
				break;
			}
		}
	};

	window.onload = function (e) {
		window.addEventListener('message', (event) => {
			onData(event.data);
		});	
	}
})();
