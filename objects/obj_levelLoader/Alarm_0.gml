/// @description create layers

live_auto_call;

global.cyop_broken_tiles = [];

// clean up
with obj_persistent
{
	room_tiles = [];
	room_bgs = [];
}
with obj_parallax
	background_layers = [];

// add instances
var prop = _room.properties;
for(var i = 0; i < array_length(_room.instances); i++)
{
	var inst_data = _room.instances[i];
	if inst_data.deleted
		continue;
	
	var asset_name = objects[inst_data.object], asset = noone;
	switch asset_name
	{
		case "obj_teleporter": asset = obj_teleporter; break;
		case "obj_teleporter_receptor": asset = obj_teleporter; break;
		case "obj_pizzasona_spawn": asset = obj_bigcollect; break;
		default:
			var asset = cyop_asset(asset_name);
			if !object_exists(asset)
			{
				trace("levelLoader - ", asset_name, " does not exist");
				continue;
			}
	}
	
	// add instance
	var inst = instance_create_depth(inst_data.variables.x - prop.roomX, inst_data.variables.y - prop.roomY, -inst_data.layer, asset);
	if instance_exists(inst) // sometimes it fucking doesn't
	{
		variable_instance_set(inst, "targetRoom", "main");
		switch asset_name
		{
			case "obj_teleporter":
				inst.start = true;
				break;
			
			case "obj_pizzasona_spawn":
				if in_saveroom(inst)
					break;
				
				inst.visible = false;
				inst.value = 150;
				
				with instance_create(inst.x, inst.y - 42, obj_pizzasonacollect)
					collectID = inst.id;
				break;
		}
		
		var struct = inst_data.variables;
		var varNames = variable_struct_get_names(struct);
		
		for (var j = 0; j < array_length(varNames); j++)
		{
		    if varNames[j] != "x" && varNames[j] != "y"
		        variable_instance_set(inst, varNames[j], cyop_resolvevalue(struct[$ varNames[j]], varNames[j]));
		}
		
		if safe_get(inst, "flipX")
		{
			var horDifference = sprite_get_width(inst.sprite_index) - (sprite_get_xoffset(inst.sprite_index) * 2);
	        inst.x += horDifference * inst.image_xscale;
	        inst.image_xscale *= -1;
		}
		if safe_get(inst, "flipY")
		{
			var verDifference = sprite_get_height(inst.sprite_index) - (sprite_get_yoffset(inst.sprite_index) * 2);
	        inst.y += verDifference * inst.image_yscale;
	        inst.image_yscale *= -1;
		}
		
		// saveroom
		var memorized = global.custom_rooms[room_ind][1].instances[i];
		if struct_exists(memorized, "ID")
			inst.ID = memorized.ID;
		else
			struct_set(memorized, "ID", inst.id);
	}
	else
		trace("Instance of object ", objects[inst_data.object], " deleted itself upon create");
}

// backgrounds
var backgrounds = variable_struct_get_names(_room.backgrounds);
for(var i = 0; i < array_length(backgrounds); i++)
{
	var bg_data = _room.backgrounds[$ backgrounds[i]];
	
	var layer_num = real(backgrounds[i]);
	if layer_num < 0
		var lay = layer_create(-2000 + layer_num);
	else
		var lay = layer_create(2000 + layer_num);
	
	var bg = layer_background_create(lay, cyop_resolvevalue(bg_data.panic_sprite != -1 && global.panic ? bg_data.panic_sprite : bg_data.sprite, "sprite_index"));
	layer_background_speed(bg, bg_data.image_speed);
	layer_background_htiled(bg, bg_data.tile_x);
	layer_background_vtiled(bg, bg_data.tile_y);
	layer_hspeed(lay, bg_data.hspeed);
	layer_vspeed(lay, bg_data.vspeed);
	layer_x(lay, bg_data.x);
	layer_y(lay, bg_data.y);
	
	with obj_persistent
	{
		array_push(room_bgs, {
			layer_id: lay,
			layer_name: concat("Backgrounds_", i),
			x: bg_data.x,
			y: bg_data.y,
			bg_id: bg,
			bg_sprite: layer_background_get_sprite(bg),
			par_x: 1 - bg_data.scroll_x,
			par_y: 1 - bg_data.scroll_y
		});
	}
	if layer_num >= 0
	{
		with obj_parallax
			array_push(background_layers, lay);
	}
}
with obj_parallax
{
	array_sort(background_layers, function(e1, e2)
	{
		return layer_get_depth(e1) > layer_get_depth(e2);
	});
	room_started = true;
}

// tiles
var tile_layers = variable_struct_get_names(_room.tile_data);
for(var i = 0; i < array_length(tile_layers); i++)
{
	var tilelayer_data = _room.tile_data[$ tile_layers[i]];
	var tiles = variable_struct_get_names(tilelayer_data);
	if !array_length(tiles)
		continue;
	
	var layer_num = real(tile_layers[i]);
	var tilelayer = new cyop_tilelayer();
	
	var tiles_array = [];
	for(var j = 0; j < array_length(tiles); j++)
	{
		var tile_data = tilelayer_data[$ tiles[j]];
		if !is_struct(tile_data)
			continue;
		
		var xx = string_copy(tiles[j], 1, string_pos("_", tiles[j]) - 1);
		var yy = string_copy(tiles[j], string_pos("_", tiles[j]) + 1, string_length(tiles[j]));
		
		var tilesize = 32;
		
		var sprite = cyop_asset(tile_data.tileset);
		if !sprite_exists(sprite)
		{
			var custom = ds_map_find_value(global.custom_tiles, tile_data.tileset);
			if !is_undefined(custom)
			{
				sprite = custom[0];
				tilesize = custom[1];
			}
			else
				sprite = spr_null;
		}
		
		var tile = new cyop_tile(real(xx) - _room.properties.roomX, real(yy) - _room.properties.roomY, tile_data.coord[0], tile_data.coord[1], sprite, 0, tilesize, tilesize);
		array_push(tiles_array, tile);
	}
	
	var depp = 100 + layer_num;
	if layer_num < 0
		depp = -100 + layer_num;
	tilelayer.Build(tiles_array, depp);
	
	var inst = instance_create_depth(0, 0, depp, obj_cyop_tilelayer, {tilelayer: tilelayer, secrettile: layer_num <= -5});
	
	// saveroom
	var memorized = global.custom_rooms[room_ind][1].tile_data[$ tile_layers[i]];
	if struct_exists(memorized, "ID")
		inst.ID = memorized.ID;
	else
		struct_set(memorized, "ID", inst.id);
	
	if in_saveroom(inst.id)
		inst.revealed = true;
}

// song
var song = _room.properties.song;
var fade = _room.properties.songTransitionTime;
var state = 0, fmod = string_starts_with(song, "event:");

if fmod && string_pos(".", song) != 0
{
	/*
		event:/music/w1/ruin.1
		the end part (.1) is the state
	*/
	var split = string_split(song, ".", true, 1);
	song = split[0];
	state = real(split[1]);
}

if !fmod
	var event = cyop_resolvevalue(song, "sound");
else
	var event = song;

if !is_string(event) or fmod
{
	with obj_music
	{
		var found = -1;
		for(var i = 0; i < array_length(custom_music); i++)
		{
			if custom_music[i].event == event
			{
				found = i;
				break;
			}
		}
		
		if current_custom != noone && found != current_custom
		{
			if custom_music[current_custom].fmod
			{
				fmod_event_instance_set_paused(custom_music[current_custom].instance, true);
				custom_music[current_custom].paused = true;
			}
			else
				audio_sound_gain(custom_music[current_custom].instance, 0, fade);
		}
		
		if found > -1
		{
			current_custom = found;
			if custom_music[found].fmod
			{
				custom_music[found].paused = false;
				fmod_event_instance_set_paused(custom_music[found].instance, false);
			}
			else
				audio_sound_gain(custom_music[found].instance, global.option_music_volume * 0.5, fade);
		}
		else
		{
			current_custom = array_length(custom_music);
			array_push(custom_music, {event: event, instance: noone, fmod: fmod, state: state, paused: false});
		}
	}
}

// do it asshole
delete _room;
with obj_player
	event_perform(ev_other, ev_room_start);
with all
	event_perform(ev_other, ev_room_start);
