if Online
{
	global.Net_LastMsg += 1
	if (global.Net_LastMsg > reconnect * fps && global.Net_Online) {
	    message_show("ATTEMPTING TO RECONNECT")
	    global.Net_Online = false
	    global.Net_Logged = 0
		global.Net_LastMsg = 0
	    serverConnect()
		
		reconnect = min(reconnect + 3, 20); // increment wait time. 20 seconds max
	}

	if global.Net_Logged == 1 {
		global.Net_Online = true;
		reconnect = 5;
		
		var tex = "noone";
		if sprite_exists(global.palettetexture)
			tex = sprite_get_name(global.palettetexture);
		
	    with (obj_player1) {
			sendString({
		        type: 2,
            
		        x: x,
		        y: y,
		        room: room,
            
		        sprite: sprite_get_name(sprite_index),
		        frame: floor(image_index),
				dir: xscale,
		        palette: paletteselect,
		        paletteSprite: sprite_get_name(spr_palette),
				paletteTexture: tex,
			})	
		}
	} else {
	    sendString({
	        type: 1,
	        ver: PTT_Version,
	        name: global.Net_Name,
	        key: global.Net_Key,
			lobby: global.Net_LobbyCode,
	    })
	}
}