enum debug_text_type
{
	normal,
	command,
	traced,
	error,
	msg
}

depth = -500;
DEBUG = (GM_build_type == "run");
if (parameter_count() > 2)
	DEBUG = true;
if (!DEBUG)
{
	var n = parameter_count();
	for (var i = 0; i < n; i++)
	{
		var s = parameter_string(i);
		if (true)
			DEBUG = true;
	}
}
if (!DEBUG)
	instance_destroy();
if (DEBUG)
{
	active = false;
	showoverlay = false;
	SHOW_DEBUG_OVERLAY = new DebugCommand("show_debug_overlay", "Toggles debug overlay", "", function()
	{
		show_debug_overlay(!showoverlay);
		showoverlay = !showoverlay;
	});
	ROOMCHECK = new DebugCommand("roomcheck", "", "", function()
	{
		instance_create_unique(0, 0, obj_roomcheck);
	});
	UNLOCK_TOPPINS = new DebugCommand("unlock_toppins", "Unlocks the toppins of the given level", "<level_name_ini>", function()
	{
		if (is_undefined(argument0))
			exit;
		ini_open_from_string(obj_savesystem.ini_str);
		ini_write_real("Toppin", concat(argument0, 1), true);
		ini_write_real("Toppin", concat(argument0, 2), true);
		ini_write_real("Toppin", concat(argument0, 3), true);
		ini_write_real("Toppin", concat(argument0, 4), true);
		ini_write_real("Toppin", concat(argument0, 5), true);
		obj_savesystem.ini_str = ini_close();
		gamesave_async_save();
	});
	UNLOCK_BOSS_KEY = new DebugCommand("unlock_boss_key", "Unlocks the boss key of the given world (1, 2, 3, 4)", "<number>", function()
	{
		if (is_undefined(argument0))
			exit;
		argument0 = real(argument0);
		ini_open_from_string(obj_savesystem.ini_str);
		var n = concat("w", argument0, "stick");
		ini_write_real(n, "bosskey", true);
		obj_savesystem.ini_str = ini_close();
		gamesave_async_save();
	});
	LOCKCAMERA = new DebugCommand("lockcam", "", "", function()
	{
		with (obj_camera)
			lock = !lock;
	});
	BOSSINVINCIBLE = new DebugCommand("bossinv", "", "", function()
	{
		global.boss_invincible = !global.boss_invincible;
	});
	HIDETILES = new DebugCommand("hidetiles", "", "<bool>", function()
	{
		if (is_undefined(argument0))
			global.hidetiles = !global.hidetiles;
		else
			global.hidetiles = argument0;
		layer_set_visible("Tiles_BG", !global.hidetiles);
		layer_set_visible("Tiles_BG2", !global.hidetiles);
		layer_set_visible("Tiles_BG3", !global.hidetiles);
		layer_set_visible("Tiles_1", !global.hidetiles);
		layer_set_visible("Tiles_2", !global.hidetiles);
		layer_set_visible("Tiles_3", !global.hidetiles);
		layer_set_visible("Tiles_4", !global.hidetiles);
		layer_set_visible("Tiles_Foreground1", !global.hidetiles);
		layer_set_visible("Tiles_Foreground2", !global.hidetiles);
		layer_set_visible("Tiles_Foreground3", !global.hidetiles);
	});
	THROWARC = new DebugCommand("throwarc", "", "<bool>", function()
	{
		if (is_undefined(argument0))
			global.throwarc = !global.throwarc;
		else
			global.throwarc = argument0;
	});
	GOTOEDITOR = new DebugCommand("editor", "", "", function()
	{
		with (obj_player)
		{
			targetRoom = editor_room;
			targetDoor = "A";
		}
		instance_create_unique(0, 0, 979);
	});
	NOCLIP = new DebugCommand("noclip", "", "", function()
	{
		with (obj_player1)
			state = states.debugstate;
	});
	GIVEKEY = new DebugCommand("givekey", "", "", function()
	{
		global.key_inv = true;
	});
	LOADTEST = new DebugCommand("loadtest", "", "", function()
	{
		with (obj_chat)
		{
			DoCommand("showcollisions 1");
			DoCommand("player_room rm_testing4 A");
		}
	});
	SETCOMBO = new DebugCommand("set_combo", "Set the combo", "<combo> <combotime:optional>", function(argument0, argument1)
	{
		if (argument0 == undefined)
			exit;
		if (argument1 == undefined)
			argument1 = 60;
		
		global.combo = real(argument0);
		global.combotime = real(argument1);
		with (obj_player)
			supercharge = 10;
	});
	GIVEHEAT = new DebugCommand("giveheat", "Gives heat", "", function()
	{
		global.style += 100;
	});
	ALLTOPPINS = new DebugCommand("alltoppins", "Adds all the toppins", "", function()
	{
		if (!instance_exists(obj_pizzakincheese))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese);
		if (!instance_exists(obj_pizzakintomato))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato);
		if (!instance_exists(obj_pizzakinsausage))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage);
		if (!instance_exists(obj_pizzakinpineapple))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple);
		if (!instance_exists(obj_pizzakinshroom))
			instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom);
		global.cheesefollow = true;
		global.tomatofollow = true;
		global.sausagefollow = true;
		global.pineapplefollow = true;
		global.shroomfollow = true;
	});
	PANIC = new DebugCommand("panic", "Toggles pizza time", "<fill>", function(argument0)
	{
		if !global.saveloaded
			exit;
		
		if (argument0 != undefined && argument0 != "")
			argument0 = get_number_string(argument0);
		else
			argument0 = 4000;
		
		global.panic = !global.panic;
		global.fill = argument0;
		if (global.panic)
			obj_camera.alarm[1] = 60;
		obj_tv.chunkmax = global.fill;
	});
	SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "<bool>", function(argument0)
	{
		if (argument0 == undefined)
			exit;
		argument0 = get_bool(argument0);
		if (argument0 != undefined)
		{
			showcollisions = argument0;
			event_perform(ev_other, ev_room_start);
		}
	});
	SHOW_HUD = new DebugCommand("showhud", "Shows the HUD", "<bool>", function(argument0)
	{
		if (argument0 == undefined)
			exit;
		argument0 = get_bool(argument0);
		show_debug_message(!argument0);
		if (argument0 != undefined)
		{
			showhud = argument0;
			with (obj_tv)
			{
				visible = argument0;
				show_debug_message(visible);
			}
			with (obj_camera)
			{
				visible = argument0;
				show_debug_message(visible);
			}
			with (obj_roomname)
			{
				visible = argument0;
				show_debug_message(visible);
			}
			with (obj_pigtotal)
			{
				visible = argument0;
				show_debug_message(visible);
			}
		}
	});
	PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "<targetRoom> <targetDoor>", function(Room, Door)
	{
		if (Room == undefined)
			exit;
		if (Door == undefined)
			Door = "A";
		
		Room = asset_get_index(Room);
		if (Room == -1)
			exit;
		
		// protection.
		if Room == Loadiingroom or Room == Longintro or Room == characterselect
			exit;
		
		with (obj_player)
		{
			targetRoom = Room;
			targetDoor = Door;
		}
		instance_create(x, y, obj_fadeout);
	});
	CAMERA_ZOOM = new DebugCommand("camera_zoom", "Zoom", "<targetzoom> <spd>", function(argument0, argument1)
	{
		if (argument0 == undefined)
			exit;
		if (argument1 != undefined)
			argument1 = get_number_string(argument1);
		
		with (obj_camera)
		{
			targetzoom = argument0;
			targetzoom = clamp(targetzoom, 0, max_zoom);
			if (argument1 != undefined)
				zoomspd = abs(argument1);
		}
	});
	DESTROYICE = new DebugCommand("destroyice", "", "", function()
	{
		instance_destroy(obj_iceblock);
		instance_destroy(obj_iceblockslope);
	});
	HARDMODE = new DebugCommand("hardmode", "Toggles hardmode", "<bool>", function(argument0)
	{
		if (argument0 == undefined)
			exit;
		argument0 = get_bool(argument0);
		show_debug_message(!argument0);
		if (argument0 != undefined)
		{
			global.hardmode = argument0;
			with (obj_hardmode)
				event_perform(ev_other, ev_room_start);
		}
	});
	PLAYER_SET_STATE = new DebugCommand("player_set_state", "Changes the player state", "<states.state>", function(argument0)
	{
		if (argument0 == undefined)
			exit;
		argument0 = ds_map_find_value(state_map, argument0);
		if (!is_undefined(argument0))
		{
			with (obj_player)
			{
				if (object_index == obj_player1 || global.coop)
				{
					state = argument0;
					var _spr = sprite_index;
					switch (argument0)
					{
						case 0:
							_spr = spr_idle;
							break;
						case 24:
							_spr = spr_cheesepep_idle;
							break;
						case 47:
							_spr = spr_knightpepidle;
							break;
						case 10:
							_spr = spr_firemouth;
							break;
						case 191:
							_spr = spr_player_ratmountidle;
							break;
					}
					sprite_index = _spr;
					image_index = 0;
				}
			}
		}
	});
	active = false;
	showcollisions = false;
	showhud = true;
	state_map = ds_map_create();
	ds_map_set(state_map, "states.normal", 0);
	ds_map_set(state_map, "states.cheesepep", 24);
	ds_map_set(state_map, "states.knightpep", 47);
	ds_map_set(state_map, "states.firemouth", 10);
	ds_map_set(state_map, "states.ratmount", 191);
	command_list = ds_list_create();
	ds_list_add(command_list, DESTROYICE, SHOW_HUD, SHOW_COLLISIONS, PLAYER_ROOM, CAMERA_ZOOM, HARDMODE, PLAYER_SET_STATE, PANIC, ALLTOPPINS, GIVEHEAT, ROOMCHECK);
	ds_list_add(command_list, SETCOMBO, GIVEKEY, LOADTEST, NOCLIP, THROWARC, HIDETILES, LOCKCAMERA, BOSSINVINCIBLE, UNLOCK_TOPPINS, UNLOCK_BOSS_KEY, SHOW_DEBUG_OVERLAY);
	input_text = "";
	text_list = ds_list_create();
	search_commands = ds_list_create();
	ds_list_clear(search_commands);
	search_w = 0;
	keyboard_string = "";
	function FindCommand(_id)
	{
		for (var i = 0; i < ds_list_size(command_list); i++)
		{
			var b = ds_list_find_value(command_list, i);
			if (b.command_id == _id)
				return b;
		}
		return undefined;
	}
	function DoCommand(text)
	{
		var commands = _string_split(text, " ");
		if (array_length(commands) > 1)
		{
			var c = FindCommand(commands[1]);
			if (c != undefined)
			{
				TextList_Add(1, text);
				array_delete(commands, 0, 2);
				c.Invoke(commands);
				return true;
			}
			else
			{
				TextList_Add(0, text);
				TextList_Add(3, "Invalid command");
			}
		}
		else
		{
			TextList_Add(0, text);
			TextList_Add(3, "No text typed");
		}
		return false;
	}
	function GetDouble(str)
	{
		var n = string_digits(str);
		if (n != undefined && n != "")
		{
			n = real(str);
			return n;
		}
		return undefined;
	}
	function get_bool(str)
	{
		if (str == "true")
		{
			str = true;
			return str;
		}
		else if (str == "false")
		{
			str = false;
			return str;
		}
		else if (is_real(real(string_digits(str))))
		{
			str = bool(real(string_digits(str)));
			return str;
		}
		return undefined;
	}
	function get_number_string(str)
	{
		var n = str;
		if (is_string(str))
		{
			n = real(string_digits(str));
			if (string_char_at(str, 1) == "-")
				n = -real(string_digits(str));
		}
		return n;
	}
}

DEBUG = true;