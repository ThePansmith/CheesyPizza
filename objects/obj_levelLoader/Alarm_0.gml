/// @description create layers

live_auto_call;
trace(ds_map_find_value(global.room_map, "main"));

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
	
	var asset = asset_get_index(objects[inst_data.object]);
	if !object_exists(asset)
	{
		trace("levelLoader - ", objects[inst_data.object], " does not exist");
		continue;
	}
	
	// add instance
	var inst = instance_create_depth(inst_data.variables.x - prop.roomX, inst_data.variables.y - prop.roomY, 100 - inst_data.layer, asset);
	if instance_exists(inst) // sometimes it fucking doesn't
	{
		variable_instance_set(inst, "targetRoom", "main");
		
		var struct = struct_get(inst_data, "variables");
		var varNames = variable_struct_get_names(struct);
		
		for (var j = 0; j < array_length(varNames); j++)
		{
		    if varNames[j] != "x" && varNames[j] != "y"
		        variable_instance_set(inst, varNames[j], cyop_resolvevalue(struct_get(struct, varNames[j]), varNames[j]));
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
		if struct_exists(memorized, "id")
			inst.ID = memorized.id;
		else
			memorized.id = inst.id;
	}
	else
		trace("Instance of object ", objects[inst_data.object], " deleted itself upon create");
}

// backgrounds
for(var i = 0; i < 10; i++)
{
	var bg_data = struct_get(_room.backgrounds, i);
	if is_undefined(bg_data)
		continue;
	
	var lay = layer_create(20000);
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
			par_y: 1 - bg_data.scroll_y,
		});
	}
	with obj_parallax
	{
		array_push(background_layers, lay);
		room_started = true;
	}
}

// do it asshole
with obj_player
	event_perform(ev_other, ev_room_start);
with all
	event_perform(ev_other, ev_room_start);
