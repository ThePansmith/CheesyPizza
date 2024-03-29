/// @description mostly modifiers
live_auto_call;

shell_force_off = room == tower_pizzaboy;
if shell_force_off
{
	global.showcollisions = false;
	with obj_shell
	{
		WC_showcollisions = false;
		WC_showinvisible = 0;
	}
}

// panic backgrounds
if instance_exists(obj_parallax)
{
	if global.panic && room != custom_lvl_room
	    event_user(1);
}
else
	exit;

// ctop lapping
if MOD.Lappable
{
	with obj_baddie
	{
		if global.lap && (object_index == obj_robot or object_index == obj_ninja or object_index == obj_bazookabaddie)
		{
			escape = true;
			event_perform(ev_other, ev_room_start);
		}
		else if object_index != obj_ghostknight && !in_saveroom(id, global.escaperoom)
			add_saveroom(id, global.escaperoom);
	}
}
if MOD.Lappable or (safe_get(global, "leveltosave") == "sucrose" && !room_is_secret(room))
{
	with obj_collect
	{
		instance_change(obj_escapecollect, false);
		event_perform_object(obj_escapecollect, ev_create, 0);
	}
	with obj_bigcollect
	{
		instance_change(obj_escapecollectbig, false);
		event_perform_object(obj_escapecollectbig, ev_create, 0);
		
		x -= 32;
		y -= 32;
		if global.panic
			image_alpha = 1;
	}
}

// john ghost
if MOD.JohnGhost
{
	if !instance_exists(obj_exitgate) && !instance_exists(obj_hungrypillar) && !instance_exists(obj_lapportal)
	&& room != timesuproom && room != rank_room
	{
		call_later(1, time_source_units_frames, function()
		{
			var xx = obj_player1.x, yy = obj_player1.y;
		
			if yy > room_height / 2
				yy = room_height + 200;
			else
				yy = -200;
			if xx > room_width / 2
				xx += 100;
			else
				xx -= 100;
		
			instance_create_unique(xx, yy, obj_ghostfollow);
		}, false);
	}
}

// lap 3 blocks
if (instance_exists(obj_pizzaface) or global.lapmode == lapmode.laphell)
&& global.laps >= 2 && global.chasekind == 1
{
	with obj_reverselapblock
	{
		with instance_place(x, y, obj_platform)
			instance_destroy();
		with instance_place(x, y, obj_solid)
			instance_destroy();
	}
	with obj_lapblock
	{
		with instance_place(x, y, obj_teleporter)
			instance_destroy();
	}
	if room == graveyard_9b with obj_ghostwall
		instance_destroy();
	if room == space_11 with obj_antigrav
		instance_destroy();
	if room == industrial_2 with obj_destructibleplatform
		instance_destroy();
	
	var tiles = room_get_tile_layers();
	for(var i = 0, n = array_length(tiles); i < n; ++i)
	{
		var thislayer = tiles[i].layer_id;
		var lap3layer = layer_get_id(tiles[i].layer_name + "_Egg");
		
		if lap3layer != -1
		{
			layer_set_visible(lap3layer, true);
			layer_destroy(thislayer);
			
			with obj_secretblock
			{
				if targettiles == tiles[i].layer_name
					targettiles += "_Egg";
				else if is_array(targettiles)
					array_push(targettiles, tiles[i].layer_name + "_Egg");
			}
			with obj_secretbigblock
			{
				if targettiles == tiles[i].layer_name
					targettiles += "_Egg";
				else if is_array(targettiles)
					array_push(targettiles, tiles[i].layer_name + "_Egg");
			}
			with obj_secretmetalblock
			{
				if targettiles == tiles[i].layer_name
					targettiles += "_Egg";
				else if is_array(targettiles)
					array_push(targettiles, tiles[i].layer_name + "_Egg");
			}
		}
	}
}
else
	instance_destroy(obj_lapblock);

// swap john and gate
if MOD.FromTheTop
{
	MOD.EscapeInvert = true;
	if obj_player1.targetDoor == "A"
	{
		var levelinfo = level_info(global.leveltosave);
		if levelinfo != noone
		{
			if room == levelinfo.gate_room
			{
				obj_player1.targetDoor = "GATE";
				room_goto(levelinfo.john_room);
				delete levelinfo;
				exit;
			}
		}
		delete levelinfo;
	}
	
	var gate = noone;
	if instance_exists(obj_exitgate)
		var gate = obj_exitgate.id;
	
	var john = noone;
	if instance_exists(obj_hungrypillar)
		var john = obj_hungrypillar.id;
	
	with gate
	{
		instance_change(obj_hungrypillar, false);
		event_perform_object(obj_hungrypillar, ev_create, 0);
		y += 16;
	}
	with john
	{
		instance_change(obj_exitgate, false);
		event_perform_object(obj_exitgate, ev_create, 0);
		image_xscale = 1;
		
		y -= 16;
		instance_create(x - 16, y + 96, obj_doorX, {door: "GATE"});
		with obj_ghosthazard
			if global.panic instance_destroy();
	}
	instance_destroy(obj_lapportal, false);
	instance_destroy(obj_PTG, false);
}

// escape inversion
if MOD.EscapeInvert
{
	if !room_is_secret(room)
	{
		with obj_baddie
			escape = !escape;
		with obj_collect
		{
			if object_index == obj_escapecollect
			{
				image_alpha = 1;
				instance_change(obj_collect, false);
			}
			else if object_index == obj_collect
				instance_change(obj_escapecollect, false);
			event_perform_object(object_index, ev_create, 0);
		}
		with obj_bigcollect
		{
			if object_index == obj_escapecollectbig
			{
				image_alpha = 1;
				x += 32;
				y += 32;
				instance_change(obj_bigcollect, false);
			}
			else if object_index == obj_bigcollect
			{
				x -= 32;
				y -= 32;
				instance_change(obj_escapecollectbig, false);
			}
			event_perform_object(object_index, ev_create, 0);
		}
		instance_destroy(obj_ratblock, false);
	}
	
	with obj_minipillar
		type = 0;
	with obj_reverseminipillar
		type = 1;
	with obj_minipillar
		instance_change(obj_reverseminipillar, false);
	with obj_reverseminipillar
	{
		if type == 1
			instance_change(obj_minipillar, false);
	}
}
