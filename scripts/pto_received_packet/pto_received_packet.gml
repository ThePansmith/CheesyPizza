function pto_received_packet(msgid, buffer)
{
	if live_call(msgid, buffer) return live_result;
	
	switch msgid
	{
		/*
		*/
		case EventType.ServerClosing:
			audio_play_sound(sfx_pephurt, 0, false, global.option_master_volume * global.option_sfx_volume);
			message_show($"Server closed!");
			
			event_user(1);
			break;
		
		/*
			buffer_u64: Handle
			buffer_string: Username
		*/
		case EventType.PlayerJoin:
			var handle = buffer_read(buffer, buffer_u64);
			var username = buffer_read(buffer, buffer_text);
			
			if handle != self.handle
			{
				with instance_create(0, 0, obj_otherplayer)
				{
					self.handle = handle;
					self.username = username;
				}
				trace($"Player joined: {username} ({handle})");
			}
			break;
		
		/*
			buffer_u64: Handle
			buffer_string: Reason
		*/
		case EventType.PlayerLeft:
			var handle = buffer_read(buffer, buffer_u64);
			var reason = buffer_read(buffer, buffer_string);
			
			if handle == self.handle
			{
				audio_play_sound(sfx_pephurt, 0, false, global.option_master_volume * global.option_sfx_volume);
				message_show($"Kicked from server!\n{reason}");
				
				event_user(1);
			}
			else
			{
				with obj_otherplayer
				{
					if self.handle == handle
						instance_destroy();
				}
				trace($"Player left: {handle} ({reason})");
			}
			break;
		
		/*
			buffer_u64: Handle
		*/
		case EventType.AcceptPlayer:
			self.handle = buffer_read(buffer, buffer_u64);
			trace($"My handle is {self.handle}");
			break;
		
		/*
		*/
		case EventType.Update:
			var handle = buffer_read(buffer, buffer_u64);
			
			var xx = buffer_read(buffer, buffer_f32);
			var yy = buffer_read(buffer, buffer_f32);
			var image = buffer_read(buffer, buffer_f32);
			var state = buffer_read(buffer, buffer_u16);
			var xscale = buffer_read(buffer, buffer_bool);
			var spr = buffer_read(buffer, buffer_string);
			var spr_palette = spr_peppalette;
			
			// sprite
			if spr == chr(0) or spr == ""
				spr = -1;
			else
			{
				switch string_copy(spr, 1, 2)
				{
					case "P_": case "ra": spr = string_replace(spr, "P_", "spr_player_"); break;
					
					case "N_": spr_palette = spr_noisepalette; spr = "spr_player" + spr; break;
					case "V_": spr_palette = spr_vigipalette; spr = "spr_player" + spr; break;
					case "SP": spr_palette = spr_pizzypalette; spr = "spr_player" + spr; break;
					case "PN": spr_palette = spr_pizzypalette; spr = "spr_player" + spr; break;
				
					case "S_":
						spr = string_replace(spr, "S_", "spr_snick_");
						spr_palette = spr_snickpalette;
						break;
				
					case "SN":
						spr = string_replace(spr, "SN_", "spr_pizzano_");
						spr_palette = spr_pizzanopalette;
						break;
				
					// transfopep
					case "kn": spr = string_replace(spr, "kn", "spr_knightpep_"); break;
					case "bo": spr = string_replace(spr, "bo", "spr_bombpep_"); break;
					case "sh": spr = string_replace(spr, "sh", "spr_shotgun_"); break;
					case "bx": spr = string_replace(spr, "bx", "spr_boxxedpep_"); break;
					case "ch": spr = string_replace(spr, "ch", "spr_cheesepep_"); break;
				}
				spr = SPRITES[? spr];
			}
			
			// figure out player
			var target = noone;
			with obj_otherplayer
			{
				if self.handle == handle
				{
					target = id;
					break;
				}
			}
			if target == noone
				target = instance_create(0, 0, obj_otherplayer);
			
			// do it
			with target
			{
				x = xx;
				y = yy;
				image_index = image;
				self.state = state;
				image_xscale = xscale ? 1 : -1;
				sprite_index = spr;
				self.spr_palette = spr_palette;
			}
			break;
		
		/*
		*/
		case EventType.Variable:
			var variable = buffer_read(buffer, buffer_u8);
			var handle = buffer_read(buffer, buffer_u64);
			
			var target = noone;
			if self.handle == handle
				target = obj_player1;
			else with obj_otherplayer
			{
				if self.handle == handle
				{
					target = id;
					break;
				}
			}
			
			with target
			{
				switch variable
				{
					case Var.Room:
						current_room = buffer_read(buffer, buffer_text);
						if asset_get_type(current_room) == asset_room
							current_room = asset_get_index(current_room);
						else
							current_room = noone;
						break;
						
					case Var.Palette:
						paletteselect = buffer_read(buffer, buffer_u8);
						pattern = buffer_read(buffer, buffer_text);
						if string_digits(pattern) == pattern
							pattern = SPRITES[? "spr_peppattern" + pattern];
						else
							pattern = SPRITES[? "spr_pattern_" + pattern];
						break;
						
					case Var.Panic:
						break;
					case Var.Busy:
						break;
						
					case Var.YScale:
						image_yscale = buffer_read(buffer, buffer_bool) ? 1 : -1;
						break;
				}
			}
			break;
	}
}
function Packeter(event = undefined) constructor
{
	if !instance_exists(obj_onlineclient)
		exit;
	
	buffer = obj_onlineclient.buffer;
	socket = obj_onlineclient.socket;
	
	BuildStream = function()
	{
		var finalBuffer = buffer_create(8, buffer_grow, 1);
		buffer_copy(buffer, 0, buffer_tell(buffer), finalBuffer, 8);
		buffer_seek(finalBuffer, buffer_seek_start, 0);
		buffer_write(finalBuffer, buffer_u64, buffer_tell(buffer));
		return finalBuffer;
	}
	
	function Write(type, value)
	{
		buffer_write(buffer, type, value);
	}
	function Send()
	{
		var buffer = BuildStream();
		network_send_raw(socket, buffer, buffer_tell(self.buffer) + 8, 0);
		buffer_delete(buffer);
	}
	
	buffer_seek(buffer, buffer_seek_start, 0);
	if event != undefined
		Write(buffer_u8, event);
}
